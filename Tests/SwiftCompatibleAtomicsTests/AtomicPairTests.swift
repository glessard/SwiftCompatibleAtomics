//
//  AtomicPointerTests.swift
//
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics

public class AtomicPairTests: XCTestCase
{
  public func testUnsafePair()
  {
    let r1 = (0, false)

    let i = UnsafeAtomicPair<Int, Bool>.create(initialValues: r1)

    let r2 = i.destroy()
    XCTAssert(r1 == r2)
  }
}
