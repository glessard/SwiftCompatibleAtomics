//
//  CAtomics.h
//
//  Created by Guillaume Lessard on 2015-05-21.
//  Copyright (c) 2015-2020 Guillaume Lessard. All rights reserved.
//  This file is distributed under the BSD 3-clause license. See LICENSE for details.
//
// See: http://clang.llvm.org/doxygen/stdatomic_8h_source.html
//      http://clang.llvm.org/docs/LanguageExtensions.html#c11-atomic-builtins
//      http://en.cppreference.com/w/c/atomic
//      http://en.cppreference.com/w/c/atomic/atomic_compare_exchange

#ifndef c_atomics_primitives_h
#define c_atomics_primitives_h

#if !__has_include(<stdatomic.h>) || !__has_extension(c_atomic)
#error This compiler is missing required features to bridge C atomics into Swift
#endif

#if !__has_feature(nullability)
#error This module relies on compiler support for the nullability attribute
#endif

#include <stdatomic.h>
#include <stdbool.h>
#include <assert.h>

#if __has_attribute(enum_extensibility)
#define SWIFT_ENUM(_name,extensibility) enum __attribute__((enum_extensibility(extensibility))) _name
#else
#define SWIFT_ENUM(_name,extensibility) enum _name
#endif

#if __has_attribute(swift_name)
#define SWIFT_NAME(_name) __attribute__((swift_name(#_name)))
#else
#define SWIFT_NAME(_name)
#endif

#if !defined(__x86_64__) && !defined(__arm64__)
#define __has32bitPointer__
#endif

// memory order

SWIFT_ENUM(UpdateMemoryOrder, open)
{
  UpdateMemoryOrder_relaxed =    __ATOMIC_RELAXED,
  // UpdateMemoryOrder_consume = __ATOMIC_CONSUME,
  UpdateMemoryOrder_acquire =    __ATOMIC_ACQUIRE,
  UpdateMemoryOrder_release =    __ATOMIC_RELEASE,
  UpdateMemoryOrder_acqrel  =    __ATOMIC_ACQ_REL,
  UpdateMemoryOrder_sequential = __ATOMIC_SEQ_CST
};

SWIFT_ENUM(LoadMemoryOrder, open)
{
  LoadMemoryOrder_relaxed =    __ATOMIC_RELAXED,
  // LoadMemoryOrder_consume = __ATOMIC_CONSUME,
  LoadMemoryOrder_acquire =    __ATOMIC_ACQUIRE,
  LoadMemoryOrder_sequential = __ATOMIC_SEQ_CST
};

SWIFT_ENUM(StoreMemoryOrder, open)
{
  StoreMemoryOrder_relaxed =    __ATOMIC_RELAXED,
  StoreMemoryOrder_release =    __ATOMIC_RELEASE,
  StoreMemoryOrder_sequential = __ATOMIC_SEQ_CST
};

// macro for atomic type generation

#define CATOMICS_PRIMITIVES_STRUCT(primitiveAtomicType, c11AtomicType) \
        typedef struct { volatile c11AtomicType a; } primitiveAtomicType;

// macros for atomic function generation

#define CATOMICS_PRIMITIVES_IS_LOCK_FREE(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicsIsLockFree(primitiveAtomicType *_Nonnull atomic) \
        { return atomic_is_lock_free(&(atomic->a)); }

#define CATOMICS_PRIMITIVES_ENCODE(primitiveAtomicType, swiftCompatibleType, conversionType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(primitiveAtomicType.init(encoding:)) \
        primitiveAtomicType primitiveAtomicType##Encode(swiftCompatibleType value) \
        { primitiveAtomicType s; s.a = (conversionType) value; return s; }

#define CATOMICS_PRIMITIVES_DECODE(primitiveAtomicType, swiftCompatibleType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(primitiveAtomicType.decode(self:)) \
        swiftCompatibleType primitiveAtomicType##Decode(primitiveAtomicType s) \
        { return (swiftCompatibleType) s.a; }

