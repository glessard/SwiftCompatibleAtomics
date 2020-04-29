import CAtomicsPrimitives

public struct UnsafeAtomicPair<E1: AtomicPairElement, E2: AtomicPairElement>
{
  public struct Storage
  {
#if swift(>=4.2)
    @usableFromInline
    internal var value: AtomicDoubleWidth

    @inlinable
    public init(_ values: (E1, E2))
    {
      value = DoubleWidth.prepareAtomicStorage(values)
    }

    @inlinable
    public mutating func dispose() -> (E1, E2)
    {
      return DoubleWidth.disposeAtomicStorage(&value)
    }
#else
    @_versioned
    internal var value: AtomicDoubleWidth

    @inline(__always)
    public init(_ values: (E1, E2))
    {
      value = DoubleWidth.prepareAtomicStorage(values)
    }

    @inline(__always)
    public mutating func dispose() -> (E1, E2)
    {
      return DoubleWidth.disposeAtomicStorage(&value)
    }
#endif
  }

#if swift(>=4.2)
  @usableFromInline
  internal let storage: UnsafeMutablePointer<Storage>

  @inlinable
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    storage = pointer
  }

  @inlinable
  public static func create(initialValues v: (E1, E2)) -> UnsafeAtomicPair
  {
    let pointer = UnsafeMutablePointer<Storage>.allocate(capacity: 1)
    pointer.initialize(to: Storage(v))
    return UnsafeAtomicPair(at: pointer)
  }

  @inlinable @discardableResult
  public func destroy() -> (E1, E2)
  {
    let returned = storage.pointee.dispose()
    storage.deallocate()
    return returned
  }

  @usableFromInline
  internal var atomic: UnsafeMutablePointer<AtomicDoubleWidth> {
    @inlinable
    get {
      return UnsafeMutableRawPointer(storage).assumingMemoryBound(to: AtomicDoubleWidth.self)
    }
  }
#else
  @_versioned
  internal let storage: UnsafeMutablePointer<Storage>

  @inline(__always)
  public init(at pointer: UnsafeMutablePointer<Storage>)
  {
    storage = pointer
  }

  @inline(__always)
  public static func create(initialValues v: (E1, E2)) -> UnsafeAtomicPair
  {
    let pointer = UnsafeMutablePointer<Storage>.allocate(capacity: 1)
    pointer.initialize(to: Storage(v))
    return UnsafeAtomicPair(at: pointer)
  }

  @inline(__always) @discardableResult
  public func destroy() -> (E1, E2)
  {
    let returned = storage.pointee.dispose()
    storage.deallocate()
    return returned
  }

  @_versioned
  internal var atomic: UnsafeMutablePointer<AtomicDoubleWidth> {
    @inline(__always)
    get {
      return UnsafeMutableRawPointer(storage).assumingMemoryBound(to: AtomicDoubleWidth.self)
    }
  }
#endif
}

extension DoubleWidth
{
#if swift(>=4.2)
  @inlinable
  public static func prepareAtomicStorage<E1, E2>(_ values: (E1, E2)) -> AtomicDoubleWidth
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    return encodeAtomicStorage(values)
  }

  @inlinable
  public static func disposeAtomicStorage<E1, E2>(_ storage: inout AtomicDoubleWidth) -> (E1, E2)
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    return decodeAtomicStorage(storage)
  }

  @inlinable
  public static func encodeAtomicStorage<E1, E2>(_ values: (E1, E2)) -> AtomicDoubleWidth
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    assert(MemoryLayout<E1>.size <= MemoryLayout<Int>.size)
    assert(MemoryLayout<E2>.size <= MemoryLayout<Int>.size)
    return AtomicDoubleWidth(encoding: DoubleWidth(values.0.encode(), values.1.encode()))
  }

  @inlinable
  public static func decodeAtomicStorage<E1, E2>(_ storage: AtomicDoubleWidth) -> (E1, E2)
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    let dw = storage.decode()
    return (E1(decoding: dw.value1), E2(decoding: dw.value2))
  }
#else
  @inline(__always)
  public static func prepareAtomicStorage<E1, E2>(_ values: (E1, E2)) -> AtomicDoubleWidth
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    return encodeAtomicStorage(values)
  }

  @inline(__always)
  public static func disposeAtomicStorage<E1, E2>(_ storage: inout AtomicDoubleWidth) -> (E1, E2)
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    return decodeAtomicStorage(storage)
  }

  @inline(__always)
  public static func encodeAtomicStorage<E1, E2>(_ values: (E1, E2)) -> AtomicDoubleWidth
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    assert(MemoryLayout<E1>.size <= MemoryLayout<Int>.size)
    assert(MemoryLayout<E2>.size <= MemoryLayout<Int>.size)
    return AtomicDoubleWidth(encoding: DoubleWidth(values.0.encode(), values.1.encode()))
  }

  @inline(__always)
  public static func decodeAtomicStorage<E1, E2>(_ storage: AtomicDoubleWidth) -> (E1, E2)
    where E1: AtomicPairElement, E2: AtomicPairElement
  {
    let dw = storage.decode()
    return (E1(decoding: dw.value1), E2(decoding: dw.value2))
  }
