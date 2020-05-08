//
//  PrimitiveAtomicConformances.swift
//  
//  Licensed under Apache License v2.0
//

import CAtomicPrimitives

extension CAtomicPrimitiveRawPointer: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveRawPointer, desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveRawPointer, desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveRawPointer, desired: __owned CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveRawPointer, desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveRawPointer, desired: CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveRawPointer, desired: __owned CAtomicPrimitiveRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveMutableRawPointer: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveMutableRawPointer, desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveMutableRawPointer, desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveMutableRawPointer, desired: __owned CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveMutableRawPointer, desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveMutableRawPointer, desired: CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveMutableRawPointer, desired: __owned CAtomicPrimitiveMutableRawPointer, at pointer: UnsafeMutablePointer<CAtomicPrimitiveMutableRawPointer>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveMutableRawPointer)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveInt: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt, desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt, desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt, desired: __owned CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt, desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt, desired: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt, desired: __owned CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveUInt: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt, desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt, desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt, desired: __owned CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt, desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt, desired: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt, desired: __owned CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveInt8: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt8, desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt8, desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt8, desired: __owned CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt8, desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt8, desired: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt8, desired: __owned CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveUInt8: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt8, desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt8, desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt8, desired: __owned CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt8, desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt8)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt8, desired: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt8, desired: __owned CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt8)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveInt16: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt16, desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt16, desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt16, desired: __owned CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt16, desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt16, desired: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt16, desired: __owned CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveUInt16: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt16, desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt16, desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt16, desired: __owned CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt16, desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt16)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt16, desired: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt16, desired: __owned CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt16)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveInt32: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt32, desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt32, desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt32, desired: __owned CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt32, desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt32, desired: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt32, desired: __owned CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveUInt32: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt32, desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt32, desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt32, desired: __owned CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt32, desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt32)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt32, desired: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt32, desired: __owned CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt32)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveInt64: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt64, desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt64, desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt64, desired: __owned CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt64, desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveInt64, desired: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveInt64, desired: __owned CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}

extension CAtomicPrimitiveUInt64: PrimitiveAtomic
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt64, desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt64, desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt64, desired: __owned CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#else
  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicLoadOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesLoad(pointer, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicStoreOrdering)
  {
    CAtomicPrimitivesStore(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesExchange(pointer, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt64, desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt64)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer, successOrdering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: CAtomicPrimitiveUInt64, desired: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeStrong(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: CAtomicPrimitiveUInt64, desired: __owned CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, successOrdering: AtomicUpdateOrdering, failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: CAtomicPrimitiveUInt64)
  {
    var expected = expected
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicPrimitivesCompareAndExchangeWeak(pointer, $0, desired, successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, expected)
  }
#endif
}
