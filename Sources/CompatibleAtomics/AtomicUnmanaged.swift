//
//  AtomicUnmanaged.swift
//
//  Licensed under Apache License v2.0
//

import CAtomics

extension Unmanaged: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicRawPointer

  @inlinable
  public static func atomicStorage(for value: Unmanaged) -> AtomicStorage
  {
    return AtomicStorage(value.toOpaque())
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> Unmanaged
  {
    return Unmanaged.fromOpaque(CAtomicsLoad(address, ordering._rawValue))
  }

  @inlinable
  public static func atomicStore(_ desired: Unmanaged, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired.toOpaque(), ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: Unmanaged, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Unmanaged
  {
    return Unmanaged.fromOpaque(CAtomicsExchange(address, desired.toOpaque(), ordering._rawValue))
  }

  @inlinable
  public static func atomicCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: Unmanaged, desired: Unmanaged,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged)
  {
    var expected = UnsafeRawPointer(expected.toOpaque())
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired.toOpaque(), .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, Unmanaged.fromOpaque(expected))
  }
}

extension Unmanaged: NullableAtomic
{
  public typealias NullableAtomicStorage = CAtomics.AtomicOptionalRawPointer

  @inlinable
  public static func nullableAtomicStorage(for value: Unmanaged?) -> NullableAtomicStorage
  { // strange
    return NullableAtomicStorage(value?.toOpaque())
  }

  @inlinable
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inlinable
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> Unmanaged?
  {
    return CAtomicsLoad(address, ordering._rawValue).map(Unmanaged.fromOpaque(_:))
  }

  @inlinable
  public static func atomicOptionalStore(_ desired: Unmanaged?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired?.toOpaque(), ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalExchange(_ desired: Unmanaged?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> Unmanaged?
  {
    return CAtomicsExchange(address, desired?.toOpaque(), ordering._rawValue).map(Unmanaged.fromOpaque(_:))
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: Unmanaged?, desired: Unmanaged?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Unmanaged?)
  {
    var expected = UnsafeRawPointer(expected?.toOpaque())
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired?.toOpaque(), .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.map(Unmanaged.fromOpaque(_:)))
  }
}
