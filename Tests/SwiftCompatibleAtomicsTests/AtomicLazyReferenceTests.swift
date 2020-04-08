//
//  AtomicLazyReferenceTests.swift
//  
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics

public class AtomicLazyReferenceTests: XCTestCase
{
  class TestObject {}

  public func testAtomicLazyReference()
  {
    let i = UnsafePointerToAtomicLazyReference<TestObject>.create()

    var o = i.load()
    XCTAssertNil(o)

    let p = i.storeIfNil(TestObject())
    XCTAssertNotNil(p)

    o = i.load()
    XCTAssertNotNil(o)
    XCTAssertEqual(ObjectIdentifier(o!), ObjectIdentifier(p))

    let n = TestObject()
    o = i.storeIfNil(n)
    XCTAssertNotNil(o)
    XCTAssertEqual(ObjectIdentifier(o!), ObjectIdentifier(p))

    i.destroy()
  }

  public func testDeallocation()
  {
    class DeallocationWitness
    {
      let e: XCTestExpectation
      init(_ expectation: XCTestExpectation) { e = expectation }
      deinit {
        e.fulfill()
      }
    }

    let i = UnsafePointerToAtomicLazyReference<DeallocationWitness>.create()
    _ = i.storeIfNil(DeallocationWitness(expectation(description: #function)))

    i.destroy()
    waitForExpectations(timeout: 1.0)
  }
}
