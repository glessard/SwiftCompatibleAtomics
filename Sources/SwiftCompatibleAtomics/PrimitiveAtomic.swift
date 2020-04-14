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

public protocol PrimitiveAtomic
{
  static func atomicLoad(at pointer: UnsafeMutablePointer<Self>,
                         ordering: AtomicLoadOrdering) -> Self

  static func atomicStore(_ desired: Self,
                          at pointer: UnsafeMutablePointer<Self>,
                          ordering: AtomicStoreOrdering)

  static func atomicExchange(_ desired: Self,
                             at pointer: UnsafeMutablePointer<Self>,
                             ordering: AtomicUpdateOrdering) -> Self

  static func atomicCompareExchange(expected: Self,
                                    desired: Self,
                                    at pointer: UnsafeMutablePointer<Self>,
                                    ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)

  static func atomicCompareExchange(expected: Self,
                                    desired: Self,
                                    at pointer: UnsafeMutablePointer<Self>,
                                    successOrdering: AtomicUpdateOrdering,
                                    failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)

  static func atomicWeakCompareExchange(expected: Self,
                                        desired: __owned Self,
                                        at pointer: UnsafeMutablePointer<Self>,
                                        successOrdering: AtomicUpdateOrdering,
                                        failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
}
