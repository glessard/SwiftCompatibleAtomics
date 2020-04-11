//
//  AtomicsTests.swift
//  

import XCTest

import CAtomicsPrimitives

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
    var a = AtomicInt(Int.randomPositive())
    var b = CAtomicsLoad(&a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    a = AtomicInt(Int.randomPositive())
    CAtomicsStore(&b, a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    var c = CAtomicsExchange(&a, AtomicInt(0), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), c.decode())

    c = CAtomicsAdd(&a, AtomicInt(1), .relaxed)
    XCTAssertEqual(c.decode(), 0)
    XCTAssertEqual(a.decode(), 1)

    b = CAtomicsSubtract(&a, AtomicInt(1), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), 1)

    a = AtomicInt(0b11)
    b = AtomicInt(0b00)
    CAtomicsBitwiseOr(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b11)

    a = AtomicInt(0b01)
    b = AtomicInt(0b11)
    CAtomicsBitwiseAnd(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b01)

    a = AtomicInt(0x1001)
    b = AtomicInt(0x0001)
    CAtomicsBitwiseXor(&b, a, .relaxed)
    print(b.decode(), 0b1000)

    a = AtomicInt(1)
    b = AtomicInt(7)
    c = a
    let s = CAtomicsCompareAndExchangeStrong(&a, &c, b, .relaxed, .relaxed)
    XCTAssertEqual(s, true)
    XCTAssertEqual(a.decode(), b.decode())

    while !CAtomicsCompareAndExchangeWeak(&a, &c, AtomicInt(Int.min), .relaxed, .relaxed) {}
    XCTAssertEqual(a.decode(), Int.min)

    XCTAssertTrue(CAtomicsIsLockFree(&a))
  }
}
