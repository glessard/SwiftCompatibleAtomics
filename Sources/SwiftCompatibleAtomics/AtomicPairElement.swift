//
//  AtomicPairElement.swift
//
//  Licensed under Apache License v2.0
//

public protocol AtomicPairElement
{
  init(decoding: Int)
  func encode() -> Int
}

#if swift(>=4.2)
extension Bool: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = (bits != 0) }
  @inlinable public func encode() -> Int { return self ? 1 : 0 }
}

extension Int8: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = Int8(truncatingIfNeeded: bits) }
  @inlinable public func encode() -> Int { return Int(self) }
}

extension UInt8: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UInt8(truncatingIfNeeded: bits) }
  @inlinable public func encode() -> Int { return Int(self) }
}

extension Int16: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = Int16(truncatingIfNeeded: bits) }
  @inlinable public func encode() -> Int { return Int(self) }
}

extension UInt16: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UInt16(truncatingIfNeeded: bits) }
  @inlinable public func encode() -> Int { return Int(self) }
}

extension Int32: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = Int32(truncatingIfNeeded: bits) }
  @inlinable public func encode() -> Int { return Int(self) }
}

extension UInt32: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UInt32(truncatingIfNeeded: bits) }
  @inlinable public func encode() -> Int { return Int(self) }
}

extension Int: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = bits }
  @inlinable public func encode() -> Int { return self }
}

extension UInt: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UInt(bitPattern: bits) }
  @inlinable public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafePointer: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UnsafePointer(bitPattern: bits)! }
  @inlinable public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafeMutablePointer: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UnsafeMutablePointer(bitPattern: bits)! }
  @inlinable public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafeRawPointer: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UnsafeRawPointer(bitPattern: bits)! }
  @inlinable public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafeMutableRawPointer: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = UnsafeMutableRawPointer(bitPattern: bits)! }
  @inlinable public func encode() -> Int { return Int(bitPattern: self) }
}

extension Unmanaged: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = Unmanaged.fromOpaque(UnsafeRawPointer(bitPattern: bits)!) }
  @inlinable public func encode() -> Int { return Int(bitPattern: self.toOpaque()) }
}

extension Optional: AtomicPairElement where Wrapped: AtomicPairElement & AtomicValue, Wrapped.AtomicStorage: PrimitiveAtomicOptional
{
  @inlinable public init(decoding bits: Int) { self = (bits == 0) ? nil : Wrapped(decoding: bits) }
  @inlinable public func encode() -> Int { return self?.encode() ?? 0 }
}

extension AtomicPairElement where Self: RawRepresentable, Self.RawValue: AtomicPairElement
{
  @inlinable public init(decoding bits: Int) { self = Self(rawValue: RawValue(decoding: bits))! }
  @inlinable public func encode() -> Int { return self.rawValue.encode() }
}
#else
extension Bool: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = (bits != 0) }
  @inline(__always) public func encode() -> Int { return self ? 1 : 0 }
}

extension Int8: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = Int8(truncatingIfNeeded: bits) }
  @inline(__always) public func encode() -> Int { return Int(self) }
}

extension UInt8: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UInt8(truncatingIfNeeded: bits) }
  @inline(__always) public func encode() -> Int { return Int(self) }
}

extension Int16: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = Int16(truncatingIfNeeded: bits) }
  @inline(__always) public func encode() -> Int { return Int(self) }
}

extension UInt16: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UInt16(truncatingIfNeeded: bits) }
  @inline(__always) public func encode() -> Int { return Int(self) }
}

extension Int32: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = Int32(truncatingIfNeeded: bits) }
  @inline(__always) public func encode() -> Int { return Int(self) }
}

extension UInt32: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UInt32(truncatingIfNeeded: bits) }
  @inline(__always) public func encode() -> Int { return Int(self) }
}

extension Int: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = bits }
  @inline(__always) public func encode() -> Int { return self }
}

extension UInt: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UInt(bitPattern: bits) }
  @inline(__always) public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafePointer: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UnsafePointer(bitPattern: bits)! }
  @inline(__always) public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafeMutablePointer: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UnsafeMutablePointer(bitPattern: bits)! }
  @inline(__always) public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafeRawPointer: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UnsafeRawPointer(bitPattern: bits)! }
  @inline(__always) public func encode() -> Int { return Int(bitPattern: self) }
}

extension UnsafeMutableRawPointer: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = UnsafeMutableRawPointer(bitPattern: bits)! }
  @inline(__always) public func encode() -> Int { return Int(bitPattern: self) }
}

extension Unmanaged: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = Unmanaged.fromOpaque(UnsafeRawPointer(bitPattern: bits)!) }
  @inline(__always) public func encode() -> Int { return Int(bitPattern: self.toOpaque()) }
}

extension Optional: AtomicPairElement where Wrapped: AtomicPairElement & AtomicValue, Wrapped.AtomicStorage: PrimitiveAtomicOptional
{
  @inline(__always) public init(decoding bits: Int) { self = (bits == 0) ? nil : Wrapped(decoding: bits) }
  @inline(__always) public func encode() -> Int { return self?.encode() ?? 0 }
}

extension AtomicPairElement where Self: RawRepresentable, Self.RawValue: AtomicPairElement
{
  @inline(__always) public init(decoding bits: Int) { self = Self(rawValue: RawValue(decoding: bits))! }
  @inline(__always) public func encode() -> Int { return self.rawValue.encode() }
}
#endif
