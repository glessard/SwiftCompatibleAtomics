//
//  CAtomicsTests.swift
//  AtomicsTests
//
//  Copyright © 2016-2020 Guillaume Lessard. All rights reserved.
//  This file is distributed under the BSD 3-clause license. See LICENSE for details.
//

import XCTest

import CAtomicsPrimitives

public class CAtomicsBasicTests: XCTestCase
{
  public func testInt()
  {
    let r1 = Int(0)
    let r2 = Int.randomPositive()
    let r3 = Int.randomPositive()

    var i = AtomicInt(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicInt(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicInt(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicInt(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicInt(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicInt(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt()
  {
    let r1 = UInt(0)
    let r2 = UInt.randomPositive()
    let r3 = UInt.randomPositive()

    var i = AtomicUInt(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicUInt(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicUInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicUInt(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicUInt(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicUInt(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicUInt(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicUInt(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicUInt(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt8()
  {
    let r1 = Int8(0)
    let r2 = Int8.randomPositive()
    let r3 = Int8.randomPositive()

    var i = AtomicInt8(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicInt8(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt8(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt8(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt8(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt8(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicInt8(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicInt8(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt8(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicInt8(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicInt8(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt8()
  {
    let r1 = UInt8(0)
    let r2 = UInt8.randomPositive()
    let r3 = UInt8.randomPositive()

    var i = AtomicUInt8(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicUInt8(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicUInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt8(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt8(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicUInt8(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt8(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicUInt8(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt8(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicUInt8(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicUInt8(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt8(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicUInt8(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicUInt8(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt16()
  {
    let r1 = Int16(0)
    let r2 = Int16.randomPositive()
    let r3 = Int16.randomPositive()

    var i = AtomicInt16(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicInt16(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt16(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt16(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt16(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt16(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicInt16(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicInt16(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt16(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicInt16(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicInt16(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt16()
  {
    let r1 = UInt16(0)
    let r2 = UInt16.randomPositive()
    let r3 = UInt16.randomPositive()

    var i = AtomicUInt16(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicUInt16(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicUInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt16(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt16(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicUInt16(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt16(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicUInt16(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt16(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicUInt16(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicUInt16(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt16(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicUInt16(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicUInt16(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt32()
  {
    let r1 = Int32(0)
    let r2 = Int32.randomPositive()
    let r3 = Int32.randomPositive()

    var i = AtomicInt32(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicInt32(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt32(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt32(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt32(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt32(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicInt32(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicInt32(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt32(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicInt32(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicInt32(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt32()
  {
    let r1 = UInt32(0)
    let r2 = UInt32.randomPositive()
    let r3 = UInt32.randomPositive()

    var i = AtomicUInt32(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicUInt32(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicUInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt32(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt32(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicUInt32(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt32(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicUInt32(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt32(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicUInt32(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicUInt32(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt32(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicUInt32(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicUInt32(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt64()
  {
    let r1 = Int64(0)
    let r2 = Int64.randomPositive()
    let r3 = Int64.randomPositive()

    var i = AtomicInt64(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicInt64(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt64(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt64(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicInt64(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt64(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicInt64(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicInt64(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt64(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicInt64(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicInt64(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt64()
  {
    let r1 = UInt64(0)
    let r2 = UInt64.randomPositive()
    let r3 = UInt64.randomPositive()

    var i = AtomicUInt64(encoding: r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicUInt64(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsPrimitivesAdd(&i, AtomicUInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsPrimitivesSubtract(&i, AtomicUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt64(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseOr(&i, AtomicUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt64(encoding: r2), .relaxed)
    j = CAtomicsPrimitivesBitwiseXor(&i, AtomicUInt64(encoding: r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsPrimitivesStore(&i, AtomicUInt64(encoding: r1), .relaxed)
    j = CAtomicsPrimitivesBitwiseAnd(&i, AtomicUInt64(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt64(encoding: r1)
    CAtomicsPrimitivesStore(&i, AtomicUInt64(encoding: r1), .relaxed)
    XCTAssertTrue(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicUInt64(encoding: r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt64(encoding: r2)
    CAtomicsPrimitivesStore(&i, AtomicUInt64(encoding: r1), .relaxed)
    while(!CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicUInt64(encoding: r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testAtomicRawPointer()
  {
    let r0 = UnsafeRawPointer(bitPattern: 0)
    let r1 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r2 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeRawPointer(bitPattern: UInt.randomPositive())

    var i = AtomicRawPointer(encoding: r0)
    XCTAssertEqual(r0, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicRawPointer(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicRawPointer(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    XCTAssertEqual(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicRawPointer(encoding: r2), .relaxed, .relaxed), false)
    XCTAssertEqual(r2, j.decode())

    XCTAssertEqual(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicRawPointer(encoding: r3), .relaxed, .relaxed), true)
    XCTAssertEqual(r2, j.decode())

    while !CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicRawPointer(encoding: r1), .relaxed, .relaxed) {}
    XCTAssertEqual(r3, j.decode())
    XCTAssertEqual(r1, i.decode())
  }

  public func testAtomicMutableRawPointer()
  {
    let r0 = UnsafeMutableRawPointer(bitPattern: 0)
    let r1 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r2 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())

    var i = AtomicMutableRawPointer(encoding: r0)
    XCTAssertEqual(r0, i.decode())
    XCTAssertEqual(CAtomicsPrimitivesIsLockFree(&i), true)

    CAtomicsPrimitivesStore(&i, AtomicMutableRawPointer(encoding: r1), .relaxed)
    var j = CAtomicsPrimitivesLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsPrimitivesExchange(&i, AtomicMutableRawPointer(encoding: r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    XCTAssertEqual(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicMutableRawPointer(encoding: r2), .relaxed, .relaxed), false)
    XCTAssertEqual(r2, j.decode())

    XCTAssertEqual(CAtomicsPrimitivesCompareAndExchangeStrong(&i, &j, AtomicMutableRawPointer(encoding: r3), .relaxed, .relaxed), true)
    XCTAssertEqual(r2, j.decode())

    while !CAtomicsPrimitivesCompareAndExchangeWeak(&i, &j, AtomicMutableRawPointer(encoding: r1), .relaxed, .relaxed) {}
    XCTAssertEqual(r3, j.decode())
    XCTAssertEqual(r1, i.decode())
  }

  public func testFence()
  {
    CAtomicsPrimitivesThreadFence(.release)
    CAtomicsPrimitivesThreadFence(.acquire)
  }
}
