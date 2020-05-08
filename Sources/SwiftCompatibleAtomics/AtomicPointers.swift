//
//  AtomicPointers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicPrimitives

extension UnsafePointer: AtomicValue
{
  public typealias AtomicStorage = CAtomicPrimitiveRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafePointer) -> CAtomicPrimitiveRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveRawPointer) -> UnsafePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafePointer) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitiveRawPointer(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveRawPointer) -> UnsafePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafePointer) -> CAtomicPrimitiveRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveRawPointer) -> UnsafePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafePointer) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitiveRawPointer(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveRawPointer) -> UnsafePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#endif
}

extension UnsafeRawPointer: AtomicValue
{
  public typealias AtomicStorage = CAtomicPrimitiveRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeRawPointer) -> CAtomicPrimitiveRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveRawPointer) -> UnsafeRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeRawPointer) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitiveRawPointer(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveRawPointer) -> UnsafeRawPointer
  {
    return storage.decode()!
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeRawPointer) -> CAtomicPrimitiveRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveRawPointer) -> UnsafeRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeRawPointer) -> CAtomicPrimitiveRawPointer
  {
    return CAtomicPrimitiveRawPointer(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveRawPointer) -> UnsafeRawPointer
  {
    return storage.decode()!
  }
#endif
}

extension UnsafeMutablePointer: AtomicValue
{
  public typealias AtomicStorage = CAtomicPrimitiveMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeMutablePointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveMutableRawPointer) -> UnsafeMutablePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeMutablePointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitiveMutableRawPointer(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveMutableRawPointer) -> UnsafeMutablePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeMutablePointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveMutableRawPointer) -> UnsafeMutablePointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeMutablePointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitiveMutableRawPointer(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveMutableRawPointer) -> UnsafeMutablePointer
  {
    return storage.decode()!.assumingMemoryBound(to: Pointee.self)
  }
#endif
}

extension UnsafeMutableRawPointer: AtomicValue
{
  public typealias AtomicStorage = CAtomicPrimitiveMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UnsafeMutableRawPointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UnsafeMutableRawPointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitiveMutableRawPointer(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return storage.decode()!
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UnsafeMutableRawPointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UnsafeMutableRawPointer) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitiveMutableRawPointer(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveMutableRawPointer) -> UnsafeMutableRawPointer
  {
    return storage.decode()!
  }
#endif
}

extension Unmanaged: AtomicValue
{
  public typealias AtomicStorage = CAtomicPrimitiveMutableRawPointer

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Unmanaged) -> CAtomicPrimitiveMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveMutableRawPointer) -> Unmanaged
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Unmanaged) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitiveMutableRawPointer(encoding: value.toOpaque())
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveMutableRawPointer) -> Unmanaged
  {
    return Unmanaged.fromOpaque(storage.decode()!)
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Unmanaged) -> CAtomicPrimitiveMutableRawPointer
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveMutableRawPointer) -> Unmanaged
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Unmanaged) -> CAtomicPrimitiveMutableRawPointer
  {
    return CAtomicPrimitiveMutableRawPointer(encoding: value.toOpaque())
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveMutableRawPointer) -> Unmanaged
  {
    return Unmanaged.fromOpaque(storage.decode()!)
  }
#endif
}
