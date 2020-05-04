//
//  PrimitiveAtomicConformances.swift
//  
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension AtomicRawPointer: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicLoadOrdering) -> AtomicRawPointer
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicRawPointer
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicRawPointer, desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicRawPointer, desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicRawPointer, desired: __owned AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicLoadOrdering) -> AtomicRawPointer
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicRawPointer
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicRawPointer, desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicRawPointer, desired: AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicRawPointer, desired: __owned AtomicRawPointer, at pointer: UnsafeMutablePointer<AtomicRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension AtomicMutableRawPointer: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicLoadOrdering) -> AtomicMutableRawPointer
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicMutableRawPointer
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicMutableRawPointer, desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: AtomicMutableRawPointer, desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicMutableRawPointer, desired: __owned AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicLoadOrdering) -> AtomicMutableRawPointer
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicUpdateOrdering) -> AtomicMutableRawPointer
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicMutableRawPointer, desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: AtomicMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: AtomicMutableRawPointer, desired: AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicMutableRawPointer, desired: __owned AtomicMutableRawPointer, at pointer: UnsafeMutablePointer<AtomicMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt, desired: __owned AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicLoadOrdering) -> AtomicInt
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt, desired: __owned AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt, desired: __owned AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicLoadOrdering) -> AtomicUInt
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt, desired: __owned AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt8, desired: __owned AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicLoadOrdering) -> AtomicInt8
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt8, desired: __owned AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt8, desired: __owned AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicLoadOrdering) -> AtomicUInt8
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt8, desired: __owned AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt16, desired: __owned AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicLoadOrdering) -> AtomicInt16
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt16, desired: __owned AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt16, desired: __owned AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicLoadOrdering) -> AtomicUInt16
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt16, desired: __owned AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt32, desired: __owned AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicLoadOrdering) -> AtomicInt32
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt32, desired: __owned AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt32, desired: __owned AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicLoadOrdering) -> AtomicUInt32
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt32, desired: __owned AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicInt64, desired: __owned AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicLoadOrdering) -> AtomicInt64
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicInt64, desired: __owned AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
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
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: AtomicUInt64, desired: __owned AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicLoadOrdering) -> AtomicUInt64
  {
    return CAtomicsPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicsPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsPrimitivesExchange(pointer, desired, ordering._rawValue)
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
      CAtomicsPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: AtomicUInt64, desired: __owned AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: AtomicUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}
