//
//  PrimitiveAtomicIntegerConformances.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicPrimitives

extension CAtomicPrimitiveInt: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveUInt: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveInt8: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt8
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveUInt8: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt8, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt8>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt8
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveInt16: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt16
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveUInt16: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt16, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt16>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt16
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveInt32: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt32
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveUInt32: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt32, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt32>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt32
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveInt64: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveInt64
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}

extension CAtomicPrimitiveUInt64: PrimitiveAtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inlinable
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#else
  @inline(__always)
  public static func atomicLoadThenWrappingIncrement(by operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesAdd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenWrappingDecrement(by operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesSubtract(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseAnd(with operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesBitwiseAnd(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseOr(with operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesBitwiseOr(pointer, operand, ordering._rawValue)
  }

  @inline(__always)
  public static func atomicLoadThenBitwiseXor(with operand: CAtomicPrimitiveUInt64, at pointer: UnsafeMutablePointer<CAtomicPrimitiveUInt64>, ordering: AtomicUpdateOrdering) -> CAtomicPrimitiveUInt64
  {
    return CAtomicPrimitivesBitwiseXor(pointer, operand, ordering._rawValue)
  }
#endif
}
