//
//  AtomicPointers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomics

extension UnsafePointer: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicRawPointer

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UnsafePointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafePointer
  {
    return CAtomicsLoad(address, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicStore(_ desired: UnsafePointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UnsafePointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafePointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafePointer, desired: UnsafePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafePointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafePointer, desired: UnsafePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafePointer)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.assumingMemoryBound(to: Pointee.self))
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UnsafePointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafePointer
  {
    return CAtomicsLoad(address, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UnsafePointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UnsafePointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafePointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafePointer, desired: UnsafePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafePointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafePointer, desired: UnsafePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafePointer)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.assumingMemoryBound(to: Pointee.self))
  }
#endif
}

extension UnsafePointer: NullableAtomic
{
  public typealias NullableAtomicStorage = CAtomics.AtomicOptionalRawPointer

#if swift(>=4.2)
  @inlinable
  public static func nullableAtomicStorage(for value: UnsafePointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inlinable
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inlinable
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafePointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicOptionalStore(_ desired: UnsafePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalExchange(_ desired: UnsafePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafePointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafePointer?, desired: UnsafePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafePointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafePointer?, desired: UnsafePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafePointer?)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected?.assumingMemoryBound(to: Pointee.self))
  }
#else
  @inline(__always)
  public static func nullableAtomicStorage(for value: UnsafePointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inline(__always)
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafePointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicOptionalStore(_ desired: UnsafePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalExchange(_ desired: UnsafePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafePointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafePointer?, desired: UnsafePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafePointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafePointer?, desired: UnsafePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafePointer?)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected?.assumingMemoryBound(to: Pointee.self))
  }
#endif
}

