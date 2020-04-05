//
//  AtomicIntegers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomics

extension Int: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicInt

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Int) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Int, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int, desired: Int,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int, desired: Int,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Int, desired: Int,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Int) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Int, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int, desired: Int,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int, desired: Int,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Int, desired: Int,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension Int: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension UInt: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicUInt

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UInt) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt, desired: UInt,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt, desired: UInt,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: UInt, desired: UInt,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UInt) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt, desired: UInt,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt, desired: UInt,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: UInt, desired: UInt,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UInt: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension Int8: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicInt8

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Int8) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int8, desired: Int8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int8, desired: Int8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Int8, desired: Int8,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Int8) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int8, desired: Int8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int8, desired: Int8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Int8, desired: Int8,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension Int8: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int8,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int8,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension UInt8: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicUInt8

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UInt8) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt8, desired: UInt8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt8, desired: UInt8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: UInt8, desired: UInt8,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UInt8) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt8, desired: UInt8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt8, desired: UInt8,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: UInt8, desired: UInt8,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt8)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UInt8: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt8,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt8,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt8,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt8,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension Int16: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicInt16

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Int16) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int16, desired: Int16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int16, desired: Int16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Int16, desired: Int16,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Int16) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int16, desired: Int16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int16, desired: Int16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Int16, desired: Int16,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension Int16: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int16,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int16,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension UInt16: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicUInt16

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UInt16) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt16, desired: UInt16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt16, desired: UInt16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: UInt16, desired: UInt16,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UInt16) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt16, desired: UInt16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt16, desired: UInt16,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: UInt16, desired: UInt16,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt16)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UInt16: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt16,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt16,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt16,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt16,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension Int32: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicInt32

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Int32) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int32, desired: Int32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int32, desired: Int32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Int32, desired: Int32,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Int32) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int32, desired: Int32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int32, desired: Int32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Int32, desired: Int32,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension Int32: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int32,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int32,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension UInt32: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicUInt32

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UInt32) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt32, desired: UInt32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt32, desired: UInt32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: UInt32, desired: UInt32,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UInt32) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt32, desired: UInt32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt32, desired: UInt32,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: UInt32, desired: UInt32,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt32)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UInt32: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt32,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt32,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt32,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt32,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension Int64: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicInt64

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Int64) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int64, desired: Int64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Int64, desired: Int64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Int64, desired: Int64,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Int64) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Int64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int64, desired: Int64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Int64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Int64, desired: Int64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Int64, desired: Int64,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Int64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension Int64: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int64,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int64,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension UInt64: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicUInt64

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UInt64) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt64, desired: UInt64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UInt64, desired: UInt64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: UInt64, desired: UInt64,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UInt64) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UInt64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt64, desired: UInt64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UInt64, desired: UInt64,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired,
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: UInt64, desired: UInt64,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UInt64)
  {
    var expected = expected
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired,
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UInt64: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt64,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt64,
                                                     at pointer: UnsafeMutablePointer<AtomicStorage>,
                                                     ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt64,
                                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                                             ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt64,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}
