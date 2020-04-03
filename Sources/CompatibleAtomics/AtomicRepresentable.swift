//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Swift

public protocol AtomicRepresentable: AtomicProtocol, RawRepresentable
  where RawValue: AtomicProtocol, AtomicStorage == RawValue.AtomicStorage {}

#if swift(>=4.2)
extension AtomicRepresentable
{
  //public typealias AtomicStorage = RawValue.AtomicStorage

  @inlinable
  public static func atomicStorage(for value: Self) -> RawValue.AtomicStorage
  {
    return RawValue.atomicStorage(for: value.rawValue)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>)
  {
    address.deinitialize(count: 1)
  }

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>,
                                ordering: AtomicLoadOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicLoad(at: address, ordering: ordering))!
  }

  @inlinable
  public static func atomicStore(_ desired: Self,
                                 at address: UnsafeMutablePointer<AtomicStorage>,
                                 ordering: AtomicStoreOrdering)
  {
    RawValue.atomicStore(desired.rawValue, at: address, ordering: ordering)
  }

  @inlinable
  public static func atomicExchange(_ desired: Self,
                                    at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicExchange(desired.rawValue, at: address, ordering: ordering))!
  }

  @inlinable
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: address, ordering: ordering)
    return (exchanged, Self(rawValue: raw)!)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: address, ordering: ordering, failureOrdering: failureOrdering)
    return (exchanged, Self(rawValue: raw)!)
  }
}
#else
extension AtomicRepresentable
{
  //public typealias AtomicStorage = RawValue.AtomicStorage

  @inline(__always)
  public static func atomicStorage(for value: Self) -> RawValue.AtomicStorage
  {
    return RawValue.atomicStorage(for: value.rawValue)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>)
  {
    address.deinitialize(count: 1)
  }

  @inline(__always)
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>,
                                ordering: AtomicLoadOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicLoad(at: address, ordering: ordering))!
  }

  @inline(__always)
  public static func atomicStore(_ desired: Self,
                                 at address: UnsafeMutablePointer<AtomicStorage>,
                                 ordering: AtomicStoreOrdering)
  {
    RawValue.atomicStore(desired.rawValue, at: address, ordering: ordering)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Self,
                                    at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicExchange(desired.rawValue, at: address, ordering: ordering))!
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: address, ordering: ordering)
    return (exchanged, Self(rawValue: raw)!)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: address, ordering: ordering, failureOrdering: failureOrdering)
    return (exchanged, Self(rawValue: raw)!)
  }
}
#endif
