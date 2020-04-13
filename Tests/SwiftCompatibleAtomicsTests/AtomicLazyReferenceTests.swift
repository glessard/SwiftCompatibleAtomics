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
    let i = UnsafeAtomicLazyReference<TestObject>.create()

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

  public func testAtomicLazyReferenceInitializer()
  {
    let u = UnsafeMutablePointer<UnsafeAtomicLazyReference<TestObject>.Storage>.allocate(capacity: 1)
    u.initialize(to: .init())

    let l = UnsafeAtomicLazyReference(at: u)
    let o = TestObject()

    XCTAssertEqual(ObjectIdentifier(o), ObjectIdentifier(l.storeIfNil(o)))
    XCTAssertEqual(ObjectIdentifier(o), ObjectIdentifier(l.load()!))
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

    let i = UnsafeAtomicLazyReference<DeallocationWitness>.create()
    _ = i.storeIfNil(DeallocationWitness(expectation(description: #function)))

    i.destroy()
    waitForExpectations(timeout: 1.0)

    let j = UnsafeAtomicLazyReference<TestObject>.create()
    XCTAssertNil(j.destroy())
  }
}