#define CATOMICS_PRIMITIVES_LOAD(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        primitiveAtomicType CAtomicsLoad(primitiveAtomicType *_Nonnull atomic, enum LoadMemoryOrder order) \
        { primitiveAtomicType s; s.a = atomic_load_explicit(&(atomic->a), order); return s; }

#define CATOMICS_PRIMITIVES_STORE(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        void CAtomicsStore(primitiveAtomicType *_Nonnull atomic, primitiveAtomicType value, enum StoreMemoryOrder order) \
        { atomic_store_explicit(&(atomic->a), value.a, order); }

#define CATOMICS_PRIMITIVES_SWAP(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        primitiveAtomicType CAtomicsExchange(primitiveAtomicType *_Nonnull atomic, primitiveAtomicType value, enum UpdateMemoryOrder order) \
        { primitiveAtomicType s; s.a = atomic_exchange_explicit(&(atomic->a), value.a, order); return s; }

#define CATOMICS_PRIMITIVES_WEAK_CAS(primitiveAtomicType, conversionType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicsCompareAndExchangeWeak(primitiveAtomicType *_Nonnull atomic, \
                                             primitiveAtomicType *_Nonnull current, primitiveAtomicType future, \
                                             enum UpdateMemoryOrder orderSwap, enum LoadMemoryOrder orderLoad) \
        { \
          assert((unsigned int)orderLoad <= (unsigned int)orderSwap); \
          assert(orderSwap == __ATOMIC_RELEASE ? orderLoad == __ATOMIC_RELAXED : true); \
          conversionType c = current->a; \
          _Bool b = atomic_compare_exchange_weak_explicit(&(atomic->a), &c, future.a, orderSwap, orderLoad); \
          current->a = c; \
          return b; \
        }

#define CATOMICS_PRIMITIVES_STRONG_CAS(primitiveAtomicType, conversionType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicsCompareAndExchangeStrong(primitiveAtomicType *_Nonnull atomic, \
                                               primitiveAtomicType *_Nonnull current, primitiveAtomicType future, \
                                               enum UpdateMemoryOrder orderSwap, enum LoadMemoryOrder orderLoad) \
        { \
          assert((unsigned int)orderLoad <= (unsigned int)orderSwap); \
          assert(orderSwap == __ATOMIC_RELEASE ? orderLoad == __ATOMIC_RELAXED : true); \
          conversionType c = current->a; \
          _Bool b = atomic_compare_exchange_strong_explicit(&(atomic->a), &c, future.a, orderSwap, orderLoad); \
          current->a = c; \
          return b; \
        }

// macro to generate atomic struct + functions

#define CATOMICS_PRIMITIVES_GENERATE(primitiveAtomicType, swiftCompatibleType, conversionType) \
        CATOMICS_PRIMITIVES_STRUCT(primitiveAtomicType, _Atomic(conversionType)) \
        CATOMICS_PRIMITIVES_IS_LOCK_FREE(primitiveAtomicType) \
        CATOMICS_PRIMITIVES_ENCODE(primitiveAtomicType, swiftCompatibleType, conversionType) \
        CATOMICS_PRIMITIVES_DECODE(primitiveAtomicType, swiftCompatibleType) \
        CATOMICS_PRIMITIVES_LOAD(primitiveAtomicType) \
        CATOMICS_PRIMITIVES_STORE(primitiveAtomicType) \
        CATOMICS_PRIMITIVES_SWAP(primitiveAtomicType) \
        CATOMICS_PRIMITIVES_STRONG_CAS(primitiveAtomicType, conversionType) \
        CATOMICS_PRIMITIVES_WEAK_CAS(primitiveAtomicType, conversionType)

// generate atomic pointer types + functions

CATOMICS_PRIMITIVES_GENERATE(AtomicRawPointer, const void* _Nullable, uintptr_t)
CATOMICS_PRIMITIVES_GENERATE(AtomicMutableRawPointer, void* _Nullable, uintptr_t)

// macro to generate atomic struct + functions for integer types

