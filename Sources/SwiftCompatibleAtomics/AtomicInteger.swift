//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

public protocol AtomicInteger: AtomicProtocol, FixedWidthInteger
{
  static func atomicLoadThenWrappingIncrement(by operand: Self,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Self

  static func atomicLoadThenWrappingDecrement(by operand: Self,
                                              at pointer: UnsafeMutablePointer<AtomicStorage>,
                                              ordering: AtomicUpdateOrdering) -> Self

  static func atomicLoadThenBitwiseAnd(with operand: Self,
                                       at pointer: UnsafeMutablePointer<AtomicStorage>,
                                       ordering: AtomicUpdateOrdering) -> Self

  static func atomicLoadThenBitwiseOr(with operand: Self,
                                      at pointer: UnsafeMutablePointer<AtomicStorage>,
                                      ordering: AtomicUpdateOrdering) -> Self

  static func atomicLoadThenBitwiseXor(with operand: Self,
                                       at pointer: UnsafeMutablePointer<AtomicStorage>,
                                       ordering: AtomicUpdateOrdering) -> Self
}
