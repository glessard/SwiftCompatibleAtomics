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

    let a = AtomicUInt(encoding: v)
    let i = a.decode()
    XCTAssertEqual(i, v)
  }

  func testAtomicFunctionShapes()
  {
    var a = AtomicUInt(encoding: UInt.randomPositive())
    var b = CAtomicsPrimitivesLoad(&a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    a = AtomicUInt(encoding: UInt.randomPositive())
    CAtomicsPrimitivesStore(&b, a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    var c = CAtomicsPrimitivesExchange(&a, AtomicUInt(encoding: 0), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), c.decode())

    c = CAtomicsPrimitivesAdd(&a, AtomicUInt(encoding: 1), .relaxed)
    XCTAssertEqual(c.decode(), 0)
    XCTAssertEqual(a.decode(), 1)

    b = CAtomicsPrimitivesSubtract(&a, AtomicUInt(encoding: 1), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), 1)

    a = AtomicUInt(encoding: 0b11)
    b = AtomicUInt(encoding: 0b00)
    CAtomicsPrimitivesBitwiseOr(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b11)

    a = AtomicUInt(encoding: 0b01)
    b = AtomicUInt(encoding: 0b11)
    CAtomicsPrimitivesBitwiseAnd(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b01)

    a = AtomicUInt(encoding: 0x1001)
    b = AtomicUInt(encoding: 0x0001)
    CAtomicsPrimitivesBitwiseXor(&b, a, .relaxed)

    a = AtomicUInt(encoding: 1)
    b = AtomicUInt(encoding: 7)
    c = a
    let s = CAtomicsPrimitivesCompareAndExchangeStrong(&a, &c, b, .relaxed, .relaxed)
    XCTAssertEqual(s, true)
    XCTAssertEqual(a.decode(), b.decode())

    while !CAtomicsPrimitivesCompareAndExchangeWeak(&a, &c, AtomicUInt(encoding: UInt.min), .relaxed, .relaxed) {}
    XCTAssertEqual(a.decode(), UInt.min)

    XCTAssertTrue(CAtomicsPrimitivesIsLockFree(&a))
  }
}
