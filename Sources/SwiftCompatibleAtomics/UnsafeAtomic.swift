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

public struct UnsafeAtomic<Value: AtomicProtocol>
{
#if swift(>=4.2)
  public struct Storage
  {
    @usableFromInline
    internal var value: Value.AtomicStorage

    @inlinable
    public init(_ value: Value)
    {
      self.value = Value.prepareAtomicStorage(for: value)
    }

    @inlinable @discardableResult
    public mutating func dispose() -> Value
    {
      return Value.disposeAtomicStorage(&value)
    }
  }

  @usableFromInline
  internal let storage: UnsafeMutablePointer<Storage>

  @inlinable
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    storage = pointer
  }

  @inlinable
  public static func create(initialValue: Value) -> UnsafeAtomic
  {
    let pointer = UnsafeMutablePointer<Storage>.allocate(capacity: 1)
    pointer.initialize(to: Storage(initialValue))
    return UnsafeAtomic(at: pointer)
  }

  @inlinable @discardableResult
  public func destroy() -> Value
  {
    let returned = storage.pointee.dispose()
    storage.deallocate()
    return returned
  }

  @usableFromInline
  internal var _ptr: UnsafeMutablePointer<Value.AtomicStorage> {
    @inlinable
    get { // Storage is layout-compatible with its single property
      return UnsafeMutableRawPointer(storage).assumingMemoryBound(to: Value.AtomicStorage.self)
    }
  }
#else
  public struct Storage
  {
    @_versioned
    internal var value: Value.AtomicStorage

    @inline(__always)
    public init(_ value: Value)
    {
      self.value = Value.prepareAtomicStorage(for: value)
    }

    @inline(__always) @discardableResult
    public mutating func dispose() -> Value
    {
      return Value.disposeAtomicStorage(&value)
    }
  }

  @_versioned
  internal let storage: UnsafeMutablePointer<Storage>

  @inline(__always)
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    storage = pointer
  }

  @inline(__always)
  public static func create(initialValue: Value) -> UnsafeAtomic
  {
    let pointer = UnsafeMutablePointer<Storage>.allocate(capacity: 1)
    pointer.initialize(to: Storage(initialValue))
    return UnsafeAtomic(at: pointer)
  }

  @inline(__always) @discardableResult
  public func destroy() -> Value
  {
    let returned = storage.pointee.dispose()
    storage.deallocate()
    return returned
  }

  @_versioned
  internal var _ptr: UnsafeMutablePointer<Value.AtomicStorage> {
    @inline(__always)
    get { // Storage is layout-compatible with its single property
      return UnsafeMutableRawPointer(storage).assumingMemoryBound(to: Value.AtomicStorage.self)
    }
  }
#endif
}

extension UnsafeAtomic
{
#if swift(>=4.2)
  @inlinable
  public func load(ordering: AtomicLoadOrdering) -> Value
  {
    let encoded = Value.AtomicStorage.atomicLoad(at: _ptr, ordering: ordering)
    return Value.decodeAtomicStorage(encoded)
  }

  @inlinable
  public func store(_ desired: Value, ordering: AtomicStoreOrdering)
  {
    Value.AtomicStorage.atomicStore(Value.encodeAtomicStorage(for: desired),
                                    at: _ptr, ordering: ordering)
  }

  @inlinable
  public func exchange(_ desired: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    let encoded = Value.AtomicStorage.atomicExchange(Value.encodeAtomicStorage(for: desired),
                                                     at: _ptr, ordering: ordering)
    return Value.decodeAtomicStorage(encoded)
  }

  @inlinable
  public func compareExchange(expected: Value, desired: Value,
                              ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Value)
  {
    let (e, v) = Value.AtomicStorage.atomicCompareExchange(expected: Value.encodeAtomicStorage(for: expected),
                                                           desired: Value.encodeAtomicStorage(for: desired),
                                                           at: _ptr, ordering: ordering)
    return (e, Value.decodeAtomicStorage(v))
  }

  @inlinable
  public func compareExchange(expected: Value, desired: Value,
                              ordering: AtomicUpdateOrdering,
                              failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Value)
  {
    let (e, v) = Value.AtomicStorage.atomicCompareExchange(expected: Value.encodeAtomicStorage(for: expected),
                                                           desired: Value.encodeAtomicStorage(for: desired),
                                                           at: _ptr, ordering: ordering, failureOrdering: failureOrdering)
    return (e, Value.decodeAtomicStorage(v))
  }

