//
//  AtomicLazyReference.swift
//
//  Licensed under Apache License v2.0
//

import CAtomics

public struct UnsafeAtomicLazyReference<Instance: AnyObject>
{
  public typealias AtomicStorage = CAtomics.AtomicOptionalRawPointer

  @usableFromInline
  internal let _ptr: UnsafeMutablePointer<AtomicStorage>

  public init(at address: UnsafeMutablePointer<AtomicStorage>)
  {
    self._ptr = address
  }

  @inlinable public static func create() -> UnsafeAtomicLazyReference<Instance>
  {
    let ptr = UnsafeMutablePointer<AtomicStorage>.allocate(capacity: 1)
    ptr.initialize(to: AtomicOptionalRawPointer(nil))
    return UnsafeAtomicLazyReference(at: ptr)
  }

  public func destroy()
  {
    if let unmanaged = CAtomicsLoad(_ptr, .acquire).map(Unmanaged<Instance>.fromOpaque(_:))
    {
      unmanaged.release()
    }
    _ptr.deinitialize(count: 1)
    _ptr.deallocate()
  }

  public func storeIfNil(_ desired: Instance) -> Instance
  {
    let value = Unmanaged.passRetained(desired)
    var existing = UnsafeRawPointer(bitPattern: 0)
    let success = CAtomicsCompareAndExchange(_ptr, &existing, value.toOpaque(), .strong, .acqrel, .acquire)
    if !success
    {
      value.release()
      return Unmanaged.fromOpaque(existing!).takeUnretainedValue()
    }
    return desired
  }

  public func load() -> Instance?
  {
    if let unmanaged = CAtomicsLoad(_ptr, .acquire).map(Unmanaged<Instance>.fromOpaque(_:))
    {
      return unmanaged.takeUnretainedValue()
    }
    return nil
  }
}
