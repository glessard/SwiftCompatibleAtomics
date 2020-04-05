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

public protocol NullableAtomic: AtomicProtocol
{
  associatedtype NullableAtomicStorage

  static func nullableAtomicStorage(for value: Self?) -> NullableAtomicStorage

  static func deinitializeNullableAtomicStorage(at address: UnsafeMutablePointer<NullableAtomicStorage>)

  static func atomicOptionalLoad(at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                 ordering: AtomicLoadOrdering) -> Self?

  static func atomicOptionalStore(_ desired: Self?,
                                  at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                  ordering: AtomicStoreOrdering)

  static func atomicOptionalExchange(_ desired: Self?,
                                     at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                     ordering: AtomicUpdateOrdering) -> Self?

  static func atomicOptionalCompareExchange(expected: Self?,
                                            desired: Self?,
                                            at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self?)

  static func atomicOptionalCompareExchange(expected: Self?,
                                            desired: Self?,
                                            at address: UnsafeMutablePointer<NullableAtomicStorage>,
                                            ordering: AtomicUpdateOrdering,
                                            failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self?)
}

extension Optional: AtomicProtocol where Wrapped: NullableAtomic
{
  public typealias AtomicStorage = Wrapped.NullableAtomicStorage

#if swift(>=4.2)
  @inlinable
  public static func atomicStorage(for value: Optional) -> AtomicStorage
  {
    return Wrapped.nullableAtomicStorage(for: value)
  }

  @inlinable
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>)
  {
    Wrapped.deinitializeNullableAtomicStorage(at: address)
  }

  @inlinable
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>,
                                ordering: AtomicLoadOrdering) -> Optional
  {
    return Wrapped.atomicOptionalLoad(at: address, ordering: ordering)
  }

  @inlinable
  public static func atomicStore(_ desired: Optional,
                                 at address: UnsafeMutablePointer<AtomicStorage>,
                                 ordering: AtomicStoreOrdering)
  {
    return Wrapped.atomicOptionalStore(desired, at: address, ordering: ordering)
  }

  @inlinable
  public static func atomicExchange(_ desired: Optional,
                                    at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Optional
  {
    return Wrapped.atomicOptionalExchange(desired, at: address, ordering: ordering)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Optional,
                                           desired: Optional,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Optional)
  {
    return Wrapped.atomicOptionalCompareExchange(expected: expected, desired: desired, at: address, ordering: ordering)
  }

  @inlinable
  public static func atomicCompareExchange(expected: Optional,
                                           desired: Optional,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Optional)
  {
    return Wrapped.atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                                 ordering: ordering, failureOrdering: failureOrdering)
  }
#else
  @inline(__always)
  public static func atomicStorage(for value: Optional) -> AtomicStorage
  {
    return Wrapped.nullableAtomicStorage(for: value)
  }

  @inline(__always)
  public static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>)
  {
    Wrapped.deinitializeNullableAtomicStorage(at: address)
  }

  @inline(__always)
  public static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>,
                                ordering: AtomicLoadOrdering) -> Optional
  {
    return Wrapped.atomicOptionalLoad(at: address, ordering: ordering)
  }

  @inline(__always)
  public static func atomicStore(_ desired: Optional,
                                 at address: UnsafeMutablePointer<AtomicStorage>,
                                 ordering: AtomicStoreOrdering)
  {
    return Wrapped.atomicOptionalStore(desired, at: address, ordering: ordering)
  }

  @inline(__always)
  public static func atomicExchange(_ desired: Optional,
                                    at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> Optional
  {
    return Wrapped.atomicOptionalExchange(desired, at: address, ordering: ordering)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Optional,
                                           desired: Optional,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Optional)
  {
    return Wrapped.atomicOptionalCompareExchange(expected: expected, desired: desired, at: address, ordering: ordering)
  }

  @inline(__always)
  public static func atomicCompareExchange(expected: Optional,
                                           desired: Optional,
                                           at address: UnsafeMutablePointer<AtomicStorage>,
                                           ordering: AtomicUpdateOrdering,
                                           failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Optional)
  {
    return Wrapped.atomicOptionalCompareExchange(expected: expected, desired: desired, at: address,
                                                 ordering: ordering, failureOrdering: failureOrdering)
  }
#endif
}