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

public protocol AtomicProtocol
{
  associatedtype AtomicStorage

  static func atomicStorage(for value: Self) -> AtomicStorage

  static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>)

  static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>,
                         ordering: AtomicLoadOrdering) -> Self

  static func atomicStore(_ desired: Self,
                          at pointer: UnsafeMutablePointer<AtomicStorage>,
                          ordering: AtomicStoreOrdering)

  static func atomicExchange(_ desired: Self,
                             at pointer: UnsafeMutablePointer<AtomicStorage>,
                             ordering: AtomicUpdateOrdering) -> Self

  static func atomicCompareExchange(expected: Self,
                                    desired: Self,
                                    at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)

  static func atomicCompareExchange(expected: Self,
                                    desired: Self,
                                    at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering,
                                    failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)

  static func atomicWeakCompareExchange(expected: Self,
                                        desired: __owned Self,
                                        at pointer: UnsafeMutablePointer<AtomicStorage>,
                                        ordering: AtomicUpdateOrdering,
                                        failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
}

extension AtomicProtocol where Self: RawRepresentable, Self.RawValue: AtomicProtocol, Self.RawValue.AtomicStorage == AtomicStorage
{
#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Self) -> RawValue.AtomicStorage
  {
    return RawValue.atomicStorage(for: value.rawValue)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>)
  {
    pointer.deinitialize(count: 1)
  }

  @inlinable
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>,
                                ordering: AtomicLoadOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicLoad(at: pointer, ordering: ordering))!
  }

  @inlinable
  public static func atomicStore(_ desired: Self,
                                 at pointer: UnsafeMutablePointer<AtomicStorage>,
                                 ordering: AtomicStoreOrdering)
  {
    RawValue.atomicStore(desired.rawValue, at: pointer, ordering: ordering)
  }

  @inlinable
  public static func atomicExchange(_ desired: Self,
                                    at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicExchange(desired.rawValue, at: pointer, ordering: ordering))!
  }

  @inlinable
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: pointer, ordering: ordering)
    return (exchanged, Self(rawValue: raw)!)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: pointer, ordering: ordering, failureOrdering: failureOrdering)
    return (exchanged, Self(rawValue: raw)!)
  }

  @inlinable
  public static func atomicWeakCompareExchange(expected: Self,
                                               desired: Self,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicWeakCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                              at: pointer, ordering: ordering, failureOrdering: failureOrdering)
    return (exchanged, Self(rawValue: raw)!)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Self) -> RawValue.AtomicStorage
  {
    return RawValue.atomicStorage(for: value.rawValue)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at pointer: UnsafeMutablePointer<AtomicStorage>)
  {
    pointer.deinitialize(count: 1)
  }

  @inline(__always)
  public static func atomicLoad(at pointer: UnsafeMutablePointer<AtomicStorage>,
                                ordering: AtomicLoadOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicLoad(at: pointer, ordering: ordering))!
  }

  @inline(__always)
  public static func atomicStore(_ desired: Self,
                                 at pointer: UnsafeMutablePointer<AtomicStorage>,
                                 ordering: AtomicStoreOrdering)
  {
    RawValue.atomicStore(desired.rawValue, at: pointer, ordering: ordering)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Self,
                                    at pointer: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Self
  {
    return Self(rawValue: RawValue.atomicExchange(desired.rawValue, at: pointer, ordering: ordering))!
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: pointer, ordering: ordering)
    return (exchanged, Self(rawValue: raw)!)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Self,
                                           desired: Self,
                                           at pointer: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                          at: pointer, ordering: ordering, failureOrdering: failureOrdering)
    return (exchanged, Self(rawValue: raw)!)
  }

  @inline(__always)
  public static func atomicWeakCompareExchange(expected: Self,
                                               desired: Self,
                                               at pointer: UnsafeMutablePointer<AtomicStorage>,
                                               ordering: AtomicUpdateOrdering,
                                               failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
  {
    let (exchanged, raw) = RawValue.atomicWeakCompareExchange(expected: expected.rawValue, desired: desired.rawValue,
                                                              at: pointer, ordering: ordering, failureOrdering: failureOrdering)
    return (exchanged, Self(rawValue: raw)!)
  }
#endif
}