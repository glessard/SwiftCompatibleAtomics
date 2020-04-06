//
//  AtomicLazyReference.swift
//
//  Licensed under Apache License v2.0
//

import CAtomics

public struct UnsafeAtomicLazyReference<Instance: AnyObject>
{
  public typealias AtomicStorage = CAtomics.AtomicOptionalRawPointer

#if swift(>=4.2)
  @usableFromInline
  internal let _ptr: UnsafeMutablePointer<AtomicStorage>

  @inlinable
  public init(at pointer: UnsafeMutablePointer<AtomicStorage>)
  {
    self._ptr = pointer
  }

  @inlinable
  public static func create() -> UnsafeAtomicLazyReference<Instance>
  {
    let ptr = UnsafeMutablePointer<AtomicStorage>.allocate(capacity: 1)
    ptr.initialize(to: AtomicOptionalRawPointer(nil))
    return UnsafeAtomicLazyReference(at: ptr)
  }

  @inlinable
  public func destroy()
  {
    if let unmanaged = CAtomicsLoad(_ptr, .acquire).map(Unmanaged<Instance>.fromOpaque(_:))
    {
      unmanaged.release()
    }
    _ptr.deinitialize(count: 1)
    _ptr.deallocate()
  }

  @inlinable
  public func storeIfNil(_ desired: Instance) -> Instance
  {
    let value = Unmanaged.passRetained(desired)
    var existing = UnsafeRawPointer(bitPattern: 0)
    let success = CAtomicsCompareAndExchangeStrong(_ptr, &existing, value.toOpaque(), .acqrel, .acquire)
    if !success
    {
      value.release()
      return Unmanaged.fromOpaque(existing!).takeUnretainedValue()
    }
    return desired
  }

  @inlinable
  public func load() -> Instance?
  {
    if let unmanaged = CAtomicsLoad(_ptr, .acquire).map(Unmanaged<Instance>.fromOpaque(_:))
    {
      return unmanaged.takeUnretainedValue()
    }
    return nil
  }
#else
  @_versioned
  internal let _ptr: UnsafeMutablePointer<AtomicStorage>

  @inline(__always)
  public init(at pointer: UnsafeMutablePointer<AtomicStorage>)
  {
    self._ptr = pointer
  }

  @inline(__always)
  public static func create() -> UnsafeAtomicLazyReference<Instance>
  {
    let ptr = UnsafeMutablePointer<AtomicStorage>.allocate(capacity: 1)
    ptr.initialize(to: AtomicOptionalRawPointer(nil))
    return UnsafeAtomicLazyReference(at: ptr)
  }

  @inline(__always)
  public func destroy()
  {
    if let unmanaged = CAtomicsLoad(_ptr, .acquire).map(Unmanaged<Instance>.fromOpaque(_:))
    {
      unmanaged.release()
    }
    _ptr.deinitialize(count: 1)
    _ptr.deallocate()
  }

  @inline(__always)
  public func storeIfNil(_ desired: Instance) -> Instance
  {
    let value = Unmanaged.passRetained(desired)
    var existing = UnsafeRawPointer(bitPattern: 0)
    let success = CAtomicsCompareAndExchangeStrong(_ptr, &existing, value.toOpaque(), .acqrel, .acquire)
    if !success
    {
      value.release()
      return Unmanaged.fromOpaque(existing!).takeUnretainedValue()
    }
    return desired
  }

  @inline(__always)
  public func load() -> Instance?
  {
    if let unmanaged = CAtomicsLoad(_ptr, .acquire).map(Unmanaged<Instance>.fromOpaque(_:))
    {
      return unmanaged.takeUnretainedValue()
    }
    return nil
  }
#endif
}