  @inlinable
  public func weakCompareExchange(expected: Value, desired: Value,
                                  ordering: AtomicUpdateOrdering,
                                  failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Value)
  {
    let (e, v) = Value.AtomicStorage.atomicWeakCompareExchange(expected: Value.encodeAtomicStorage(for: expected),
                                                               desired: Value.encodeAtomicStorage(for: desired),
                                                               at: _ptr, ordering: ordering, failureOrdering: failureOrdering)
    return (e, Value.decodeAtomicStorage(v))
  }
#else
  @inline(__always)
  public func load(ordering: AtomicLoadOrdering) -> Value
  {
    let encoded = Value.AtomicStorage.atomicLoad(at: _ptr, ordering: ordering)
    return Value.decodeAtomicStorage(encoded)
  }

  @inline(__always)
  public func store(_ desired: Value, ordering: AtomicStoreOrdering)
  {
    Value.AtomicStorage.atomicStore(Value.encodeAtomicStorage(for: desired),
                                    at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func exchange(_ desired: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    let encoded = Value.AtomicStorage.atomicExchange(Value.encodeAtomicStorage(for: desired),
                                                     at: _ptr, ordering: ordering)
    return Value.decodeAtomicStorage(encoded)
  }

  @inline(__always)
  public func compareExchange(expected: Value, desired: Value,
                              ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Value)
  {
    let (e, v) = Value.AtomicStorage.atomicCompareExchange(expected: Value.encodeAtomicStorage(for: expected),
                                                           desired: Value.encodeAtomicStorage(for: desired),
                                                           at: _ptr, ordering: ordering)
    return (e, Value.decodeAtomicStorage(v))
  }

  @inline(__always)
  public func compareExchange(expected: Value, desired: Value,
                              ordering: AtomicUpdateOrdering,
                              failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Value)
  {
    let (e, v) = Value.AtomicStorage.atomicCompareExchange(expected: Value.encodeAtomicStorage(for: expected),
                                                           desired: Value.encodeAtomicStorage(for: desired),
                                                           at: _ptr, ordering: ordering, failureOrdering: failureOrdering)
    return (e, Value.decodeAtomicStorage(v))
  }

  @inline(__always)
  public func weakCompareExchange(expected: Value, desired: Value,
                                  ordering: AtomicUpdateOrdering,
                                  failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Value)
  {
    let (e, v) = Value.AtomicStorage.atomicWeakCompareExchange(expected: Value.encodeAtomicStorage(for: expected),
                                                               desired: Value.encodeAtomicStorage(for: desired),
                                                               at: _ptr, ordering: ordering, failureOrdering: failureOrdering)
    return (e, Value.decodeAtomicStorage(v))
  }
#endif
}

extension UnsafeAtomic where Value: AtomicInteger
{
#if swift(>=4.2)
  @inlinable
  public func loadThenWrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inlinable
  public func loadThenWrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inlinable
  public func loadThenBitwiseAnd(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering)
  }

  @inlinable
  public func loadThenBitwiseOr(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering)
  }

  @inlinable
  public func loadThenBitwiseXor(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering)
  }

  @inlinable
  public func wrappingIncrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering) &+ operand
  }

  @inlinable
  public func wrappingDecrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering) &- operand
  }

  @inlinable
  public func bitwiseAndThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering) & operand
  }

  @inlinable
  public func bitwiseOrThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering) | operand
  }

  @inlinable
  public func bitwiseXorThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering) ^ operand
  }
  
  @inlinable
  public func wrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inlinable
  public func wrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }
#else
  @inline(__always)
  public func loadThenWrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func loadThenWrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func loadThenBitwiseAnd(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func loadThenBitwiseOr(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func loadThenBitwiseXor(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func wrappingIncrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering) &+ operand
  }

  @inline(__always)
  public func wrappingDecrementThenLoad(by operand: Value = 1, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering) &- operand
  }

  @inline(__always)
  public func bitwiseAndThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseAnd(with: operand, at: _ptr, ordering: ordering) & operand
  }

  @inline(__always)
  public func bitwiseOrThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseOr(with: operand, at: _ptr, ordering: ordering) | operand
  }

  @inline(__always)
  public func bitwiseXorThenLoad(with operand: Value, ordering: AtomicUpdateOrdering) -> Value
  {
    return Value.atomicLoadThenBitwiseXor(with: operand, at: _ptr, ordering: ordering) ^ operand
  }
  
  @inline(__always)
  public func wrappingIncrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingIncrement(by: operand, at: _ptr, ordering: ordering)
  }

  @inline(__always)
  public func wrappingDecrement(by operand: Value = 1, ordering: AtomicUpdateOrdering)
  {
    _ = Value.atomicLoadThenWrappingDecrement(by: operand, at: _ptr, ordering: ordering)
  }
#endif
}

#if swift(>=4.1)
#else
extension UnsafeMutablePointer
{
  @_versioned
  func deallocate()
  {
    self.deallocate(capacity: 1)
  }
}
#endif
