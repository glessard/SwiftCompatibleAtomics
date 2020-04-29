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
