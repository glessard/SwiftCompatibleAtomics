//
//  AtomicIntegers.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension Int: AtomicProtocol
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
    return AtomicInt(value)
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
    return AtomicInt(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt) -> Int
  {
    return storage.decode()
  }
#endif
}


extension Int: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension UInt: AtomicProtocol
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
    return AtomicUInt(value)
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
    return AtomicUInt(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt) -> UInt
  {
    return storage.decode()
  }
#endif
}


extension UInt: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension Int8: AtomicProtocol
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
    return AtomicInt8(value)
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
    return AtomicInt8(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt8) -> Int8
  {
    return storage.decode()
  }
#endif
}


extension Int8: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int8
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension UInt8: AtomicProtocol
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
    return AtomicUInt8(value)
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
    return AtomicUInt8(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt8) -> UInt8
  {
    return storage.decode()
  }
#endif
}


extension UInt8: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt8, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt8
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension Int16: AtomicProtocol
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
    return AtomicInt16(value)
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
    return AtomicInt16(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt16) -> Int16
  {
    return storage.decode()
  }
#endif
}


extension Int16: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int16
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension UInt16: AtomicProtocol
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
    return AtomicUInt16(value)
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
    return AtomicUInt16(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt16) -> UInt16
  {
    return storage.decode()
  }
#endif
}


extension UInt16: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt16, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt16
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension Int32: AtomicProtocol
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
    return AtomicInt32(value)
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
    return AtomicInt32(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt32) -> Int32
  {
    return storage.decode()
  }
#endif
}


extension Int32: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int32
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension UInt32: AtomicProtocol
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
    return AtomicUInt32(value)
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
    return AtomicUInt32(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt32) -> UInt32
  {
    return storage.decode()
  }
#endif
}


extension UInt32: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt32, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt32
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension Int64: AtomicProtocol
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
    return AtomicInt64(value)
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
    return AtomicInt64(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicInt64) -> Int64
  {
    return storage.decode()
  }
#endif
}


extension Int64: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: Int64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> Int64
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}

extension UInt64: AtomicProtocol
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
    return AtomicUInt64(value)
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
    return AtomicUInt64(value)
  }

  @inline(__always)
  public static func decodeAtomicStorage(_ storage: AtomicUInt64) -> UInt64
  {
    return storage.decode()
  }
#endif
}


extension UInt64: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsAdd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsSubtract(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseAnd(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseOr(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: UInt64, at pointer: UnsafeMutablePointer<AtomicStorage>, ordering: AtomicUpdateOrdering) -> UInt64
  {
    return CAtomicsBitwiseXor(pointer, AtomicStorage(operand), ordering._rawValue).decode()
  }
#endif
}
