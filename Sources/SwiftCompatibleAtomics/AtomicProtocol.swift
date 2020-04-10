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
  associatedtype AtomicStorage: PrimitiveAtomic

  static func prepareAtomicStorage(for value: Self) -> AtomicStorage
  static func disposeAtomicStorage(_ storage: inout AtomicStorage) -> Self

  static func encodeAtomicStorage(for value: Self) -> AtomicStorage
  static func decodeAtomicStorage(_ storage: AtomicStorage) -> Self
}

extension AtomicProtocol where Self: RawRepresentable, Self.RawValue: AtomicProtocol, Self.RawValue.AtomicStorage == AtomicStorage
{
#if swift(>=4.2)
  @inlinable
  static func prepareAtomicStorage(for value: Self) -> RawValue.AtomicStorage
  {
    return RawValue.prepareAtomicStorage(for: value.rawValue)
  }

  @inlinable
  static func disposeAtomicStorage(_ storage: inout AtomicStorage) -> Self
  {
    return Self(rawValue: RawValue.disposeAtomicStorage(&storage))!
  }

  @inlinable
  static func encodeAtomicStorage(for value: Self) -> AtomicStorage
  {
    return RawValue.encodeAtomicStorage(for: value.rawValue)
  }

  @inlinable
  static func decodeAtomicStorage(_ storage: AtomicStorage) -> Self
  {
    return Self(rawValue: RawValue.decodeAtomicStorage(storage))!
  }
#else
  @inline(__always)
  static func prepareAtomicStorage(for value: Self) -> RawValue.AtomicStorage
  {
    return RawValue.prepareAtomicStorage(for: value.rawValue)
  }

  @inline(__always)
  static func disposeAtomicStorage(_ storage: inout AtomicStorage) -> Self
  {
    return Self(rawValue: RawValue.disposeAtomicStorage(&storage))!
  }

  @inline(__always)
  static func encodeAtomicStorage(for value: Self) -> AtomicStorage
  {
    return RawValue.encodeAtomicStorage(for: value.rawValue)
  }

  @inline(__always)
  static func decodeAtomicStorage(_ storage: AtomicStorage) -> Self
  {
    return Self(rawValue: RawValue.decodeAtomicStorage(storage))!
  }
#endif
}
