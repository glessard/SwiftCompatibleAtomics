//
//  AtomicIntegers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicPrimitives

extension Int: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveInt

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int) -> CAtomicPrimitiveInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt) -> Int
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitiveInt(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt) -> Int
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int) -> CAtomicPrimitiveInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt) -> Int
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitiveInt(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt) -> Int
  {
    return storage.decode()
  }
#endif
}

extension UInt: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveUInt

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt) -> CAtomicPrimitiveUInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt) -> UInt
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitiveUInt(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt) -> UInt
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt) -> CAtomicPrimitiveUInt
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt) -> UInt
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitiveUInt(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt) -> UInt
  {
    return storage.decode()
  }
#endif
}

extension Int8: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveInt8

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int8) -> CAtomicPrimitiveInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt8) -> Int8
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int8) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitiveInt8(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt8) -> Int8
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int8) -> CAtomicPrimitiveInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt8) -> Int8
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int8) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitiveInt8(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt8) -> Int8
  {
    return storage.decode()
  }
#endif
}

extension UInt8: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveUInt8

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt8) -> CAtomicPrimitiveUInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt8) -> UInt8
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt8) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitiveUInt8(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt8) -> UInt8
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt8) -> CAtomicPrimitiveUInt8
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt8) -> UInt8
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt8) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitiveUInt8(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt8) -> UInt8
  {
    return storage.decode()
  }
#endif
}

extension Int16: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveInt16

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int16) -> CAtomicPrimitiveInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt16) -> Int16
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int16) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitiveInt16(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt16) -> Int16
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int16) -> CAtomicPrimitiveInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt16) -> Int16
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int16) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitiveInt16(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt16) -> Int16
  {
    return storage.decode()
  }
#endif
}

extension UInt16: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveUInt16

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt16) -> CAtomicPrimitiveUInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt16) -> UInt16
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt16) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitiveUInt16(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt16) -> UInt16
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt16) -> CAtomicPrimitiveUInt16
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt16) -> UInt16
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt16) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitiveUInt16(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt16) -> UInt16
  {
    return storage.decode()
  }
#endif
}

extension Int32: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveInt32

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int32) -> CAtomicPrimitiveInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt32) -> Int32
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int32) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitiveInt32(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt32) -> Int32
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int32) -> CAtomicPrimitiveInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt32) -> Int32
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int32) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitiveInt32(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt32) -> Int32
  {
    return storage.decode()
  }
#endif
}

extension UInt32: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveUInt32

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt32) -> CAtomicPrimitiveUInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt32) -> UInt32
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt32) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitiveUInt32(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt32) -> UInt32
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt32) -> CAtomicPrimitiveUInt32
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt32) -> UInt32
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt32) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitiveUInt32(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt32) -> UInt32
  {
    return storage.decode()
  }
#endif
}

extension Int64: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveInt64

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: Int64) -> CAtomicPrimitiveInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt64) -> Int64
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: Int64) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitiveInt64(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt64) -> Int64
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: Int64) -> CAtomicPrimitiveInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveInt64) -> Int64
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: Int64) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitiveInt64(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveInt64) -> Int64
  {
    return storage.decode()
  }
#endif
}

extension UInt64: AtomicInteger
{
  public typealias AtomicStorage = CAtomicPrimitiveUInt64

#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage(for value: UInt64) -> CAtomicPrimitiveUInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inlinable
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt64) -> UInt64
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage(for value: UInt64) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitiveUInt64(encoding: value)
  }

  @inlinable
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt64) -> UInt64
  {
    return storage.decode()
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage(for value: UInt64) -> CAtomicPrimitiveUInt64
  {
    return encodeAtomicStorage(for: value)
  }

  @inline(__always)
  public static func disposeAtomicStorage(_ storage: inout CAtomicPrimitiveUInt64) -> UInt64
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage(for value: UInt64) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitiveUInt64(encoding: value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: CAtomicPrimitiveUInt64) -> UInt64
  {
    return storage.decode()
  }
#endif
}