#define CATOMICS_PRIMITIVES_RMW(primitiveAtomicType, pName, op, opName) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        primitiveAtomicType CAtomics##opName(primitiveAtomicType *_Nonnull atomic, primitiveAtomicType pName, enum UpdateMemoryOrder order) \
        { primitiveAtomicType s; s.a = atomic_##op##_explicit(&(atomic->a), pName.a, order); return s; }

#define CATOMICS_PRIMITIVES_INT_GENERATE(primitiveAtomicType, swiftCompatibleType) \
        CATOMICS_PRIMITIVES_GENERATE(primitiveAtomicType, swiftCompatibleType, swiftCompatibleType) \
        CATOMICS_PRIMITIVES_RMW(primitiveAtomicType, increment, fetch_add, Add) \
        CATOMICS_PRIMITIVES_RMW(primitiveAtomicType, increment, fetch_sub, Subtract) \
        CATOMICS_PRIMITIVES_RMW(primitiveAtomicType, bits, fetch_or, BitwiseOr) \
        CATOMICS_PRIMITIVES_RMW(primitiveAtomicType, bits, fetch_xor, BitwiseXor) \
        CATOMICS_PRIMITIVES_RMW(primitiveAtomicType, bits, fetch_and, BitwiseAnd)

// generate atomic integer types + functions

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt, intptr_t)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt, uintptr_t)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt8, signed char)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt8, unsigned char)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt16, short)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt16, unsigned short)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt32, int)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt32, unsigned int)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt64, long long)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt64, unsigned long long)

#undef CATOMICS_PRIMITIVES_ENCODE
#undef CATOMICS_PRIMITIVES_DECODE
#undef CATOMICS_PRIMITIVES_RMW
#undef CATOMICS_PRIMITIVES_INT_GENERATE
#undef CATOMICS_PRIMITIVES_GENERATE

// tagged pointers -- double-word load, store and CAS

#define CATOMICS_PRIMITIVES_TAGGED_POINTER_STRUCT(unionType, translationType, pointerType) \
        typedef union { \
          translationType tag_ptr; \
          struct { \
            pointerType ptr; \
            intptr_t tag; \
          }; \
        } unionType;

#define CATOMICS_PRIMITIVES_TAGGED_POINTER_CREATE(unionType, pointerType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(unionType.init(_:tag:)) \
        unionType unionType##Create(pointerType p, intptr_t tag) \
        { unionType s; s.tag = tag; s.ptr = p; return s; }

#if defined(__has32bitPointer__)
#define __UNION_TYPE long long
#else
#define __UNION_TYPE __int128
#endif

#define CATOMICS_PRIMITIVES_TAGGED_POINTER_GENERATE(unionType, pointerType) \
        CATOMICS_PRIMITIVES_TAGGED_POINTER_STRUCT(unionType, __UNION_TYPE, pointerType) \
        CATOMICS_PRIMITIVES_TAGGED_POINTER_CREATE(unionType, pointerType)

CATOMICS_PRIMITIVES_TAGGED_POINTER_GENERATE(TaggedRawPointer, const void* _Nullable)
CATOMICS_PRIMITIVES_TAGGED_POINTER_GENERATE(TaggedMutableRawPointer, void* _Nullable)

#undef CATOMICS_PRIMITIVES_TAGGED_POINTER_GENERATE
#undef CATOMICS_PRIMITIVES_TAGGED_POINTER_STRUCT
#undef CATOMICS_PRIMITIVES_TAGGED_POINTER_CREATE
#undef __UNION_TYPE

// fence

static __inline__ __attribute__((__always_inline__))
void CAtomicsThreadFence(enum UpdateMemoryOrder order)
{
  atomic_thread_fence(order);
}

#undef SWIFT_ENUM
#undef SWIFT_NAME
#undef __has32bitPointer__

#undef CATOMICS_PRIMITIVES_STRUCT
#undef CATOMICS_PRIMITIVES_IS_LOCK_FREE

#undef CATOMICS_PRIMITIVES_LOAD
#undef CATOMICS_PRIMITIVES_STORE
#undef CATOMICS_PRIMITIVES_SWAP
#undef CATOMICS_PRIMITIVES_WEAK_CAS
#undef CATOMICS_PRIMITIVES_STRONG_CAS

#endif
