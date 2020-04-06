//
//  AtomicUnmanaged.swift
//
//  Licensed under Apache License v2.0
//

import CAtomics

extension Unmanaged: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicRawPointer

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Unmanaged) -> AtomicStorage
  {
    return AtomicStorage(value.toOpaque())
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>)
  {
    pointer.deinitialize(count: 1)
  }

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Unmanaged
  {
    return Unmanaged.fromOpaque(CAtomicsLoad(pointer, ordering._rawValue))
  }

  @inlinable
  public static func atomicStore(_ desired: Unmanaged, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired.toOpaque(), ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Unmanaged, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Unmanaged
  {
    return Unmanaged.fromOpaque(CAtomicsExchange(pointer, desired.toOpaque(), ordering._rawValue))
  }

  @inlinable
  public static func atomicCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    var expected = UnsafeRawPointer(expected.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired.toOpaque(),
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, Unmanaged.fromOpaque(expected))
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    var expected = UnsafeRawPointer(expected.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired.toOpaque(),
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, Unmanaged.fromOpaque(expected))
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Unmanaged) -> AtomicStorage
  {
    return AtomicStorage(value.toOpaque())
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>)
  {
    pointer.deinitialize(count: 1)
  }

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Unmanaged
  {
    return Unmanaged.fromOpaque(CAtomicsLoad(pointer, ordering._rawValue))
  }

  @inline(__always)
  public static func atomicStore(_ desired: Unmanaged, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired.toOpaque(), ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Unmanaged, at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Unmanaged
  {
    return Unmanaged.fromOpaque(CAtomicsExchange(pointer, desired.toOpaque(), ordering._rawValue))
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: pointer,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    var expected = UnsafeRawPointer(expected.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired.toOpaque(),
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, Unmanaged.fromOpaque(expected))
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    var expected = UnsafeRawPointer(expected.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired.toOpaque(),
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, Unmanaged.fromOpaque(expected))
  }
#endif
}

extension Unmanaged: NullableAtomic
{
  public typealias NullableAtomicStorage = CAtomics.AtomicOptionalRawPointer

#if swift(>=4.2)
  @inlinable
  public static func nullableAtomicStorage(for value: Unmanaged?) -> NullableAtomicStorage
  { // strange
    return NullableAtomicStorage(value?.toOpaque())
  }

  @inlinable
  public static func deinitializeNullableAtomicStorage(at pointer: UnsafeMutablePointer<NullableAtomicStorage>)
  {
    pointer.deinitialize(count: 1)
  }

  @inlinable
  public static func atomicOptionalLoad(at pointer: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> Unmanaged?
  {
    return CAtomicsLoad(pointer, ordering._rawValue).map(Unmanaged.fromOpaque(_:))
  }

  @inlinable
  public static func atomicOptionalStore(_ desired: Unmanaged?, at pointer: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired?.toOpaque(), ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalExchange(_ desired: Unmanaged?, at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> Unmanaged?
  {
    return CAtomicsExchange(pointer, desired?.toOpaque(), ordering._rawValue).map(Unmanaged.fromOpaque(_:))
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                   at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: pointer,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                   at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    var expected = UnsafeRawPointer(expected?.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired?.toOpaque(),
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.map(Unmanaged.fromOpaque(_:)))
  }

  @inlinable
  public static func atomicOptionalWeakCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                       at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                                       ordering: AtomicUpdateOrdering,
                                                       failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    var expected = UnsafeRawPointer(expected?.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired?.toOpaque(),
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.map(Unmanaged.fromOpaque(_:)))
  }
#else
  @inline(__always)
  public static func nullableAtomicStorage(for value: Unmanaged?) -> NullableAtomicStorage
  { // strange
    return NullableAtomicStorage(value?.toOpaque())
  }

  @inline(__always)
  public static func deinitializeNullableAtomicStorage(at pointer: UnsafeMutablePointer<NullableAtomicStorage>)
  {
    pointer.deinitialize(count: 1)
  }

  @inline(__always)
  public static func atomicOptionalLoad(at pointer: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> Unmanaged?
  {
    return CAtomicsLoad(pointer, ordering._rawValue).map(Unmanaged.fromOpaque(_:))
  }

  @inline(__always)
  public static func atomicOptionalStore(_ desired: Unmanaged?, at pointer: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(pointer, desired?.toOpaque(), ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalExchange(_ desired: Unmanaged?, at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> Unmanaged?
  {
    return CAtomicsExchange(pointer, desired?.toOpaque(), ordering._rawValue).map(Unmanaged.fromOpaque(_:))
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                   at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: pointer,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                   at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    var expected = UnsafeRawPointer(expected?.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeStrong(pointer, &expected, desired?.toOpaque(),
                                                     ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.map(Unmanaged.fromOpaque(_:)))
  }

  @inline(__always)
  public static func atomicOptionalWeakCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                       at pointer: UnsafeMutablePointer<NullableAtomicStorage>,
                                                       ordering: AtomicUpdateOrdering,
                                                       failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    var expected = UnsafeRawPointer(expected?.toOpaque())
    let exchanged = CAtomicsCompareAndExchangeWeak(pointer, &expected, desired?.toOpaque(),
                                                   ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.map(Unmanaged.fromOpaque(_:)))
  }
#endif
}