#endif
}

extension UnsafeAtomicPair
{
#if swift(>=4.2)
  @inlinable
  public func load(ordering: AtomicLoadOrdering) -> (E1, E2)
  {
    let encoded = CAtomicsLoad(atomic, ordering._rawValue)
    return DoubleWidth.decodeAtomicStorage(encoded)
  }

  @inlinable
  public func store(_ desired: (E1, E2), ordering: AtomicStoreOrdering)
  {
    let encoded = DoubleWidth.encodeAtomicStorage(desired)
    CAtomicsStore(atomic, encoded, ordering._rawValue)
  }

  @inlinable
  public func exchange(_ desired: (E1, E2), ordering: AtomicUpdateOrdering) -> (E1, E2)
  {
    let encoded = CAtomicsExchange(atomic, DoubleWidth.encodeAtomicStorage(desired), ordering._rawValue)
    return DoubleWidth.decodeAtomicStorage(encoded)
  }

  @inlinable
  public func compareExchange(expected: (E1, E2), desired: (E1, E2),
                              ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: (E1, E2))
  {
    return compareExchange(expected: expected, desired: desired,
                           successOrdering: ordering,
                           failureOrdering: ordering.asLoadOrdering())
  }

  @inlinable
  public func compareExchange(expected: (E1, E2), desired: (E1, E2),
                              successOrdering: AtomicUpdateOrdering,
                              failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: (E1, E2))
  {
    var expected = DoubleWidth.encodeAtomicStorage(expected)
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(atomic, $0, DoubleWidth.encodeAtomicStorage(desired),
                                       successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, DoubleWidth.decodeAtomicStorage(expected))
  }

  @inlinable
  public func weakCompareExchange(expected: (E1, E2), desired: (E1, E2),
                                  successOrdering: AtomicUpdateOrdering,
                                  failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: (E1, E2))
  {
    var expected = DoubleWidth.encodeAtomicStorage(expected)
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(atomic, $0, DoubleWidth.encodeAtomicStorage(desired),
                                     successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, DoubleWidth.decodeAtomicStorage(expected))
  }
#else
  @inline(__always)
  public func load(ordering: AtomicLoadOrdering) -> (E1, E2)
  {
    let encoded = CAtomicsLoad(atomic, ordering._rawValue)
    return DoubleWidth.decodeAtomicStorage(encoded)
  }

  @inline(__always)
  public func store(_ desired: (E1, E2), ordering: AtomicStoreOrdering)
  {
    let encoded = DoubleWidth.encodeAtomicStorage(desired)
    CAtomicsStore(atomic, encoded, ordering._rawValue)
  }

  @inline(__always)
  public func exchange(_ desired: (E1, E2), ordering: AtomicUpdateOrdering) -> (E1, E2)
  {
    let encoded = CAtomicsExchange(atomic, DoubleWidth.encodeAtomicStorage(desired), ordering._rawValue)
    return DoubleWidth.decodeAtomicStorage(encoded)
  }

  @inline(__always)
  public func compareExchange(expected: (E1, E2), desired: (E1, E2),
                              ordering: AtomicUpdateOrdering) -> (exchanged: Bool, original: (E1, E2))
  {
    return compareExchange(expected: expected, desired: desired,
                           successOrdering: ordering,
                           failureOrdering: ordering.asLoadOrdering())
  }

  @inline(__always)
  public func compareExchange(expected: (E1, E2), desired: (E1, E2),
                              successOrdering: AtomicUpdateOrdering,
                              failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: (E1, E2))
  {
    var expected = DoubleWidth.encodeAtomicStorage(expected)
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeStrong(atomic, $0, DoubleWidth.encodeAtomicStorage(desired),
                                       successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, DoubleWidth.decodeAtomicStorage(expected))
  }

  @inline(__always)
  public func weakCompareExchange(expected: (E1, E2), desired: (E1, E2),
                                  successOrdering: AtomicUpdateOrdering,
                                  failureOrdering: AtomicLoadOrdering) -> (exchanged: Bool, original: (E1, E2))
  {
    var expected = DoubleWidth.encodeAtomicStorage(expected)
    let success = withUnsafeMutablePointer(to: &expected) {
      CAtomicsCompareAndExchangeWeak(atomic, $0, DoubleWidth.encodeAtomicStorage(desired),
                                     successOrdering._rawValue, failureOrdering._rawValue)
    }
    return (success, DoubleWidth.decodeAtomicStorage(expected))
  }
#endif
}
