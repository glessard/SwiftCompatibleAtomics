//
//  AtomicPointers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension UnsafePointer: AtomicProtocol
{
  public typealias AtomicStorage = AtomicOptionalRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafePointer) -> AtomicOptionalRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalRawPointer) -> UnsafePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafePointer) -> AtomicOptionalRawPointer
  {
    return AtomicOptionalRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicOptionalRawPointer) -> UnsafePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafePointer) -> AtomicOptionalRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalRawPointer) -> UnsafePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafePointer) -> AtomicOptionalRawPointer
  {
    return AtomicOptionalRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicOptionalRawPointer) -> UnsafePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#endif
}

extension UnsafeRawPointer: AtomicProtocol
{
  public typealias AtomicStorage = AtomicOptionalRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeRawPointer) -> AtomicOptionalRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalRawPointer) -> UnsafeRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeRawPointer) -> AtomicOptionalRawPointer
  {
    return AtomicOptionalRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicOptionalRawPointer) -> UnsafeRawPointer
  {
    return storage.decode()!
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeRawPointer) -> AtomicOptionalRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalRawPointer) -> UnsafeRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeRawPointer) -> AtomicOptionalRawPointer
  {
    return AtomicOptionalRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicOptionalRawPointer) -> UnsafeRawPointer
  {
    return storage.decode()!
  }
#endif
}

extension UnsafeMutablePointer: AtomicProtocol
{
  public typealias AtomicStorage = AtomicOptionalMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeMutablePointer) -> AtomicOptionalMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalMutableRawPointer) -> UnsafeMutablePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeMutablePointer) -> AtomicOptionalMutableRawPointer
  {
    return AtomicOptionalMutableRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicOptionalMutableRawPointer) -> UnsafeMutablePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeMutablePointer) -> AtomicOptionalMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalMutableRawPointer) -> UnsafeMutablePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeMutablePointer) -> AtomicOptionalMutableRawPointer
  {
    return AtomicOptionalMutableRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicOptionalMutableRawPointer) -> UnsafeMutablePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#endif
}

extension UnsafeMutableRawPointer: AtomicProtocol
{
  public typealias AtomicStorage = AtomicOptionalMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicOptionalMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicOptionalMutableRawPointer
  {
    return AtomicOptionalMutableRawPointer(value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicOptionalMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return storage.decode()!
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicOptionalMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeMutableRawPointer) -> AtomicOptionalMutableRawPointer
  {
    return AtomicOptionalMutableRawPointer(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicOptionalMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return storage.decode()!
  }
#endif
}

extension Unmanaged: AtomicProtocol
{
  public typealias AtomicStorage = AtomicOptionalMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Unmanaged) -> AtomicOptionalMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalMutableRawPointer) -> Unmanaged
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Unmanaged) -> AtomicOptionalMutableRawPointer
  {
    return AtomicOptionalMutableRawPointer(value.toOpaque())
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicOptionalMutableRawPointer) -> Unmanaged
  {
    return Unmanaged.fromOpaque(storage.decode()!)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Unmanaged) -> AtomicOptionalMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicOptionalMutableRawPointer) -> Unmanaged
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Unmanaged) -> AtomicOptionalMutableRawPointer
  {
    return AtomicOptionalMutableRawPointer(value.toOpaque())
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicOptionalMutableRawPointer) -> Unmanaged
  {
    return Unmanaged.fromOpaque(storage.decode()!)
  }
#endif
}
