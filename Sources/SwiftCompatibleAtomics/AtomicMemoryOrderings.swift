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

import CAtomicsPrimitives

public struct AtomicLoadOrdering: Equatable, Hashable
{
#if swift(>=4.2)
  @usableFromInline
  internal var _rawValue: LoadMemoryOrder

  @inlinable
  internal init(_rawValue: LoadMemoryOrder) { self._rawValue = _rawValue }
#else
  @_versioned
  internal var _rawValue: LoadMemoryOrder

  @inline(__always)
  internal init(_rawValue: LoadMemoryOrder) { self._rawValue = _rawValue }
#endif

  public static var relaxed: AtomicLoadOrdering                { return .init(_rawValue: .relaxed) }
  public static var acquiring: AtomicLoadOrdering              { return .init(_rawValue: .acquire) }
  public static var sequentiallyConsistent: AtomicLoadOrdering { return .init(_rawValue: .sequential) }
}

extension AtomicLoadOrdering: CustomStringConvertible
{
  public var description: String {
    switch self {
    case .relaxed: return "relaxed"
    case .acquiring: return "acquiring"
    case .sequentiallyConsistent: return "sequentiallyConsistent"
    default: return "AtomicLoadOrdering(\(_rawValue))"
    }
  }
}


public struct AtomicStoreOrdering: Equatable, Hashable
{
#if swift(>=4.2)
  @usableFromInline
  internal var _rawValue: StoreMemoryOrder

  @inlinable
  internal init(_rawValue: StoreMemoryOrder) { self._rawValue = _rawValue }
#else
  @_versioned
  internal var _rawValue: StoreMemoryOrder

  @inline(__always)
  internal init(_rawValue: StoreMemoryOrder) { self._rawValue = _rawValue }
#endif

  public static var relaxed: AtomicStoreOrdering                { return .init(_rawValue: .relaxed) }
  public static var releasing: AtomicStoreOrdering              { return .init(_rawValue: .release) }
  public static var sequentiallyConsistent: AtomicStoreOrdering { return .init(_rawValue: .sequential) }
}

extension AtomicStoreOrdering: CustomStringConvertible
{
  public var description: String {
    switch self {
    case .relaxed: return "relaxed"
    case .releasing: return "releasing"
    case .sequentiallyConsistent: return "sequentiallyConsistent"
    default: return "AtomicStoreOrdering(\(_rawValue))"
    }
  }
}


public struct AtomicUpdateOrdering: Equatable, Hashable
{
#if swift(>=4.2)
  @usableFromInline
  internal var _rawValue: UpdateMemoryOrder

  @inlinable
  internal init(_rawValue: UpdateMemoryOrder) { self._rawValue = _rawValue }
#else
  @_versioned
  internal var _rawValue: UpdateMemoryOrder

  @inline(__always)
  internal init(_rawValue: UpdateMemoryOrder) { self._rawValue = _rawValue }
#endif

  public static var relaxed: AtomicUpdateOrdering                { return .init(_rawValue: .relaxed) }
  public static var acquiring: AtomicUpdateOrdering              { return .init(_rawValue: .acquire) }
  public static var releasing: AtomicUpdateOrdering              { return .init(_rawValue: .release) }
  public static var acquiringAndReleasing: AtomicUpdateOrdering  { return .init(_rawValue: .acqrel) }
  public static var sequentiallyConsistent: AtomicUpdateOrdering { return .init(_rawValue: .sequential) }

#if swift(>=4.2)
  @usableFromInline
  internal func asLoadOrdering() -> AtomicLoadOrdering
  {
    switch self {
    case .relaxed:                return .relaxed
    case .acquiring:              return .acquiring
    case .releasing:              return .relaxed
    case .acquiringAndReleasing:  return .acquiring
    case .sequentiallyConsistent: return .sequentiallyConsistent
    default: return AtomicLoadOrdering(_rawValue: LoadMemoryOrder(rawValue: self._rawValue.rawValue)!)
    }
  }
#else
  @_versioned
  internal func asLoadOrdering() -> AtomicLoadOrdering
  {
    switch self {
    case .relaxed:                return .relaxed
    case .acquiring:              return .acquiring
    case .releasing:              return .relaxed
    case .acquiringAndReleasing:  return .acquiring
    case .sequentiallyConsistent: return .sequentiallyConsistent
    default: return AtomicLoadOrdering(_rawValue: LoadMemoryOrder(rawValue: self._rawValue.rawValue)!)
    }
  }
#endif
}

extension AtomicUpdateOrdering: CustomStringConvertible {
  public var description: String {
    switch self {
    case .relaxed: return "relaxed"
    case .acquiring: return "acquiring"
    case .releasing: return "releasing"
    case .acquiringAndReleasing: return "acquiringAndReleasing"
    case .sequentiallyConsistent: return "sequentiallyConsistent"
    default: return "AtomicUpdateOrdering(\(_rawValue))"
    }
  }
}

#if swift(>=4.2)
@inlinable
public func atomicMemoryFence(ordering: AtomicUpdateOrdering)
{
  CAtomicsThreadFence(ordering._rawValue)
}
#else
@inline(__always)
public func atomicMemoryFence(ordering: AtomicUpdateOrdering)
{
  CAtomicsThreadFence(ordering._rawValue)
}
#endif
