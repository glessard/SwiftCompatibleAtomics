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
#if swift(>=4.0)
    let r2 = Int.randomPositive()
    let r3 = Int.randomPositive()
#else
    let r2 = Int(UInt.randomPositive())
    let r3 = Int(UInt.randomPositive())
#endif

    var i = AtomicInt(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicInt(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicInt(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicInt(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicInt(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicInt(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicInt(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicInt(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicInt(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicInt(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicInt(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt(r1)
    CAtomicsStore(&i, AtomicInt(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicInt(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt(r2)
    CAtomicsStore(&i, AtomicInt(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicInt(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt()
  {
    let r1 = UInt(0)
#if swift(>=4.0)
    let r2 = UInt.randomPositive()
    let r3 = UInt.randomPositive()
#else
    let r2 = UInt(UInt.randomPositive())
    let r3 = UInt(UInt.randomPositive())
#endif

    var i = AtomicUInt(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicUInt(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicUInt(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicUInt(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicUInt(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicUInt(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicUInt(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicUInt(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicUInt(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicUInt(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicUInt(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt(r1)
    CAtomicsStore(&i, AtomicUInt(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicUInt(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt(r2)
    CAtomicsStore(&i, AtomicUInt(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicUInt(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt8()
  {
    let r1 = Int8(0)
#if swift(>=4.0)
    let r2 = Int8.randomPositive()
    let r3 = Int8.randomPositive()
#else
    let r2 = Int8(UInt.randomPositive())
    let r3 = Int8(UInt.randomPositive())
#endif

    var i = AtomicInt8(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicInt8(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicInt8(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicInt8(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicInt8(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicInt8(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicInt8(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicInt8(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicInt8(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicInt8(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicInt8(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt8(r1)
    CAtomicsStore(&i, AtomicInt8(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicInt8(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt8(r2)
    CAtomicsStore(&i, AtomicInt8(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicInt8(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt8()
  {
    let r1 = UInt8(0)
#if swift(>=4.0)
    let r2 = UInt8.randomPositive()
    let r3 = UInt8.randomPositive()
#else
    let r2 = UInt8(UInt.randomPositive())
    let r3 = UInt8(UInt.randomPositive())
#endif

    var i = AtomicUInt8(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicUInt8(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicUInt8(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicUInt8(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicUInt8(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicUInt8(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicUInt8(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicUInt8(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicUInt8(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicUInt8(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicUInt8(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt8(r1)
    CAtomicsStore(&i, AtomicUInt8(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicUInt8(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt8(r2)
    CAtomicsStore(&i, AtomicUInt8(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicUInt8(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt16()
  {
    let r1 = Int16(0)
#if swift(>=4.0)
    let r2 = Int16.randomPositive()
    let r3 = Int16.randomPositive()
#else
    let r2 = Int16(UInt.randomPositive())
    let r3 = Int16(UInt.randomPositive())
#endif

    var i = AtomicInt16(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicInt16(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicInt16(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicInt16(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicInt16(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicInt16(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicInt16(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicInt16(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicInt16(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicInt16(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicInt16(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt16(r1)
    CAtomicsStore(&i, AtomicInt16(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicInt16(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt16(r2)
    CAtomicsStore(&i, AtomicInt16(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicInt16(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt16()
  {
    let r1 = UInt16(0)
#if swift(>=4.0)
    let r2 = UInt16.randomPositive()
    let r3 = UInt16.randomPositive()
#else
    let r2 = UInt16(UInt.randomPositive())
    let r3 = UInt16(UInt.randomPositive())
#endif

    var i = AtomicUInt16(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicUInt16(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicUInt16(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicUInt16(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicUInt16(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicUInt16(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicUInt16(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicUInt16(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicUInt16(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicUInt16(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicUInt16(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt16(r1)
    CAtomicsStore(&i, AtomicUInt16(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicUInt16(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt16(r2)
    CAtomicsStore(&i, AtomicUInt16(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicUInt16(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt32()
  {
    let r1 = Int32(0)
#if swift(>=4.0)
    let r2 = Int32.randomPositive()
    let r3 = Int32.randomPositive()
#else
    let r2 = Int32(UInt.randomPositive())
    let r3 = Int32(UInt.randomPositive())
#endif

    var i = AtomicInt32(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicInt32(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicInt32(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicInt32(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicInt32(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicInt32(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicInt32(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicInt32(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicInt32(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicInt32(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicInt32(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt32(r1)
    CAtomicsStore(&i, AtomicInt32(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicInt32(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt32(r2)
    CAtomicsStore(&i, AtomicInt32(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicInt32(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt32()
  {
    let r1 = UInt32(0)
#if swift(>=4.0)
    let r2 = UInt32.randomPositive()
    let r3 = UInt32.randomPositive()
#else
    let r2 = UInt32(UInt.randomPositive())
    let r3 = UInt32(UInt.randomPositive())
#endif

    var i = AtomicUInt32(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicUInt32(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicUInt32(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicUInt32(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicUInt32(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicUInt32(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicUInt32(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicUInt32(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicUInt32(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicUInt32(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicUInt32(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt32(r1)
    CAtomicsStore(&i, AtomicUInt32(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicUInt32(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt32(r2)
    CAtomicsStore(&i, AtomicUInt32(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicUInt32(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testInt64()
  {
    let r1 = Int64(0)
#if swift(>=4.0)
    let r2 = Int64.randomPositive()
    let r3 = Int64.randomPositive()
#else
    let r2 = Int64(UInt.randomPositive())
    let r3 = Int64(UInt.randomPositive())
#endif

    var i = AtomicInt64(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicInt64(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicInt64(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicInt64(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicInt64(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicInt64(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicInt64(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicInt64(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicInt64(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicInt64(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicInt64(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicInt64(r1)
    CAtomicsStore(&i, AtomicInt64(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicInt64(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicInt64(r2)
    CAtomicsStore(&i, AtomicInt64(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicInt64(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testUInt64()
  {
    let r1 = UInt64(0)
#if swift(>=4.0)
    let r2 = UInt64.randomPositive()
    let r3 = UInt64.randomPositive()
#else
    let r2 = UInt64(UInt.randomPositive())
    let r3 = UInt64(UInt.randomPositive())
#endif

    var i = AtomicUInt64(r1)
    XCTAssertEqual(r1, i.decode())
    XCTAssertEqual(CAtomicsIsLockFree(&i), true)

    CAtomicsStore(&i, AtomicUInt64(r1), .relaxed)
    var j = CAtomicsLoad(&i, .relaxed)
    XCTAssertEqual(i.decode(), j.decode())

    j = CAtomicsExchange(&i, AtomicUInt64(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r2, i.decode())

    j = CAtomicsAdd(&i, AtomicUInt64(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 &+ r2, i.decode())

    j = CAtomicsSubtract(&i, AtomicUInt64(r2), .relaxed)
    XCTAssertEqual(r1 &+ r2, j.decode())
    XCTAssertEqual(r1, i.decode())

    CAtomicsStore(&i, AtomicUInt64(r1), .relaxed)
    j = CAtomicsBitwiseOr(&i, AtomicUInt64(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 | r2, i.decode())

    CAtomicsStore(&i, AtomicUInt64(r2), .relaxed)
    j = CAtomicsBitwiseXor(&i, AtomicUInt64(r1), .relaxed)
    XCTAssertEqual(r2, j.decode())
    XCTAssertEqual(r1 ^ r2, i.decode())

    CAtomicsStore(&i, AtomicUInt64(r1), .relaxed)
    j = CAtomicsBitwiseAnd(&i, AtomicUInt64(r2), .relaxed)
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r1 & r2, i.decode())

    j = AtomicUInt64(r1)
    CAtomicsStore(&i, AtomicUInt64(r1), .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&i, &j, AtomicUInt64(r2), .relaxed, .relaxed))
    XCTAssertEqual(r2, i.decode())

    j = AtomicUInt64(r2)
    CAtomicsStore(&i, AtomicUInt64(r1), .relaxed)
    while(!CAtomicsCompareAndExchangeWeak(&i, &j, AtomicUInt64(r3), .relaxed, .relaxed)) {}
    XCTAssertEqual(r1, j.decode())
    XCTAssertEqual(r3, i.decode())

  }

  public func testAtomicOptionalRawPointer()
  {
    let r0 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r1 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r2 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeRawPointer(bitPattern: UInt.randomPositive())

    var p = AtomicOptionalRawPointer(r3)
    XCTAssertEqual(CAtomicsLoad(&p, .relaxed), r3)
    XCTAssertEqual(CAtomicsIsLockFree(&p), true)

    CAtomicsInitialize(&p, r0)
    XCTAssertEqual(r0, CAtomicsLoad(&p, .relaxed))

    CAtomicsStore(&p, r1, .relaxed)
    XCTAssertEqual(r1, CAtomicsLoad(&p, .relaxed))

    var j = CAtomicsExchange(&p, r2, .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, CAtomicsLoad(&p, .relaxed))

    j = r2
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r3, .relaxed, .relaxed))
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))

    XCTAssertFalse(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = r3
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = CAtomicsLoad(&p, .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r1, .relaxed, .relaxed))
    while !CAtomicsCompareAndExchangeWeak(&p, &j, r3, .relaxed, .relaxed) {}
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))
  }

  public func testAtomicRawPointer()
  {
    let r0 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!
    let r1 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!
    let r2 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!
    let r3 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!

    var p = AtomicRawPointer(r3)
    XCTAssertEqual(CAtomicsLoad(&p, .relaxed), r3)
    XCTAssertEqual(CAtomicsIsLockFree(&p), true)

    CAtomicsInitialize(&p, r0)
    XCTAssertEqual(r0, CAtomicsLoad(&p, .relaxed))

    CAtomicsStore(&p, r1, .relaxed)
    XCTAssertEqual(r1, CAtomicsLoad(&p, .relaxed))

    var j = CAtomicsExchange(&p, r2, .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, CAtomicsLoad(&p, .relaxed))

    j = r2
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r3, .relaxed, .relaxed))
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))

    XCTAssertFalse(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = r3
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = CAtomicsLoad(&p, .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r1, .relaxed, .relaxed))
    while !CAtomicsCompareAndExchangeWeak(&p, &j, r3, .relaxed, .relaxed) {}
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))
  }

  public func testAtomicMutableRawPointer()
  {
    let r0 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!
    let r1 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!
    let r2 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!
    let r3 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!

    var p = AtomicMutableRawPointer(r3)
    XCTAssertEqual(CAtomicsLoad(&p, .relaxed), r3)
    XCTAssertEqual(CAtomicsIsLockFree(&p), true)

    CAtomicsInitialize(&p, r0)
    XCTAssertEqual(r0, CAtomicsLoad(&p, .relaxed))

    CAtomicsStore(&p, r1, .relaxed)
    XCTAssertEqual(r1, CAtomicsLoad(&p, .relaxed))

    var j = CAtomicsExchange(&p, r2, .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, CAtomicsLoad(&p, .relaxed))

    j = r2
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r3, .relaxed, .relaxed))
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))

    XCTAssertFalse(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = r3
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = CAtomicsLoad(&p, .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r1, .relaxed, .relaxed))
    while !CAtomicsCompareAndExchangeWeak(&p, &j, r3, .relaxed, .relaxed) {}
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))
  }

  public func testAtomicOptionalMutableRawPointer()
  {
    let r0 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r1 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r2 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())

    var p = AtomicOptionalMutableRawPointer(r3)
    XCTAssertEqual(CAtomicsLoad(&p, .relaxed), r3)
    XCTAssertEqual(CAtomicsIsLockFree(&p), true)

    CAtomicsInitialize(&p, r0)
    XCTAssertEqual(r0, CAtomicsLoad(&p, .relaxed))

    CAtomicsStore(&p, r1, .relaxed)
    XCTAssertEqual(r1, CAtomicsLoad(&p, .relaxed))

    var j = CAtomicsExchange(&p, r2, .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, CAtomicsLoad(&p, .relaxed))

    j = r2
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r3, .relaxed, .relaxed))
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))

    XCTAssertFalse(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = r3
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = CAtomicsLoad(&p, .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r1, .relaxed, .relaxed))
    while !CAtomicsCompareAndExchangeWeak(&p, &j, r3, .relaxed, .relaxed) {}
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))
  }

  public func testAtomicOpaquePointer()
  {
    let r0 = OpaquePointer(bitPattern: UInt.randomPositive())!
    let r1 = OpaquePointer(bitPattern: UInt.randomPositive())!
    let r2 = OpaquePointer(bitPattern: UInt.randomPositive())!
    let r3 = OpaquePointer(bitPattern: UInt.randomPositive())!

    var p = AtomicOpaquePointer(r3)
    XCTAssertEqual(CAtomicsLoad(&p, .relaxed), r3)
    XCTAssertEqual(CAtomicsIsLockFree(&p), true)

    CAtomicsInitialize(&p, r0)
    XCTAssertEqual(r0, CAtomicsLoad(&p, .relaxed))

    CAtomicsStore(&p, r1, .relaxed)
    XCTAssertEqual(r1, CAtomicsLoad(&p, .relaxed))

    var j = CAtomicsExchange(&p, r2, .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, CAtomicsLoad(&p, .relaxed))

    j = r2
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r3, .relaxed, .relaxed))
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))

    XCTAssertFalse(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = r3
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = CAtomicsLoad(&p, .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r1, .relaxed, .relaxed))
    while !CAtomicsCompareAndExchangeWeak(&p, &j, r3, .relaxed, .relaxed) {}
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))
  }

  public func testAtomicOptionalOpaquePointer()
  {
    let r0 = OpaquePointer(bitPattern: UInt.randomPositive())
    let r1 = OpaquePointer(bitPattern: UInt.randomPositive())
    let r2 = OpaquePointer(bitPattern: UInt.randomPositive())
    let r3 = OpaquePointer(bitPattern: UInt.randomPositive())

    var p = AtomicOptionalOpaquePointer(r3)
    XCTAssertEqual(CAtomicsLoad(&p, .relaxed), r3)
    XCTAssertEqual(CAtomicsIsLockFree(&p), true)

    CAtomicsInitialize(&p, r0)
    XCTAssertEqual(r0, CAtomicsLoad(&p, .relaxed))

    CAtomicsStore(&p, r1, .relaxed)
    XCTAssertEqual(r1, CAtomicsLoad(&p, .relaxed))

    var j = CAtomicsExchange(&p, r2, .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, CAtomicsLoad(&p, .relaxed))

    j = r2
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r3, .relaxed, .relaxed))
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))

    XCTAssertFalse(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = r3
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r2, .relaxed, .relaxed))
    j = CAtomicsLoad(&p, .relaxed)
    XCTAssertTrue(CAtomicsCompareAndExchangeStrong(&p, &j, r1, .relaxed, .relaxed))
    while !CAtomicsCompareAndExchangeWeak(&p, &j, r3, .relaxed, .relaxed) {}
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, CAtomicsLoad(&p, .relaxed))
  }

  public func testFence()
  {
    CAtomicsThreadFence(.release)
    CAtomicsThreadFence(.acquire)
  }
}
