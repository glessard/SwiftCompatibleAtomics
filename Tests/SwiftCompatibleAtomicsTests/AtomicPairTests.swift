//
//  AtomicPointerTests.swift
//
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics


private class TestObject {}

private enum AtomickableEnum: UInt8, Equatable, AtomicPairElement
{
  case a = 0, b, c, d, e
}

private struct AtomickableStruct: RawRepresentable, Equatable, AtomicPairElement
{
  var rawValue: Int32
  init(rawValue: Int32) { self.rawValue = rawValue }
}

public class AtomicPairTests: XCTestCase
{
  public func testUnsafePair8bitIntegers()
  {
    let r1 = (Int8(), UInt8.randomPositive())
    let r2 = (Int8.randomPositive(), UInt8.max)

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

  public func testUnsafePair16bitIntegers()
  {
    let r1 = (Int16(), UInt16.randomPositive())
    let r2 = (Int16.randomPositive(), UInt16.max)

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

  public func testUnsafePair32bitIntegers()
  {
    let r1 = (Int32(), UInt32.randomPositive())
    let r2 = (Int32.randomPositive(), UInt32.max)

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

  public func testUnsafePairPointerWidthIntegers()
  {
    let r1 = (Int(), UInt.randomPositive())
    let r2 = (Int.randomPositive(), UInt.max)

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

  public func testUnsafePairTypedPointers()
  {
    let r1 = (UnsafeMutablePointer<Int>(bitPattern: UInt.randomPositive())!, UnsafePointer<Double>(bitPattern: 0))
    let r2 = (UnsafeMutablePointer<Int>(bitPattern: UInt.max)!, UnsafePointer<Double>(bitPattern: UInt.randomPositive()))

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

  public func testUnsafePairRawPointers()
  {
    let r1 = (UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!, UnsafeRawPointer(bitPattern: 0))
    let r2 = (UnsafeMutableRawPointer(bitPattern: UInt.max)!, UnsafeRawPointer(bitPattern: UInt.randomPositive()))

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

  public func testUnsafePairUnmanagedAndBool()
  {
    let r1 = (Optional<Unmanaged<TestObject>>.none, false)
    let r2 = (Optional(Unmanaged<TestObject>.passRetained(TestObject())), true)

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
    r2.0?.release()
  }

  public func testUnsafePairRawRepresentableTypes()
  {
    let r1 = (AtomickableEnum(rawValue: 0)!, AtomickableStruct(rawValue: .randomPositive()))
    let r2 = (AtomickableEnum(rawValue: 4)!, AtomickableStruct(rawValue: .min))

    let i = UnsafeAtomicPair.create(initialValues: r1)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    var r3 = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssert(r2 == r3)
    XCTAssert(r1 == i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var s = false
    (s, r3) = i.compareExchange(expected: r1, desired: r2, ordering: .acquiringAndReleasing)
    XCTAssertEqual(true, s)
    XCTAssert(r1 == r3)
    XCTAssert(r2 == i.load(ordering: .relaxed))

    repeat {
      (s, r3) = i.weakCompareExchange(expected: r3, desired: r2,
                                     successOrdering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssert(r2 == r3)
    XCTAssert(r2 == i.destroy())
  }

}

extension Unmanaged: Equatable
{
  public static func ==(lhs: Unmanaged, rhs: Unmanaged) -> Bool
  {
    return lhs.toOpaque() == rhs.toOpaque()
  }
}
