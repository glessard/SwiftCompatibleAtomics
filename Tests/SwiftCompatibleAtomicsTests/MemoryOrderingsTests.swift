//
//  MemoryOrderingsTests.swift
//  
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics

public class MemoryOrderingsTests: XCTestCase
{
  public func testLoadOrderingDescriptions()
  {
    let o: [AtomicLoadOrdering] = [.relaxed, .acquiring, .sequentiallyConsistent]
    let s = ["relaxed", "acquiring", "sequentiallyConsistent"]

    for (a, b) in zip(o.map(String.init(describing:)), s)
    {
      XCTAssertEqual(a, b)
    }
  }

  public func testStoreOrderingDescriptions()
  {
    let o: [AtomicStoreOrdering] = [.relaxed, .releasing, .sequentiallyConsistent]
    let s = ["relaxed", "releasing", "sequentiallyConsistent"]

    for (a, b) in zip(o.map(String.init(describing:)), s)
    {
      XCTAssertEqual(a, b)
    }
  }

  public func testUpdateOrderingDescriptions()
  {
    let o: [AtomicUpdateOrdering] = [.relaxed, .acquiring, .releasing, .acquiringAndReleasing, .sequentiallyConsistent]
    let s = ["relaxed", "acquiring", "releasing", "acquiringAndReleasing", "sequentiallyConsistent"]

    for (a, b) in zip(o.map(String.init(describing:)), s)
    {
      XCTAssertEqual(a, b)
    }
  }

  public func testMemoryFence()
  { // find an algorithm that depends on a fence for correctness
    atomicMemoryFence(ordering: .sequentiallyConsistent)
  }

  public func testCASOrderings()
  {
    let i = UnsafePointerToAtomic<Int>.create(initialValue: 0)
    var (s, r) = (false, Int.min)

    (s, r) = i.compareExchange(expected: 0, desired: 1, ordering: .releasing)
    XCTAssertEqual(s, true)
    XCTAssertEqual(r, 0)
    i.store(1, ordering: .releasing)

    (s, r) = i.compareExchange(expected: 1, desired: 2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(s, true)
    XCTAssertEqual(r, 1)

    (s, r) = i.compareExchange(expected: 2, desired: 3, ordering: .relaxed)
    XCTAssertEqual(s, true)
    XCTAssertEqual(r, 2)

    i.destroy()
  }
}
