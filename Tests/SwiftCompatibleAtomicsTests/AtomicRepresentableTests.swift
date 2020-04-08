//
//  AtomicRepresentableTests.swift
//  
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics

enum TestEnum: UInt32, AtomicProtocol
{
  case a = 0, b, c, d, e, f, g, h
}

class AtomicRepresentableTests: XCTestCase
{
  func testAtomicRepresentableEnum()
  {
    let i = UnsafePointerToAtomic<TestEnum>.create(initialValue: .a)
    XCTAssertEqual(i.load(ordering: .relaxed), .a)

    i.store(.b, ordering: .relaxed)
    XCTAssertEqual(.b, i.load(ordering: .relaxed))

    var j = i.exchange(.c, ordering: .acquiringAndReleasing)
    XCTAssertEqual(.b, j)
    XCTAssertEqual(.c, i.load(ordering: .relaxed))

    var s = false
    (s, j) = i.compareExchange(expected: .b, desired: .d, ordering: .acquiringAndReleasing)
    XCTAssertEqual(s, false)
    XCTAssertEqual(j, .c)
    (s, j) = i.compareExchange(expected: j, desired: .e, ordering: .releasing, failureOrdering: .relaxed)
    XCTAssertEqual(s, true)
    XCTAssertEqual(j, .c)
    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: .f, ordering: .releasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(j, .e)

    i.destroy()
  }
}
