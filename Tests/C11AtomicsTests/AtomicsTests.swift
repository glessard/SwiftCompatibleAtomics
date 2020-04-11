//
//  AtomicsTests.swift
//  

import XCTest

import C11Atomics

class AtomicsTests: XCTestCase
{
  func testAtomicTypeShape()
  {
    let v = Int.randomPositive()

    let a = AtomicInt(v)
    let i = a.decode()
    XCTAssertEqual(i, v)
  }

  func testAtomicFunctionShapes()
  {
    var a = AtomicInt(0)

    let i = CAtomicsLoad(&a, .relaxed)
    XCTAssertEqual(a.decode(), i.decode())
  }
}
