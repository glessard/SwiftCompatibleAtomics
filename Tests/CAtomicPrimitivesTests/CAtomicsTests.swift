//
//  CAtomicsTests.swift
//  AtomicsTests
//
//  Copyright © 2016-2020 Guillaume Lessard. All rights reserved.
//  This file is distributed under the BSD 3-clause license. See LICENSE for details.
//

import XCTest

import CAtomicPrimitives

public class CAtomicsBasicTests: XCTestCase
{
  public func testInt()
  {
    let r1 = Int(0)
    let r2 = Int.randomPositive()
    let r3 = Int.randomPositive()

    var i = CAtomicPrimitiveInt(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveInt(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveInt(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveInt(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveInt(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt()
  {
    let r1 = UInt(0)
    let r2 = UInt.randomPositive()
    let r3 = UInt.randomPositive()

    var i = CAtomicPrimitiveUInt(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveUInt(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveUInt(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveUInt(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveUInt(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt8()
  {
    let r1 = Int8(0)
    let r2 = Int8.randomPositive()
    let r3 = Int8.randomPositive()

    var i = CAtomicPrimitiveInt8(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt8(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveInt8(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveInt8(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveInt8(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt8(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveInt8(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt8()
  {
    let r1 = UInt8(0)
    let r2 = UInt8.randomPositive()
    let r3 = UInt8.randomPositive()

    var i = CAtomicPrimitiveUInt8(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt8(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveUInt8(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveUInt8(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveUInt8(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt8(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveUInt8(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt16()
  {
    let r1 = Int16(0)
    let r2 = Int16.randomPositive()
    let r3 = Int16.randomPositive()

    var i = CAtomicPrimitiveInt16(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt16(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveInt16(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveInt16(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveInt16(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt16(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveInt16(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt16()
  {
    let r1 = UInt16(0)
    let r2 = UInt16.randomPositive()
    let r3 = UInt16.randomPositive()

    var i = CAtomicPrimitiveUInt16(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt16(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveUInt16(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveUInt16(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveUInt16(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt16(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveUInt16(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt32()
  {
    let r1 = Int32(0)
    let r2 = Int32.randomPositive()
    let r3 = Int32.randomPositive()

    var i = CAtomicPrimitiveInt32(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt32(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveInt32(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveInt32(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveInt32(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt32(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveInt32(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt32()
  {
    let r1 = UInt32(0)
    let r2 = UInt32.randomPositive()
    let r3 = UInt32.randomPositive()

    var i = CAtomicPrimitiveUInt32(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt32(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveUInt32(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveUInt32(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveUInt32(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt32(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveUInt32(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt64()
  {
    let r1 = Int64(0)
    let r2 = Int64.randomPositive()
    let r3 = Int64.randomPositive()

    var i = CAtomicPrimitiveInt64(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt64(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveInt64(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveInt64(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveInt64(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveInt64(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveInt64(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt64()
  {
    let r1 = UInt64(0)
    let r2 = UInt64.randomPositive()
    let r3 = UInt64.randomPositive()

    var i = CAtomicPrimitiveUInt64(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitivesAdd(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicPrimitivesSubtract(&i, CAtomicPrimitiveUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseOr(&i, CAtomicPrimitiveUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt64(encoding: r2), .relaxed)
    j = CAtomicPrimitivesBitwiseXor(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    j = CAtomicPrimitivesBitwiseAnd(&i, CAtomicPrimitiveUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = CAtomicPrimitiveUInt64(encoding: r1)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveUInt64(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = CAtomicPrimitiveUInt64(encoding: r2)
    CAtomicPrimitivesStore(&i, CAtomicPrimitiveUInt64(encoding: r1), .relaxed)
    while(!CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveUInt64(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testCAtomicPrimitiveRawPointer()
  {
    let r0 = UnsafeRawPointer(bitPattern: 0)
    let r1 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r2 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeRawPointer(bitPattern: UInt.randomPositive())

    var i = CAtomicPrimitiveRawPointer(encoding: r0)
    XCTAssertEqual(r0, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveRawPointer(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveRawPointer(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    XCTAssertEqual(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveRawPointer(encoding: r2), .relaxed, .relaxed), false)
    XCTAssertEqual(r2, j.decode())

    XCTAssertEqual(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveRawPointer(encoding: r3), .relaxed, .relaxed), true)
    XCTAssertEqual(r2, j.decode())

    while !CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveRawPointer(encoding: r1), .relaxed, .relaxed) {}
    XCTAssertEqual(r3, j.decode())
    XCTAssertEqual(r1, i.decode())
  }

  public func testCAtomicPrimitiveMutableRawPointer()
  {
    let r0 = UnsafeMutableRawPointer(bitPattern: 0)
    let r1 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r2 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())

    var i = CAtomicPrimitiveMutableRawPointer(encoding: r0)
    XCTAssertEqual(r0, i.decode())
    XCTAssertEqual(CAtomicPrimitivesIsLockFree(&i), true)

    CAtomicPrimitivesStore(&i, CAtomicPrimitiveMutableRawPointer(encoding: r1), .relaxed)
    var j = CAtomicPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicPrimitivesExchange(&i, CAtomicPrimitiveMutableRawPointer(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    XCTAssertEqual(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveMutableRawPointer(encoding: r2), .relaxed, .relaxed), false)
    XCTAssertEqual(r2, j.decode())

    XCTAssertEqual(CAtomicPrimitivesCompareAndExchangeStrong(&i, &j, CAtomicPrimitiveMutableRawPointer(encoding: r3), .relaxed, .relaxed), true)
    XCTAssertEqual(r2, j.decode())

    while !CAtomicPrimitivesCompareAndExchangeWeak(&i, &j, CAtomicPrimitiveMutableRawPointer(encoding: r1), .relaxed, .relaxed) {}
    XCTAssertEqual(r3, j.decode())
    XCTAssertEqual(r1, i.decode())
  }

  public func testFence()
  {
    CAtomicPrimitivesThreadFence(.release)
    CAtomicPrimitivesThreadFence(.acquire)
  }
}
