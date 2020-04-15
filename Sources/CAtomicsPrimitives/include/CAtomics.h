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

#define CATOMICS_PRIMITIVES_STRUCT(swiftType, atomicType) \
        typedef struct { volatile atomicType a; } swiftType;

// macros for atomic function generation

#define CATOMICS_PRIMITIVES_IS_LOCK_FREE(swiftType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicsIsLockFree(swiftType *_Nonnull atomic) \
        { return atomic_is_lock_free(&(atomic->a)); }

#define CATOMICS_PRIMITIVES_DECODE(swiftType, parameterType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(swiftType.decode(self:)) \
        parameterType swiftType##Decode(swiftType s) \
        { return (parameterType) s.a; }

#define CATOMICS_PRIMITIVES_CREATE(swiftType, parameterType, compatibleType) \
        static __inline__ __attribute__((__always_inline__)) \
        SWIFT_NAME(swiftType.init(_:)) \
        swiftType swiftType##Create(parameterType value) \
        { swiftType s; s.a = (compatibleType) value; return s; }

#define CATOMICS_PRIMITIVES_LOAD(swiftType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        swiftType CAtomicsLoad(swiftType *_Nonnull atomic, enum LoadMemoryOrder order) \
        { swiftType s; s.a = atomic_load_explicit(&(atomic->a), order); return s; }

#define CATOMICS_PRIMITIVES_STORE(swiftType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        void CAtomicsStore(swiftType *_Nonnull atomic, swiftType value, enum StoreMemoryOrder order) \
        { atomic_store_explicit(&(atomic->a), value.a, order); }

#define CATOMICS_PRIMITIVES_SWAP(swiftType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        swiftType CAtomicsExchange(swiftType *_Nonnull atomic, swiftType value, enum UpdateMemoryOrder order) \
        { swiftType s; s.a = atomic_exchange_explicit(&(atomic->a), value.a, order); return s; }

#define CATOMICS_PRIMITIVES_RMW(swiftType, pName, op, opName) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        swiftType CAtomics##opName(swiftType *_Nonnull atomic, swiftType pName, enum UpdateMemoryOrder order) \
        { swiftType s; s.a = atomic_##op##_explicit(&(atomic->a), pName.a, order); return s; }

#define CATOMICS_PRIMITIVES_WEAK_CAS(swiftType, parameterType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicsCompareAndExchangeWeak(swiftType *_Nonnull atomic, \
                                             swiftType *_Nonnull current, swiftType future, \
                                             enum UpdateMemoryOrder orderSwap, enum LoadMemoryOrder orderLoad) \
        { \
          assert((unsigned int)orderLoad <= (unsigned int)orderSwap); \
          assert(orderSwap == __ATOMIC_RELEASE ? orderLoad == __ATOMIC_RELAXED : true); \
          parameterType c = current->a; \
          _Bool b = atomic_compare_exchange_weak_explicit(&(atomic->a), &c, future.a, orderSwap, orderLoad); \
          current->a = c; \
          return b; \
        }

#define CATOMICS_PRIMITIVES_STRONG_CAS(swiftType, parameterType) \
        static __inline__ __attribute__((__always_inline__)) \
        __attribute__((overloadable)) \
        _Bool CAtomicsCompareAndExchangeStrong(swiftType *_Nonnull atomic, \
                                               swiftType *_Nonnull current, swiftType future, \
                                               enum UpdateMemoryOrder orderSwap, enum LoadMemoryOrder orderLoad) \
        { \
          assert((unsigned int)orderLoad <= (unsigned int)orderSwap); \
          assert(orderSwap == __ATOMIC_RELEASE ? orderLoad == __ATOMIC_RELAXED : true); \
          parameterType c = current->a; \
          _Bool b = atomic_compare_exchange_strong_explicit(&(atomic->a), &c, future.a, orderSwap, orderLoad); \
          current->a = c; \
          return b; \
        }

// macro to generate atomic struct + functions

#define CATOMICS_PRIMITIVES_GENERATE(swiftType, atomicType, parameterType, compatibleType) \
        CATOMICS_PRIMITIVES_STRUCT(swiftType, atomicType) \
        CATOMICS_PRIMITIVES_IS_LOCK_FREE(swiftType) \
        CATOMICS_PRIMITIVES_DECODE(swiftType, parameterType) \
        CATOMICS_PRIMITIVES_CREATE(swiftType, parameterType, compatibleType) \
        CATOMICS_PRIMITIVES_LOAD(swiftType) \
        CATOMICS_PRIMITIVES_STORE(swiftType) \
        CATOMICS_PRIMITIVES_SWAP(swiftType) \
        CATOMICS_PRIMITIVES_STRONG_CAS(swiftType, compatibleType) \
        CATOMICS_PRIMITIVES_WEAK_CAS(swiftType, compatibleType)

// generate atomic pointer types + functions

CATOMICS_PRIMITIVES_GENERATE(AtomicOptionalRawPointer, atomic_uintptr_t, const void* _Nullable, uintptr_t)
CATOMICS_PRIMITIVES_GENERATE(AtomicOptionalMutableRawPointer, atomic_uintptr_t, void* _Nullable, uintptr_t)

// CATOMICS_PRIMITIVES_GENERATE(AtomicRawPointer, atomic_uintptr_t, const void* _Nonnull, uintptr_t)
// CATOMICS_PRIMITIVES_GENERATE(AtomicMutableRawPointer, atomic_uintptr_t, void* _Nonnull, uintptr_t)

// macro to generate atomic struct + functions for integer types

#define CATOMICS_PRIMITIVES_INT_GENERATE(swiftType, atomicType, parameterType) \
        CATOMICS_PRIMITIVES_GENERATE(swiftType, atomicType, parameterType, parameterType) \
        CATOMICS_PRIMITIVES_RMW(swiftType, increment, fetch_add, Add) \
        CATOMICS_PRIMITIVES_RMW(swiftType, increment, fetch_sub, Subtract) \
        CATOMICS_PRIMITIVES_RMW(swiftType, bits, fetch_or, BitwiseOr) \
        CATOMICS_PRIMITIVES_RMW(swiftType, bits, fetch_xor, BitwiseXor) \
        CATOMICS_PRIMITIVES_RMW(swiftType, bits, fetch_and, BitwiseAnd)

// generate atomic integer types + functions

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt, atomic_intptr_t, intptr_t)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt, atomic_uintptr_t, uintptr_t)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt8, atomic_schar, signed char)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt8, atomic_uchar, unsigned char)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt16, atomic_short, short)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt16, atomic_ushort, unsigned short)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt32, atomic_int, int)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt32, atomic_uint, unsigned int)

CATOMICS_PRIMITIVES_INT_GENERATE(AtomicInt64, atomic_llong, long long)
CATOMICS_PRIMITIVES_INT_GENERATE(AtomicUInt64, atomic_ullong, unsigned long long)

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

#undef CATOMICS_PRIMITIVES_DECODE
#undef CATOMICS_PRIMITIVES_CREATE

#undef CATOMICS_PRIMITIVES_LOAD
#undef CATOMICS_PRIMITIVES_STORE
#undef CATOMICS_PRIMITIVES_SWAP
#undef CATOMICS_PRIMITIVES_RMW
#undef CATOMICS_PRIMITIVES_WEAK_CAS
#undef CATOMICS_PRIMITIVES_STRONG_CAS

#undef CATOMICS_PRIMITIVES_GENERATE
#undef CATOMICS_PRIMITIVES_INT_GENERATE

#endif
