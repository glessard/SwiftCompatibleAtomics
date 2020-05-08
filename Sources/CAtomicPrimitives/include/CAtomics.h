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

#define CATOMIC_PRIMITIVES_STRUCT(primitiveAtomicType, c11AtomicType) \
        typedef struct { volatile c11AtomicType a; } primitiveAtomicType;

// macros for atomic function generation

#define CATOMIC_PRIMITIVES_IS_LOCK_FREE(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicPrimitivesIsLockFree(primitiveAtomicType *_Nonnull atomic) \
        { return atomic_is_lock_free(&(atomic->a)); }

#define CATOMIC_PRIMITIVES_ENCODE(primitiveAtomicType, swiftCompatibleType, conversionType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(primitiveAtomicType.init(encoding:)) \
        primitiveAtomicType primitiveAtomicType##Encode(swiftCompatibleType value) \
        { primitiveAtomicType s; s.a = (conversionType) value; return s; }

#define CATOMIC_PRIMITIVES_DECODE(primitiveAtomicType, swiftCompatibleType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(primitiveAtomicType.decode(self:)) \
        swiftCompatibleType primitiveAtomicType##Decode(primitiveAtomicType s) \
        { return (swiftCompatibleType) s.a; }

#define CATOMIC_PRIMITIVES_LOAD(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        primitiveAtomicType CAtomicPrimitivesLoad(primitiveAtomicType *_Nonnull atomic, enum LoadMemoryOrder order) \
        { primitiveAtomicType s; s.a = atomic_load_explicit(&(atomic->a), order); return s; }

#define CATOMIC_PRIMITIVES_STORE(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        void CAtomicPrimitivesStore(primitiveAtomicType *_Nonnull atomic, primitiveAtomicType value, enum StoreMemoryOrder order) \
        { atomic_store_explicit(&(atomic->a), value.a, order); }

#define CATOMIC_PRIMITIVES_SWAP(primitiveAtomicType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        primitiveAtomicType CAtomicPrimitivesExchange(primitiveAtomicType *_Nonnull atomic, primitiveAtomicType value, enum UpdateMemoryOrder order) \
        { primitiveAtomicType s; s.a = atomic_exchange_explicit(&(atomic->a), value.a, order); return s; }

#define CATOMIC_PRIMITIVES_WEAK_CAS(primitiveAtomicType, conversionType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicPrimitivesCompareAndExchangeWeak(primitiveAtomicType *_Nonnull atomic, \
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

#define CATOMIC_PRIMITIVES_STRONG_CAS(primitiveAtomicType, conversionType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicPrimitivesCompareAndExchangeStrong(primitiveAtomicType *_Nonnull atomic, \
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

#define CATOMIC_PRIMITIVES_GENERATE(primitiveAtomicType, swiftCompatibleType, conversionType) \
        CATOMIC_PRIMITIVES_STRUCT(primitiveAtomicType, _Atomic(conversionType)) \
        CATOMIC_PRIMITIVES_IS_LOCK_FREE(primitiveAtomicType) \
        CATOMIC_PRIMITIVES_ENCODE(primitiveAtomicType, swiftCompatibleType, conversionType) \
        CATOMIC_PRIMITIVES_DECODE(primitiveAtomicType, swiftCompatibleType) \
        CATOMIC_PRIMITIVES_LOAD(primitiveAtomicType) \
        CATOMIC_PRIMITIVES_STORE(primitiveAtomicType) \
        CATOMIC_PRIMITIVES_SWAP(primitiveAtomicType) \
        CATOMIC_PRIMITIVES_STRONG_CAS(primitiveAtomicType, conversionType) \
        CATOMIC_PRIMITIVES_WEAK_CAS(primitiveAtomicType, conversionType)

// generate atomic pointer types + functions

CATOMIC_PRIMITIVES_GENERATE(CAtomicPrimitiveRawPointer, const void* _Nullable, uintptr_t)
CATOMIC_PRIMITIVES_GENERATE(CAtomicPrimitiveMutableRawPointer, void* _Nullable, uintptr_t)

// macro to generate atomic struct + functions for integer types

#define CATOMIC_PRIMITIVES_RMW(primitiveAtomicType, pName, op, opName) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        primitiveAtomicType CAtomicPrimitives##opName(primitiveAtomicType *_Nonnull atomic, primitiveAtomicType pName, enum UpdateMemoryOrder order) \
        { primitiveAtomicType s; s.a = atomic_##op##_explicit(&(atomic->a), pName.a, order); return s; }

#define CATOMIC_PRIMITIVES_INT_GENERATE(primitiveAtomicType, swiftCompatibleType) \
        CATOMIC_PRIMITIVES_GENERATE(primitiveAtomicType, swiftCompatibleType, swiftCompatibleType) \
        CATOMIC_PRIMITIVES_RMW(primitiveAtomicType, increment, fetch_add, Add) \
        CATOMIC_PRIMITIVES_RMW(primitiveAtomicType, increment, fetch_sub, Subtract) \
        CATOMIC_PRIMITIVES_RMW(primitiveAtomicType, bits, fetch_or, BitwiseOr) \
        CATOMIC_PRIMITIVES_RMW(primitiveAtomicType, bits, fetch_xor, BitwiseXor) \
        CATOMIC_PRIMITIVES_RMW(primitiveAtomicType, bits, fetch_and, BitwiseAnd)

// generate atomic integer types + functions

CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveInt, intptr_t)
CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveUInt, uintptr_t)

CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveInt8, signed char)
CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveUInt8, unsigned char)

CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveInt16, short)
CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveUInt16, unsigned short)

CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveInt32, int)
CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveUInt32, unsigned int)

CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveInt64, long long)
CATOMIC_PRIMITIVES_INT_GENERATE(CAtomicPrimitiveUInt64, unsigned long long)

#undef CATOMIC_PRIMITIVES_ENCODE
#undef CATOMIC_PRIMITIVES_DECODE
#undef CATOMIC_PRIMITIVES_RMW
#undef CATOMIC_PRIMITIVES_INT_GENERATE
#undef CATOMIC_PRIMITIVES_GENERATE

// fence

static __inline__ __attribute__((__always_inline__))
void CAtomicPrimitivesThreadFence(enum UpdateMemoryOrder order)
{
  atomic_thread_fence(order);
}

#undef SWIFT_ENUM
#undef SWIFT_NAME
#undef __has32bitPointer__

#undef CATOMIC_PRIMITIVES_STRUCT
#undef CATOMIC_PRIMITIVES_IS_LOCK_FREE

#undef CATOMIC_PRIMITIVES_LOAD
#undef CATOMIC_PRIMITIVES_STORE
#undef CATOMIC_PRIMITIVES_SWAP
#undef CATOMIC_PRIMITIVES_WEAK_CAS
#undef CATOMIC_PRIMITIVES_STRONG_CAS

#endif
