//
//  AtomicPointerTests.swift
//
//  Copyright © 2020 Guillaume Lessard. All rights reserved.
//  Licensed under Apache License v2.0
//

import XCTest

import SwiftCompatibleAtomics

public class AtomicPointerTests: XCTestCase
{
  public func testUnsafePointer()
  {
    let r1 = UnsafePointer<Int64>(bitPattern: UInt.randomPositive())!
    let r2 = UnsafePointer<Int64>(bitPattern: UInt.randomPositive())!
    let r3 = UnsafePointer<Int64>(bitPattern: UInt.randomPositive())!

    let i = UnsafePointerToAtomic<UnsafePointer<Int64>>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testOptionalUnsafePointer()
  {
    let r1 = UnsafePointer<Int64>(bitPattern: 0)
    let r2 = UnsafePointer<Int64>(bitPattern: UInt.randomPositive())
    let r3 = UnsafePointer<Int64>(bitPattern: UInt.randomPositive())

    let i = UnsafePointerToAtomic<UnsafePointer<Int64>?>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUnsafeRawPointer()
  {
    let r1 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!
    let r2 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!
    let r3 = UnsafeRawPointer(bitPattern: UInt.randomPositive())!

    let i = UnsafePointerToAtomic<UnsafeRawPointer>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testOptionalUnsafeRawPointer()
  {
    let r1 = UnsafeRawPointer(bitPattern: 0)
    let r2 = UnsafeRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeRawPointer(bitPattern: UInt.randomPositive())

    let i = UnsafePointerToAtomic<UnsafeRawPointer?>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUnsafeMutablePointer()
  {
    let r1 = UnsafeMutablePointer<Int64>(bitPattern: UInt.randomPositive())!
    let r2 = UnsafeMutablePointer<Int64>(bitPattern: UInt.randomPositive())!
    let r3 = UnsafeMutablePointer<Int64>(bitPattern: UInt.randomPositive())!

    let i = UnsafePointerToAtomic<UnsafeMutablePointer<Int64>>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testOptionalUnsafeMutablePointer()
  {
    let r1 = UnsafeMutablePointer<Int64>(bitPattern: 0)
    let r2 = UnsafeMutablePointer<Int64>(bitPattern: UInt.randomPositive())
    let r3 = UnsafeMutablePointer<Int64>(bitPattern: UInt.randomPositive())

    let i = UnsafePointerToAtomic<UnsafeMutablePointer<Int64>?>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testUnsafeMutableRawPointer()
  {
    let r1 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!
    let r2 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!
    let r3 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())!

    let i = UnsafePointerToAtomic<UnsafeMutableRawPointer>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  public func testOptionalUnsafeMutableRawPointer()
  {
    let r1 = UnsafeMutableRawPointer(bitPattern: 0)
    let r2 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())
    let r3 = UnsafeMutableRawPointer(bitPattern: UInt.randomPositive())

    let i = UnsafePointerToAtomic<UnsafeMutableRawPointer?>.create(initialValue: r1)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2, i.load(ordering: .relaxed))

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.store(r1, ordering: .releasing)
    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1, r)
    XCTAssertEqual(r3, i.load(ordering: .relaxed))

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .acquiringAndReleasing, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r3, j)
    XCTAssertEqual(r1, i.load(ordering: .relaxed))

    i.destroy()
  }

  class TestObject {}

  public func testUnmanaged()
  {
    let r1 = Unmanaged<TestObject>.passRetained(TestObject())
    let r2 = Unmanaged<TestObject>.passRetained(TestObject())
    let r3 = Unmanaged<TestObject>.passRetained(TestObject())

    let i = UnsafePointerToAtomic<Unmanaged<TestObject>>.create(initialValue: r1)
    XCTAssertEqual(r1.toOpaque(), i.load(ordering: .relaxed).toOpaque())

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2.toOpaque(), i.load(ordering: .relaxed).toOpaque())

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2.toOpaque(), j.toOpaque())
    XCTAssertEqual(r1.toOpaque(), i.load(ordering: .relaxed).toOpaque())

    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1.toOpaque(), r.toOpaque())
    XCTAssertEqual(r3.toOpaque(), i.load(ordering: .relaxed).toOpaque())

    (s, j) = i.compareExchange(expected: j, desired: r1, ordering: .sequentiallyConsistent, failureOrdering: .relaxed)
    XCTAssertEqual(s, false)
    XCTAssertEqual(r3.toOpaque(), j.toOpaque())

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .sequentiallyConsistent, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r1.toOpaque(), i.load(ordering: .relaxed).toOpaque())

    i.destroy()
    r1.release()
    r2.release()
    r3.release()
  }

  public func testOptionalUnmanaged()
  {
    let r1 = Optional<Unmanaged<TestObject>>.none
    let r2 = Optional(Unmanaged<TestObject>.passRetained(TestObject()))
    let r3 = Optional(Unmanaged<TestObject>.passRetained(TestObject()))

    let i = UnsafePointerToAtomic<Unmanaged<TestObject>?>.create(initialValue: r1)
    XCTAssertEqual(r1?.toOpaque(), i.load(ordering: .relaxed)?.toOpaque())

    i.store(r2, ordering: .relaxed)
    XCTAssertEqual(r2?.toOpaque(), i.load(ordering: .relaxed)?.toOpaque())

    var j = i.exchange(r1, ordering: .acquiringAndReleasing)
    XCTAssertEqual(r2?.toOpaque(), j?.toOpaque())
    XCTAssertEqual(r1?.toOpaque(), i.load(ordering: .relaxed)?.toOpaque())

    var (s, r) = i.compareExchange(expected: r1, desired: r3, ordering: .acquiring)
    XCTAssertEqual(true, s)
    XCTAssertEqual(r1?.toOpaque(), r?.toOpaque())
    XCTAssertEqual(r3?.toOpaque(), i.load(ordering: .relaxed)?.toOpaque())

    (s, j) = i.compareExchange(expected: j, desired: r1, ordering: .sequentiallyConsistent, failureOrdering: .relaxed)
    XCTAssertEqual(s, false)
    XCTAssertEqual(r3?.toOpaque(), j?.toOpaque())

    repeat {
      (s, j) = i.weakCompareExchange(expected: j, desired: r1, ordering: .sequentiallyConsistent, failureOrdering: .relaxed)
    } while s == false
    XCTAssertEqual(r1?.toOpaque(), i.load(ordering: .relaxed)?.toOpaque())

    i.destroy()
    r1?.release()
    r2?.release()
    r3?.release()
  }
}
