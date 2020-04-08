//
//  AtomicIntegerTests.swift
//
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics

public class AtomicIntegerTests: XCTestCase
{
  public func testInt()
  {
    let i = UnsafePointerToAtomic<Int>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = Int.randomPositive()
    let r2 = Int.randomPositive()
    let r3 = Int.randomPositive()
#else
    let r1 = Int(UInt.randomPositive())
    let r2 = Int(UInt.randomPositive())
    let r3 = Int(UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUInt()
  {
    let i = UnsafePointerToAtomic<UInt>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = UInt.randomPositive()
    let r2 = UInt.randomPositive()
    let r3 = UInt.randomPositive()
#else
    let r1 = UInt(UInt.randomPositive())
    let r2 = UInt(UInt.randomPositive())
    let r3 = UInt(UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testInt8()
  {
    let i = UnsafePointerToAtomic<Int8>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = Int8.randomPositive()
    let r2 = Int8.randomPositive()
    let r3 = Int8.randomPositive()
#else
    let r1 = Int8(truncatingBitPattern: UInt.randomPositive())
    let r2 = Int8(truncatingBitPattern: UInt.randomPositive())
    let r3 = Int8(truncatingBitPattern: UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUInt8()
  {
    let i = UnsafePointerToAtomic<UInt8>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = UInt8.randomPositive()
    let r2 = UInt8.randomPositive()
    let r3 = UInt8.randomPositive()
#else
    let r1 = UInt8(truncatingBitPattern: UInt.randomPositive())
    let r2 = UInt8(truncatingBitPattern: UInt.randomPositive())
    let r3 = UInt8(truncatingBitPattern: UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testInt16()
  {
    let i = UnsafePointerToAtomic<Int16>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = Int16.randomPositive()
    let r2 = Int16.randomPositive()
    let r3 = Int16.randomPositive()
#else
    let r1 = Int16(truncatingBitPattern: UInt.randomPositive())
    let r2 = Int16(truncatingBitPattern: UInt.randomPositive())
    let r3 = Int16(truncatingBitPattern: UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUInt16()
  {
    let i = UnsafePointerToAtomic<UInt16>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = UInt16.randomPositive()
    let r2 = UInt16.randomPositive()
    let r3 = UInt16.randomPositive()
#else
    let r1 = UInt16(truncatingBitPattern: UInt.randomPositive())
    let r2 = UInt16(truncatingBitPattern: UInt.randomPositive())
    let r3 = UInt16(truncatingBitPattern: UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testInt32()
  {
    let i = UnsafePointerToAtomic<Int32>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = Int32.randomPositive()
    let r2 = Int32.randomPositive()
    let r3 = Int32.randomPositive()
#else
    let r1 = Int32(truncatingBitPattern: UInt.randomPositive())
    let r2 = Int32(truncatingBitPattern: UInt.randomPositive())
    let r3 = Int32(truncatingBitPattern: UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUInt32()
  {
    let i = UnsafePointerToAtomic<UInt32>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = UInt32.randomPositive()
    let r2 = UInt32.randomPositive()
    let r3 = UInt32.randomPositive()
#else
    let r1 = UInt32(truncatingBitPattern: UInt.randomPositive())
    let r2 = UInt32(truncatingBitPattern: UInt.randomPositive())
    let r3 = UInt32(truncatingBitPattern: UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testInt64()
  {
    let i = UnsafePointerToAtomic<Int64>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = Int64.randomPositive()
    let r2 = Int64.randomPositive()
    let r3 = Int64.randomPositive()
#else
    let r1 = Int64(UInt.randomPositive())
    let r2 = Int64(UInt.randomPositive())
    let r3 = Int64(UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUInt64()
  {
    let i = UnsafePointerToAtomic<UInt64>.create(initialValue: 0)
    XCTAssertEqual(i.load(ordering: .relaxed), 0)

#if swift(>=4.0)
    let r1 = UInt64.randomPositive()
    let r2 = UInt64.randomPositive()
    let r3 = UInt64.randomPositive()
#else
    let r1 = UInt64(UInt.randomPositive())
    let r2 = UInt64(UInt.randomPositive())
    let r3 = UInt64(UInt.randomPositive())
#endif

    i.store(r1, ordering: .relaxed)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    var j = i.exchange(r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    j = i.loadThenWrappingIncrement(by: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 &+ r2, i.load(ordering: .acquiring))

    j = i.loadThenWrappingDecrement(by: r2, ordering: .relaxed)
    XCTAssertEqual(r1 &+ r2, j)
    XCTAssertEqual(r1, i.load(ordering: .sequentiallyConsistent))

    j = i.loadThenWrappingIncrement(ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 &+ 1, i.load(ordering: .relaxed))

    i.store(r3, ordering: .releasing)
    j = i.loadThenWrappingDecrement(ordering: .relaxed)
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r3 &- 1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseOr(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 | r2, i.load(ordering: .relaxed))

    i.store(r2, ordering: .sequentiallyConsistent)
    j = i.loadThenBitwiseXor(with: r1, ordering: .relaxed)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1 ^ r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    j = i.loadThenBitwiseAnd(with: r2, ordering: .relaxed)
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r1 & r2, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r2, ordering: .sequentiallyConsistent)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)

    j = r2
    i.store(r1, ordering: .releasing)
    s = false
    while s == false
    {
      (s, j) = i.weakCompareExchange(expected: j, desired: r3, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    }
    XCTAssertEqual(r1, j)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    i.destroy()
  }

  func testLoadAfterAtomic()
  {
    let i = UnsafePointerToAtomic<UInt>.create(initialValue: 0)
    var o, j, k: UInt

    o = UInt.randomPositive()
    j = i.load(ordering: .relaxed) &+ o
    k = i.wrappingIncrementThenLoad(by: o, ordering: .relaxed)
    XCTAssertEqual(j, k)

    o = UInt.randomPositive()
    j = i.load(ordering: .relaxed) &- o
    k = i.wrappingDecrementThenLoad(by: o, ordering: .relaxed)
    XCTAssertEqual(j, k)

    o = UInt.randomPositive()
    i.wrappingIncrement(by: o, ordering: .acquiring)
    k = k &+ o
    XCTAssertEqual(k, i.load(ordering: .relaxed))

    o = UInt.randomPositive()
    i.wrappingDecrement(by: o, ordering: .acquiring)
    k = k &- o
    XCTAssertEqual(k, i.load(ordering: .relaxed))

    o = UInt.randomPositive()
    j = i.load(ordering: .relaxed) | o
    k = i.bitwiseOrThenLoad(with: o, ordering: .relaxed)
    XCTAssertEqual(j, k)

    o = UInt.randomPositive()
    j = i.load(ordering: .relaxed) & o
    k = i.bitwiseAndThenLoad(with: o, ordering: .relaxed)
    XCTAssertEqual(j, k)

    o = UInt.randomPositive()
    j = i.load(ordering: .relaxed) ^ o
    k = i.bitwiseXorThenLoad(with: o, ordering: .relaxed)
    XCTAssertEqual(j, k)

    i.destroy()
  }

  func testSeparateAllocation()
  {
    let value = UInt.randomPositive()

    let p = UnsafeMutablePointer<UInt.AtomicStorage>.allocate(capacity: 1)
    p.initialize(to: value)

    let i = UnsafePointerToAtomic<UInt>(at: p).load(ordering: .relaxed)
    XCTAssertEqual(value, i)

    UnsafePointerToAtomic<UInt>(at: p).destroy()
  }
}
