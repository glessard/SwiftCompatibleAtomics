//
//  AtomicsTests.swift
//  

import XCTest

import CAtomicPrimitives

class AtomicsTests: XCTestCase
{
  func testAtomicTypeShape()
  {
    let v = UInt.randomPositive()

    let a = CAtomicPrimitiveUInt(encoding: v)
    let i = a.decode()
    XCTAssertEqual(i, v)
  }

  func testAtomicFunctionShapes()
  {
    var a = CAtomicPrimitiveUInt(encoding: UInt.randomPositive())
    var b = CAtomicPrimitivesLoad(&a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    a = CAtomicPrimitiveUInt(encoding: UInt.randomPositive())
    CAtomicPrimitivesStore(&b, a, .relaxed)
    XCTAssertEqual(a.decode(), b.decode())

    var c = CAtomicPrimitivesExchange(&a, CAtomicPrimitiveUInt(encoding: 0), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), c.decode())

    c = CAtomicPrimitivesAdd(&a, CAtomicPrimitiveUInt(encoding: 1), .relaxed)
    XCTAssertEqual(c.decode(), 0)
    XCTAssertEqual(a.decode(), 1)

    b = CAtomicPrimitivesSubtract(&a, CAtomicPrimitiveUInt(encoding: 1), .relaxed)
    XCTAssertEqual(a.decode(), 0)
    XCTAssertEqual(b.decode(), 1)

    a = CAtomicPrimitiveUInt(encoding: 0b11)
    b = CAtomicPrimitiveUInt(encoding: 0b00)
    CAtomicPrimitivesBitwiseOr(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b11)

    a = CAtomicPrimitiveUInt(encoding: 0b01)
    b = CAtomicPrimitiveUInt(encoding: 0b11)
    CAtomicPrimitivesBitwiseAnd(&b, a, .relaxed)
    XCTAssertEqual(b.decode(), 0b01)

    a = CAtomicPrimitiveUInt(encoding: 0x1001)
    b = CAtomicPrimitiveUInt(encoding: 0x0001)
    CAtomicPrimitivesBitwiseXor(&b, a, .relaxed)

    a = CAtomicPrimitiveUInt(encoding: 1)
    b = CAtomicPrimitiveUInt(encoding: 7)
    c = a
    let s = CAtomicPrimitivesCompareAndExchangeStrong(&a, &c, b, .relaxed, .relaxed)
    XCTAssertEqual(s, true)
    XCTAssertEqual(a.decode(), b.decode())

    while !CAtomicPrimitivesCompareAndExchangeWeak(&a, &c, CAtomicPrimitiveUInt(encoding: UInt.min), .relaxed, .relaxed) {}
    XCTAssertEqual(a.decode(), UInt.min)

    XCTAssertTrue(CAtomicPrimitivesIsLockFree(&a))
  }
}
