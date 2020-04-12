//
//  PrimitiveAtomicConformances.swift
//  
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension AtomicOptionalRawPointer: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicLoadOrdering) -> AtomicOptionalRawPointer
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicOptionalRawPointer
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicOptionalRawPointer, desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicOptionalRawPointer, desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicOptionalRawPointer, desired: __owned AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicLoadOrdering) -> AtomicOptionalRawPointer
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicOptionalRawPointer
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicOptionalRawPointer, desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicOptionalRawPointer, desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicOptionalRawPointer, desired: __owned AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicOptionalMutableRawPointer: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicLoadOrdering) -> AtomicOptionalMutableRawPointer
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicOptionalMutableRawPointer
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: __owned AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicLoadOrdering) -> AtomicOptionalMutableRawPointer
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicOptionalMutableRawPointer
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: __owned AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, ordering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, ordering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}
