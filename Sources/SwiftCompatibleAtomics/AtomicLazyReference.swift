//
//  AtomicLazyReference.swift
//
//  Licensed under Apache License v2.0
//

import CAtomicsPrimitives

public struct UnsafeAtomicLazyReference<Instance: AnyObject>
{
  public typealias Storage = UnsafeAtomic<Unmanaged<Instance>?>.Storage

#if swift(>=4.2)
  @usableFromInline
  internal let atomic: UnsafeAtomic<Unmanaged<Instance>?>

  @inlinable
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    atomic = UnsafeAtomic(at: pointer)
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
                                               ordering: .acquiringAndReleasing,
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
  @_versioned
  internal let atomic: UnsafeAtomic<Unmanaged<Instance>?>

  @inline(__always)
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    atomic = UnsafeAtomic(at: pointer)
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
                                               ordering: .acquiringAndReleasing,
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