extension UnsafeRawPointer: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicRawPointer

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UnsafeRawPointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeRawPointer
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UnsafeRawPointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UnsafeRawPointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafeRawPointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafeRawPointer, desired: UnsafeRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafeRawPointer, desired: UnsafeRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeRawPointer)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UnsafeRawPointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeRawPointer
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UnsafeRawPointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UnsafeRawPointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafeRawPointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafeRawPointer, desired: UnsafeRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafeRawPointer, desired: UnsafeRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeRawPointer)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UnsafeRawPointer: NullableAtomic
{
  public typealias NullableAtomicStorage = CAtomics.AtomicOptionalRawPointer

#if swift(>=4.2)
  @inlinable
  public static func nullableAtomicStorage(for value: UnsafeRawPointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inlinable
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inlinable
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeRawPointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalStore(_ desired: UnsafeRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalExchange(_ desired: UnsafeRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafeRawPointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafeRawPointer?, desired: UnsafeRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeRawPointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafeRawPointer?, desired: UnsafeRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeRawPointer?)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func nullableAtomicStorage(for value: UnsafeRawPointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inline(__always)
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeRawPointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalStore(_ desired: UnsafeRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalExchange(_ desired: UnsafeRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafeRawPointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafeRawPointer?, desired: UnsafeRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeRawPointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafeRawPointer?, desired: UnsafeRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeRawPointer?)
  {
    var expected = UnsafeRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UnsafeMutablePointer: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UnsafeMutablePointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutablePointer
  {
    return CAtomicsLoad(address, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicStore(_ desired: UnsafeMutablePointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UnsafeMutablePointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafeMutablePointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafeMutablePointer, desired: UnsafeMutablePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafeMutablePointer, desired: UnsafeMutablePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.assumingMemoryBound(to: Pointee.self))
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UnsafeMutablePointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutablePointer
  {
    return CAtomicsLoad(address, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UnsafeMutablePointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UnsafeMutablePointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafeMutablePointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue).assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafeMutablePointer, desired: UnsafeMutablePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafeMutablePointer, desired: UnsafeMutablePointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected.assumingMemoryBound(to: Pointee.self))
  }
#endif
}

extension UnsafeMutablePointer: NullableAtomic
{
  public typealias NullableAtomicStorage = CAtomics.AtomicOptionalMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func nullableAtomicStorage(for value: UnsafeMutablePointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inlinable
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inlinable
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutablePointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicOptionalStore(_ desired: UnsafeMutablePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalExchange(_ desired: UnsafeMutablePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafeMutablePointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafeMutablePointer?, desired: UnsafeMutablePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafeMutablePointer?, desired: UnsafeMutablePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer?)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected?.assumingMemoryBound(to: Pointee.self))
  }
#else
  @inline(__always)
  public static func nullableAtomicStorage(for value: UnsafeMutablePointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inline(__always)
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutablePointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicOptionalStore(_ desired: UnsafeMutablePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalExchange(_ desired: UnsafeMutablePointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafeMutablePointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)?.assumingMemoryBound(to: Pointee.self)
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafeMutablePointer?, desired: UnsafeMutablePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafeMutablePointer?, desired: UnsafeMutablePointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutablePointer?)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected?.assumingMemoryBound(to: Pointee.self))
  }
#endif
}

extension UnsafeMutableRawPointer: AtomicProtocol
{
  public typealias AtomicStorage = CAtomics.AtomicMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: UnsafeMutableRawPointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutableRawPointer
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inlinable
  public static func atomicStore(_ desired: UnsafeMutableRawPointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicExchange(_ desired: UnsafeMutableRawPointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafeMutableRawPointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafeMutableRawPointer, desired: UnsafeMutableRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicCompareExchange(expected: UnsafeMutableRawPointer, desired: UnsafeMutableRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: UnsafeMutableRawPointer) -> AtomicStorage
  {
    return AtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>) {}

  @inline(__always)
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutableRawPointer
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicStore(_ desired: UnsafeMutableRawPointer, at address: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: UnsafeMutableRawPointer, at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> UnsafeMutableRawPointer
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafeMutableRawPointer, desired: UnsafeMutableRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer)
  {
    return atomicCompareExchange(expected: expected, desired: desired, at: address,
                                 ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: UnsafeMutableRawPointer, desired: UnsafeMutableRawPointer,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}

extension UnsafeMutableRawPointer: NullableAtomic
{
  public typealias NullableAtomicStorage = CAtomics.AtomicOptionalMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func nullableAtomicStorage(for value: UnsafeMutableRawPointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inlinable
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inlinable
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutableRawPointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalStore(_ desired: UnsafeMutableRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalExchange(_ desired: UnsafeMutableRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafeMutableRawPointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafeMutableRawPointer?, desired: UnsafeMutableRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public static func atomicOptionalCompareExchange(expected: UnsafeMutableRawPointer?, desired: UnsafeMutableRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer?)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#else
  @inline(__always)
  public static func nullableAtomicStorage(for value: UnsafeMutableRawPointer?) -> NullableAtomicStorage
  {
    return NullableAtomicStorage(value)
  }

  @inline(__always)
  public static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>) {}

  @inline(__always)
  public static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicLoadOrdering) -> UnsafeMutableRawPointer?
  {
    return CAtomicsLoad(address, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalStore(_ desired: UnsafeMutableRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>, ordering: AtomicStoreOrdering)
  {
    CAtomicsStore(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalExchange(_ desired: UnsafeMutableRawPointer?, at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> UnsafeMutableRawPointer?
  {
    return CAtomicsExchange(address, desired, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafeMutableRawPointer?, desired: UnsafeMutableRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer?)
  {
    return atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                         ordering: ordering, failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public static func atomicOptionalCompareExchange(expected: UnsafeMutableRawPointer?, desired: UnsafeMutableRawPointer?,
                                                   at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                                   ordering: AtomicUpdateOrdering,
                                                   failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: UnsafeMutableRawPointer?)
  {
    var expected = UnsafeMutableRawPointer(expected)
    let exchanged = CAtomicsCompareAndExchange(address, &expected, desired, .strong,
                                               ordering._rawValue, failureOrdering._rawValue)
    return (exchanged, expected)
  }
#endif
}
