//
//  AtomicsTests.swift
//  

import XCTest

import CAtomicsPrimitives

class AtomicsTests: XCTestCase
{
  func testAtomicTypeShape()
  {
    let v = UInt.randomPositive()

    let a = AtomicUInt(v)
    let i = a.decode()
    XCTAssertEqual(i, v)
  }

  func testAtomicFunctionShapes()
  {
    var a = AtomicUInt(UInt.randomPositive())
    var b = CAtomicsLoad(&a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    a = AtomicUInt(UInt.randomPositive())
    CAtomicsStore(&b, a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    var c = CAtomicsExchange(&a, AtomicUInt(0), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), c.decode())

    c = CAtomicsAdd(&a, AtomicUInt(1), .relaxed)
    XCTAssertEqual(c.decode(), 0)
    XCTAssertEqual(a.decode(), 1)

    b = CAtomicsSubtract(&a, AtomicUInt(1), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), 1)

    a = AtomicUInt(0b11)
    b = AtomicUInt(0b00)
    CAtomicsBitwiseOr(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b11)

    a = AtomicUInt(0b01)
    b = AtomicUInt(0b11)
    CAtomicsBitwiseAnd(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b01)

    a = AtomicUInt(0x1001)
    b = AtomicUInt(0x0001)
    CAtomicsBitwiseXor(&b, a, .relaxed)

    a = AtomicUInt(1)
    b = AtomicUInt(7)
    c = a
    let s = CAtomicsCompareAndExchangeStrong(&a, &c, b, .relaxed, .relaxed)
    XCTAssertEqual(s, true)
    XCTAssertEqual(a.decode(), b.decode())

    while !CAtomicsCompareAndExchangeWeak(&a, &c, AtomicUInt(UInt.min), .relaxed, .relaxed) {}
    XCTAssertEqual(a.decode(), UInt.min)

    XCTAssertTrue(CAtomicsIsLockFree(&a))
  }
}
