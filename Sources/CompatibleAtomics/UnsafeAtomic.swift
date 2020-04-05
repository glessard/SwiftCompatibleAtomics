//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Swift

#if swift(>=4.2)
public struct UnsafeAtomic<Value: AtomicProtocol>
{
  @usableFromInline
  internal let _ptr: UnsafeMutablePointer<Value.AtomicStorage>

  @inlinable
  public init(at address: UnsafeMutablePointer<Value.AtomicStorage>)
  {
    self._ptr = address
  }

  @inlinable
  public static func create(initialValue: Value) -> UnsafeAtomic
  {
    let ptr = UnsafeMutablePointer<Value.AtomicStorage>.allocate(capacity: 1)
    ptr.initialize(to: Value.atomicStorage(for: initialValue))
    return UnsafeAtomic(at: ptr)
  }

  @inlinable
  public func destroy()
  {
    Value.deinitializeAtomicStorage(at: _ptr)
    _ptr.deallocate()
  }
}

extension UnsafeAtomic
{
  @inlinable public func load(ordering: AtomicLoadOrdering) -> Value
  {
    return Value.atomicLoad(at: _ptr, ordering: ordering)
  }

  @inlinable public func store(_ desired: Value, ordering: AtomicStoreOrdering)
  {
    Value.atomicStore(desired, at: _ptr, ordering: ordering)
  }

  @inlinable public func exchange(_ desired: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicExchange(desired, at: _ptr, ordering: ordering)
  }

  @inlinable public func compareExchange(expected: Value, desired: Value,
                                         ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Value)
  {
    return Value.atomicCompareExchange(expected: expected, desired: desired, at: _ptr, ordering: ordering)
  }

  @inlinable public func compareExchange(expected: Value, desired: Value,
                                         ordering: AtomicUpdateOrdering,
                                         failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Value)
  {
    return Value.atomicCompareExchange(expected: expected, desired: desired, at: _ptr,
                                       ordering: ordering, failureOrdering: failureOrdering)
  }
}

extension UnsafeAtomic where Value: AtomicInteger
{
  @inlinable public func loadThenWrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inlinable public func loadThenWrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inlinable public func loadThenBitwiseAnd(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering)
  }

  @inlinable public func loadThenBitwiseOr(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering)
  }

  @inlinable public func loadThenBitwiseXor(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering)
  }


  @inlinable public func wrappingIncrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering) &+ operand
  }

  @inlinable public func wrappingDecrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering) &- operand
  }

  @inlinable public func bitwiseAndThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering) & operand
  }

  @inlinable public func bitwiseOrThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering) | operand
  }

  @inlinable public func bitwiseXorThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering) ^ operand
  }

  
  @inlinable public func wrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inlinable public func wrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }
}
#else
public struct UnsafeAtomic<Value: AtomicProtocol>
{
  @_versioned
  internal let _ptr: UnsafeMutablePointer<Value.AtomicStorage>

  @inline(__always)
  public init(at address: UnsafeMutablePointer<Value.AtomicStorage>)
  {
    self._ptr = address
  }

  @inline(__always)
  public static func create(initialValue: Value) -> UnsafeAtomic
  {
    let ptr = UnsafeMutablePointer<Value.AtomicStorage>.allocate(capacity: 1)
    ptr.initialize(to: Value.atomicStorage(for: initialValue))
    return UnsafeAtomic(at: ptr)
  }

  @inline(__always)
  public func destroy()
  {
    Value.deinitializeAtomicStorage(at: _ptr)
    _ptr.deallocate()
  }
}

extension UnsafeAtomic
{
  @inline(__always) public func load(ordering: AtomicLoadOrdering) -> Value
  {
    return Value.atomicLoad(at: _ptr, ordering: ordering)
  }

  @inline(__always) public func store(_ desired: Value, ordering: AtomicStoreOrdering)
  {
    Value.atomicStore(desired, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func exchange(_ desired: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicExchange(desired, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func compareExchange(expected: Value, desired: Value,
                                         ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Value)
  {
    return Value.atomicCompareExchange(expected: expected, desired: desired, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func compareExchange(expected: Value, desired: Value,
                                         ordering: AtomicUpdateOrdering,
                                         failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Value)
  {
    return Value.atomicCompareExchange(expected: expected, desired: desired, at: _ptr,
                                       ordering: ordering, failureOrdering: failureOrdering)
  }
}

extension UnsafeAtomic where Value: AtomicInteger
{
  @inline(__always) public func loadThenWrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func loadThenWrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func loadThenBitwiseAnd(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func loadThenBitwiseOr(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func loadThenBitwiseXor(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering)
  }


  @inline(__always) public func wrappingIncrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering) &+ operand
  }

  @inline(__always) public func wrappingDecrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering) &- operand
  }

  @inline(__always) public func bitwiseAndThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering) & operand
  }

  @inline(__always) public func bitwiseOrThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering) | operand
  }

  @inline(__always) public func bitwiseXorThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering) ^ operand
  }

  
  @inline(__always) public func wrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always) public func wrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }
}
#endif

#if swift(>=4.1)
#else
extension UnsafeMutablePointer
{
  @inline(__always) public func deallocate()
  {
    self.deallocate(capacity: 1)
  }
}
#endif
