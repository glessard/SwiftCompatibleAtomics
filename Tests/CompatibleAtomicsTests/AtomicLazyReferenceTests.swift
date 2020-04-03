//
//  AtomicLazyReferenceTests.swift
//  
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  This file is distributed under the BSD 3-clause license. See LICENSE for details.
//

import XCTest

import CompatibleAtomics

public class AtomicLazyReferenceTests: XCTestCase
{
  class TestObject
  {
    deinit {
      print(ObjectIdentifier(self))
    }
  }

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
}
