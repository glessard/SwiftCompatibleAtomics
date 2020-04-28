//
//  AtomicIntegers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension Int: AtomicInteger
{
  public typealias AtomicStorage = AtomicInt

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int) -> AtomicInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicInt) -> Int
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int) -> AtomicInt
  {
    return AtomicInt(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicInt) -> Int
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int) -> AtomicInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicInt) -> Int
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int) -> AtomicInt
  {
    return AtomicInt(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt) -> Int
  {
    return storage.decode()
  }
#endif
}

extension UInt: AtomicInteger
{
  public typealias AtomicStorage = AtomicUInt

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt) -> AtomicUInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt) -> UInt
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt) -> AtomicUInt
  {
    return AtomicUInt(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicUInt) -> UInt
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt) -> AtomicUInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt) -> UInt
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt) -> AtomicUInt
  {
    return AtomicUInt(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt) -> UInt
  {
    return storage.decode()
  }
#endif
}

extension Int8: AtomicInteger
{
  public typealias AtomicStorage = AtomicInt8

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int8) -> AtomicInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicInt8) -> Int8
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int8) -> AtomicInt8
  {
    return AtomicInt8(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicInt8) -> Int8
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int8) -> AtomicInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicInt8) -> Int8
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int8) -> AtomicInt8
  {
    return AtomicInt8(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt8) -> Int8
  {
    return storage.decode()
  }
#endif
}

extension UInt8: AtomicInteger
{
  public typealias AtomicStorage = AtomicUInt8

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt8) -> AtomicUInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt8) -> UInt8
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt8) -> AtomicUInt8
  {
    return AtomicUInt8(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicUInt8) -> UInt8
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt8) -> AtomicUInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt8) -> UInt8
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt8) -> AtomicUInt8
  {
    return AtomicUInt8(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt8) -> UInt8
  {
    return storage.decode()
  }
#endif
}

extension Int16: AtomicInteger
{
  public typealias AtomicStorage = AtomicInt16

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int16) -> AtomicInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicInt16) -> Int16
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int16) -> AtomicInt16
  {
    return AtomicInt16(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicInt16) -> Int16
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int16) -> AtomicInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicInt16) -> Int16
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int16) -> AtomicInt16
  {
    return AtomicInt16(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt16) -> Int16
  {
    return storage.decode()
  }
#endif
}

extension UInt16: AtomicInteger
{
  public typealias AtomicStorage = AtomicUInt16

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt16) -> AtomicUInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt16) -> UInt16
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt16) -> AtomicUInt16
  {
    return AtomicUInt16(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicUInt16) -> UInt16
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt16) -> AtomicUInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt16) -> UInt16
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt16) -> AtomicUInt16
  {
    return AtomicUInt16(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt16) -> UInt16
  {
    return storage.decode()
  }
#endif
}

extension Int32: AtomicInteger
{
  public typealias AtomicStorage = AtomicInt32

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int32) -> AtomicInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicInt32) -> Int32
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int32) -> AtomicInt32
  {
    return AtomicInt32(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicInt32) -> Int32
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int32) -> AtomicInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicInt32) -> Int32
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int32) -> AtomicInt32
  {
    return AtomicInt32(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt32) -> Int32
  {
    return storage.decode()
  }
#endif
}

extension UInt32: AtomicInteger
{
  public typealias AtomicStorage = AtomicUInt32

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt32) -> AtomicUInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt32) -> UInt32
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt32) -> AtomicUInt32
  {
    return AtomicUInt32(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicUInt32) -> UInt32
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt32) -> AtomicUInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt32) -> UInt32
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt32) -> AtomicUInt32
  {
    return AtomicUInt32(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt32) -> UInt32
  {
    return storage.decode()
  }
#endif
}

extension Int64: AtomicInteger
{
  public typealias AtomicStorage = AtomicInt64

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int64) -> AtomicInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicInt64) -> Int64
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int64) -> AtomicInt64
  {
    return AtomicInt64(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicInt64) -> Int64
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int64) -> AtomicInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicInt64) -> Int64
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int64) -> AtomicInt64
  {
    return AtomicInt64(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt64) -> Int64
  {
    return storage.decode()
  }
#endif
}

extension UInt64: AtomicInteger
{
  public typealias AtomicStorage = AtomicUInt64

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt64) -> AtomicUInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt64) -> UInt64
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt64) -> AtomicUInt64
  {
    return AtomicUInt64(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: AtomicUInt64) -> UInt64
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt64) -> AtomicUInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout AtomicUInt64) -> UInt64
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt64) -> AtomicUInt64
  {
    return AtomicUInt64(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt64) -> UInt64
  {
    return storage.decode()
  }
#endif
}
