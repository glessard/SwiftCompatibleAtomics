//
//  AtomicLazyReference.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

public struct UnsafeAtomicLazyReference<Instance: AnyObject>
{
#if swift(>=4.2)
  public struct Storage
  {
    @usableFromInline
    internal let value: UnsafeAtomic<Unmanaged<Instance>?>.Storage

    @inlinable
    public init()
    {
      value = UnsafeAtomic.Storage(nil)
    }
  }

  @usableFromInline
  internal let atomic: UnsafeAtomic<Unmanaged<Instance>?>

  @inlinable
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    atomic = UnsafeAtomic(at: UnsafeMutableRawPointer(pointer).assumingMemoryBound(to: UnsafeAtomic.Storage.self))
  }

  @usableFromInline
  internal init()
  {
    atomic = UnsafeAtomic.create(initialValue: nil)
  }

  @inlinable
  public static func create() -> UnsafeAtomicLazyReference
  {
    return UnsafeAtomicLazyReference()
  }

  @inlinable @discardableResult
  public func destroy() -> Instance?
  {
    guard let unmanaged = atomic.destroy()
      else { return nil }

    return unmanaged.takeRetainedValue()
  }

  @inlinable
  public func storeIfNil(_ desired: Instance) -> Instance
  {
    let value = Unmanaged.passRetained(desired)
    let (_, existing) = atomic.compareExchange(expected: nil, desired: value,
                                               successOrdering: .acquiringAndReleasing,
                                               failureOrdering: .acquiring)
    if let existing = existing
    {
      value.release()
      return existing.takeUnretainedValue()
    }
    return desired
  }

  @inlinable
  public func load() -> Instance?
  {
    if let existing = atomic.load(ordering: .acquiring)
    {
      return existing.takeUnretainedValue()
    }
    return nil
  }
#else
  public struct Storage
  {
    @_versioned
    internal let value: UnsafeAtomic<Unmanaged<Instance>?>.Storage

    @inline(__always)
    public init()
    {
      value = UnsafeAtomic.Storage(nil)
    }
  }

  @_versioned
  internal let atomic: UnsafeAtomic<Unmanaged<Instance>?>

  @inline(__always)
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    atomic = UnsafeAtomic(at: UnsafeMutableRawPointer(pointer).assumingMemoryBound(to: UnsafeAtomic.Storage.self))
  }

  @_versioned
  internal init()
  {
    atomic = UnsafeAtomic.create(initialValue: nil)
  }

  @inline(__always)
  public static func create() -> UnsafeAtomicLazyReference
  {
    return UnsafeAtomicLazyReference()
  }

  @inline(__always) @discardableResult
  public func destroy() -> Instance?
  {
    guard let unmanaged = atomic.destroy()
      else { return nil }

    return unmanaged.takeRetainedValue()
  }

  @inline(__always)
  public func storeIfNil(_ desired: Instance) -> Instance
  {
    let value = Unmanaged.passRetained(desired)
    let (_, existing) = atomic.compareExchange(expected: nil, desired: value,
                                               successOrdering: .acquiringAndReleasing,
                                               failureOrdering: .acquiring)
    if let existing = existing
    {
      value.release()
      return existing.takeUnretainedValue()
    }
    return desired
  }

  @inline(__always)
  public func load() -> Instance?
  {
    if let existing = atomic.load(ordering: .acquiring)
    {
      return existing.takeUnretainedValue()
    }
    return nil
  }
#endif
}
