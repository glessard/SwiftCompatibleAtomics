//
//  AtomicPointers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension UnsafePointer: AtomicValue
{
  public typealias AtomicStorage = AtomicRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafePointer) -> AtomicRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicRawPointer) -> UnsafePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafePointer) -> AtomicRawPointer
  {
    return AtomicRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicRawPointer) -> UnsafePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafePointer) -> AtomicRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicRawPointer) -> UnsafePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafePointer) -> AtomicRawPointer
  {
    return AtomicRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicRawPointer) -> UnsafePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#endif
}

extension UnsafeRawPointer: AtomicValue
{
  public typealias AtomicStorage = AtomicRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeRawPointer) -> AtomicRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicRawPointer) -> UnsafeRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeRawPointer) -> AtomicRawPointer
  {
    return AtomicRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicRawPointer) -> UnsafeRawPointer
  {
    return storage.decode()!
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeRawPointer) -> AtomicRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicRawPointer) -> UnsafeRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeRawPointer) -> AtomicRawPointer
  {
    return AtomicRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicRawPointer) -> UnsafeRawPointer
  {
    return storage.decode()!
  }
#endif
}

extension UnsafeMutablePointer: AtomicValue
{
  public typealias AtomicStorage = AtomicMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeMutablePointer) -> AtomicMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicMutableRawPointer) -> UnsafeMutablePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeMutablePointer) -> AtomicMutableRawPointer
  {
    return AtomicMutableRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicMutableRawPointer) -> UnsafeMutablePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeMutablePointer) -> AtomicMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicMutableRawPointer) -> UnsafeMutablePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeMutablePointer) -> AtomicMutableRawPointer
  {
    return AtomicMutableRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicMutableRawPointer) -> UnsafeMutablePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#endif
}

extension UnsafeMutableRawPointer: AtomicValue
{
  public typealias AtomicStorage = AtomicMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicMutableRawPointer
  {
    return AtomicMutableRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return storage.decode()!
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicMutableRawPointer
  {
    return AtomicMutableRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return storage.decode()!
  }
#endif
}

extension Unmanaged: AtomicValue
{
  public typealias AtomicStorage = AtomicMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Unmanaged) -> AtomicMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicMutableRawPointer) -> Unmanaged
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Unmanaged) -> AtomicMutableRawPointer
  {
    return AtomicMutableRawPointer(value.toOpaque())
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicMutableRawPointer) -> Unmanaged
  {
    return Unmanaged.fromOpaque(storage.decode()!)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Unmanaged) -> AtomicMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicMutableRawPointer) -> Unmanaged
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Unmanaged) -> AtomicMutableRawPointer
  {
    return AtomicMutableRawPointer(value.toOpaque())
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicMutableRawPointer) -> Unmanaged
  {
    return Unmanaged.fromOpaque(storage.decode()!)
  }
#endif
}
