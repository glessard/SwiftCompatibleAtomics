//
//  NullableAtomicConformances.swift
//  
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension AtomicOptionalRawPointer: PrimitiveAtomicOptional
{
#if swift(>=4.2)
  public var isNil: Bool {
    @inlinable
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicOptionalRawPointer {
    @inlinable
    get {
      return AtomicOptionalRawPointer(nil)
    }
  }
#else
  public var isNil: Bool {
    @inline(__always)
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicOptionalRawPointer {
    @inline(__always)
    get {
      return AtomicOptionalRawPointer(nil)
    }
  }
#endif
}

extension AtomicOptionalMutableRawPointer: PrimitiveAtomicOptional
{
#if swift(>=4.2)
  public var isNil: Bool {
    @inlinable
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicOptionalMutableRawPointer {
    @inlinable
    get {
      return AtomicOptionalMutableRawPointer(nil)
    }
  }
#else
  public var isNil: Bool {
    @inline(__always)
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicOptionalMutableRawPointer {
    @inline(__always)
    get {
      return AtomicOptionalMutableRawPointer(nil)
    }
  }
#endif
}
