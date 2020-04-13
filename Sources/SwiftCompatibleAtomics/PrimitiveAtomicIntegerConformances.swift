//
//  PrimitiveAtomicIntegerConformances.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension AtomicInt: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt, at pointer: UnsafeMutablePointer<AtomicInt>, ordering: AtomicUpdateOrdering) -> AtomicInt
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicUInt: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt, at pointer: UnsafeMutablePointer<AtomicUInt>, ordering: AtomicUpdateOrdering) -> AtomicUInt
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicInt8: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt8, at pointer: UnsafeMutablePointer<AtomicInt8>, ordering: AtomicUpdateOrdering) -> AtomicInt8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicUInt8: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt8, at pointer: UnsafeMutablePointer<AtomicUInt8>, ordering: AtomicUpdateOrdering) -> AtomicUInt8
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicInt16: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt16, at pointer: UnsafeMutablePointer<AtomicInt16>, ordering: AtomicUpdateOrdering) -> AtomicInt16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicUInt16: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt16, at pointer: UnsafeMutablePointer<AtomicUInt16>, ordering: AtomicUpdateOrdering) -> AtomicUInt16
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicInt32: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt32, at pointer: UnsafeMutablePointer<AtomicInt32>, ordering: AtomicUpdateOrdering) -> AtomicInt32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicUInt32: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt32, at pointer: UnsafeMutablePointer<AtomicUInt32>, ordering: AtomicUpdateOrdering) -> AtomicUInt32
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicInt64: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicInt64, at pointer: UnsafeMutablePointer<AtomicInt64>, ordering: AtomicUpdateOrdering) -> AtomicInt64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension AtomicUInt64: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: AtomicUInt64, at pointer: UnsafeMutablePointer<AtomicUInt64>, ordering: AtomicUpdateOrdering) -> AtomicUInt64
  {
    return CAtomicsBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}
