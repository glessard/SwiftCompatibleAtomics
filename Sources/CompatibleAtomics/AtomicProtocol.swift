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

public protocol AtomicProtocol
{
  associatedtype AtomicStorage

  static func atomicStorage(for value: Self) -> AtomicStorage

  static func deinitializeAtomicStorage(at address: UnsafeMutablePointer<AtomicStorage>)

  static func atomicLoad(at address: UnsafeMutablePointer<AtomicStorage>,
                         ordering: AtomicLoadOrdering) -> Self

  static func atomicStore(_ desired: Self,
                          at address: UnsafeMutablePointer<AtomicStorage>,
                          ordering: AtomicStoreOrdering)

  static func atomicExchange(_ desired: Self,
                             at address: UnsafeMutablePointer<AtomicStorage>,
                             ordering: AtomicUpdateOrdering) -> Self

  static func atomicCompareExchange(expected: Self,
                                    desired: Self,
                                    at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: Self)

  static func atomicCompareExchange(expected: Self,
                                    desired: Self,
                                    at address: UnsafeMutablePointer<AtomicStorage>,
                                    ordering: AtomicUpdateOrdering,
                                    failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: Self)
}
