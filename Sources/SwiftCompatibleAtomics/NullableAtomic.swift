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

public protocol PrimitiveAtomicOptional: PrimitiveAtomic
{
  var isNil: Bool { get }
  static var nilValue: Self { get }
}

extension Optional: AtomicValue where Wrapped: AtomicValue, Wrapped.AtomicStorage: PrimitiveAtomicOptional
{
  public typealias AtomicStorage = Wrapped.AtomicStorage

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Optional<Wrapped>) -> Wrapped.AtomicStorage {
    if let value = value
    {
      return Wrapped.prepareAtomicStorage(for: value)
    }
    return .nilValue
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout Wrapped.AtomicStorage) -> Optional<Wrapped>
  {
    if !storage.isNil
    {
      return Wrapped.disposeAtomicStorage(&storage)
    }
    return nil
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Optional<Wrapped>) -> Wrapped.AtomicStorage
  {
    if let value = value
    {
      return Wrapped.encodeAtomicStorage(for: value)
    }
    return .nilValue
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: Wrapped.AtomicStorage) -> Optional<Wrapped>
  {
    if !storage.isNil
    {
      return Wrapped.decodeAtomicStorage(storage)
    }
    return nil
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Optional<Wrapped>) -> Wrapped.AtomicStorage {
    if let value = value
    {
      return Wrapped.prepareAtomicStorage(for: value)
    }
    return .nilValue
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout Wrapped.AtomicStorage) -> Optional<Wrapped>
  {
    if !storage.isNil
    {
      return Wrapped.disposeAtomicStorage(&storage)
    }
    return nil
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Optional<Wrapped>) -> Wrapped.AtomicStorage
  {
    if let value = value
    {
      return Wrapped.encodeAtomicStorage(for: value)
    }
    return .nilValue
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: Wrapped.AtomicStorage) -> Optional<Wrapped>
  {
    if !storage.isNil
    {
      return Wrapped.decodeAtomicStorage(storage)
    }
    return nil
  }
#endif
}
