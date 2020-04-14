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
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicOptionalRawPointer, desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicOptionalRawPointer, desired: __owned AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicOptionalRawPointer, desired: AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicOptionalRawPointer, desired: __owned AtomicOptionalRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: __owned AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicOptionalMutableRawPointer, desired: __owned AtomicOptionalMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicOptionalMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicOptionalMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicInt: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicLoadOrdering) -> AtomicInt
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt, desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt, desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt, desired: __owned AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicLoadOrdering) -> AtomicInt
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt, desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt, desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt, desired: __owned AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicUInt: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicLoadOrdering) -> AtomicUInt
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt, desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt, desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt, desired: __owned AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicLoadOrdering) -> AtomicUInt
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt, desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt, desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt, desired: __owned AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicInt8: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicLoadOrdering) -> AtomicInt8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt8, desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt8, desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt8, desired: __owned AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicLoadOrdering) -> AtomicInt8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt8, desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt8, desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt8, desired: __owned AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicUInt8: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicLoadOrdering) -> AtomicUInt8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt8, desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt8, desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt8, desired: __owned AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicLoadOrdering) -> AtomicUInt8
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt8, desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt8, desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt8, desired: __owned AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicInt16: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicLoadOrdering) -> AtomicInt16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt16, desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt16, desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt16, desired: __owned AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicLoadOrdering) -> AtomicInt16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt16, desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt16, desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt16, desired: __owned AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicUInt16: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicLoadOrdering) -> AtomicUInt16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt16, desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt16, desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt16, desired: __owned AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicLoadOrdering) -> AtomicUInt16
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt16, desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt16, desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt16, desired: __owned AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicInt32: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicLoadOrdering) -> AtomicInt32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt32, desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt32, desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt32, desired: __owned AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicLoadOrdering) -> AtomicInt32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt32, desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt32, desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt32, desired: __owned AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicUInt32: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicLoadOrdering) -> AtomicUInt32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt32, desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt32, desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt32, desired: __owned AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicLoadOrdering) -> AtomicUInt32
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt32, desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt32, desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt32, desired: __owned AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicInt64: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicLoadOrdering) -> AtomicInt64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt64, desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicInt64, desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt64, desired: __owned AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicLoadOrdering) -> AtomicInt64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt64, desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicInt64, desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt64, desired: __owned AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicUInt64: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicLoadOrdering) -> AtomicUInt64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt64, desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicUInt64, desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt64, desired: __owned AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicLoadOrdering) -> AtomicUInt64
  {
    return CAtomicsLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt64, desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicUInt64, desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt64, desired: __owned AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}