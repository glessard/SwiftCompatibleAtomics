//
//  NullableAtomicConformances.swift
//  
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

extension AtomicRawPointer: PrimitiveAtomicOptional
{
#if swift(>=4.2)
  public var isNil: Bool {
    @inlinable
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicRawPointer {
    @inlinable
    get {
      return AtomicRawPointer(encoding: nil)
    }
  }
#else
  public var isNil: Bool {
    @inline(__always)
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicRawPointer {
    @inline(__always)
    get {
      return AtomicRawPointer(encoding: nil)
    }
  }
#endif
}

extension AtomicMutableRawPointer: PrimitiveAtomicOptional
{
#if swift(>=4.2)
  public var isNil: Bool {
    @inlinable
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicMutableRawPointer {
    @inlinable
    get {
      return AtomicMutableRawPointer(encoding: nil)
    }
  }
#else
  public var isNil: Bool {
    @inline(__always)
    get {
      return decode() == nil
    }
  }

  public static var nilValue: AtomicMutableRawPointer {
    @inline(__always)
    get {
      return AtomicMutableRawPointer(encoding: nil)
    }
  }
#endif
}
