//
//  NullableAtomicConformances.swift
//  
//  Licensed under Apache License v2.0
//

import CAtomicPrimitives

extension CAtomicPrimitiveRawPointer: PrimitiveAtomicOptional
{
#if swift(>=4.2)
  public var isNil: Bool {
    @inlinable
    get {
      return decode() == nil
    }
  }

  public static var nilValue: CAtomicPrimitiveRawPointer {
    @inlinable
    get {
      return CAtomicPrimitiveRawPointer(encoding: nil)
    }
  }
#else
  public var isNil: Bool {
    @inline(__always)
    get {
      return decode() == nil
    }
  }

  public static var nilValue: CAtomicPrimitiveRawPointer {
    @inline(__always)
    get {
      return CAtomicPrimitiveRawPointer(encoding: nil)
    }
  }
#endif
}

extension CAtomicPrimitiveMutableRawPointer: PrimitiveAtomicOptional
{
#if swift(>=4.2)
  public var isNil: Bool {
    @inlinable
    get {
      return decode() == nil
    }
  }

  public static var nilValue: CAtomicPrimitiveMutableRawPointer {
    @inlinable
    get {
      return CAtomicPrimitiveMutableRawPointer(encoding: nil)
    }
  }
#else
  public var isNil: Bool {
    @inline(__always)
    get {
      return decode() == nil
    }
  }

  public static var nilValue: CAtomicPrimitiveMutableRawPointer {
    @inline(__always)
    get {
      return CAtomicPrimitiveMutableRawPointer(encoding: nil)
    }
  }
#endif
}
