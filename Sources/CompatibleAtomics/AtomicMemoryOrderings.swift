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

import CAtomics

public struct AtomicLoadOrdering: Equatable, Hashable
{
  @usableFromInline
  internal var _rawValue: LoadMemoryOrder

  @inlinable
  internal init(_rawValue: LoadMemoryOrder) { self._rawValue = _rawValue }

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
  @usableFromInline
  internal var _rawValue: StoreMemoryOrder

  @inlinable
  internal init(_rawValue: StoreMemoryOrder) { self._rawValue = _rawValue }

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
  @usableFromInline
  internal var _rawValue: MemoryOrder

  @inlinable
  internal init(_rawValue: MemoryOrder) { self._rawValue = _rawValue }

  public static var relaxed: AtomicUpdateOrdering                { return .init(_rawValue: .relaxed) }
  public static var acquiring: AtomicUpdateOrdering              { return .init(_rawValue: .acquire) }
  public static var releasing: AtomicUpdateOrdering              { return .init(_rawValue: .release) }
  public static var acquiringAndReleasing: AtomicUpdateOrdering  { return .init(_rawValue: .acqrel) }
  public static var sequentiallyConsistent: AtomicUpdateOrdering { return .init(_rawValue: .sequential) }

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

@inlinable
public func atomicMemoryFence(ordering: AtomicUpdateOrdering)
{
  CAtomicsThreadFence(ordering._rawValue)
}
