#if !(os(macOS) || os(iOS) || os(tvOS) || os(watchOS))
import XCTest

extension AtomicIntegerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AtomicIntegerTests = [
        ("testInt", testInt),
        ("testInt16", testInt16),
        ("testInt32", testInt32),
        ("testInt64", testInt64),
        ("testInt8", testInt8),
        ("testLoadAfterAtomic", testLoadAfterAtomic),
        ("testUInt", testUInt),
        ("testUInt16", testUInt16),
        ("testUInt32", testUInt32),
        ("testUInt64", testUInt64),
        ("testUInt8", testUInt8),
    ]
}

extension AtomicLazyReferenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AtomicLazyReferenceTests = [
        ("testAtomicLazyReference", testAtomicLazyReference),
    ]
}

extension AtomicPointerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AtomicPointerTests = [
        ("testOptionalUnmanaged", testOptionalUnmanaged),
        ("testOptionalUnsafeMutablePointer", testOptionalUnsafeMutablePointer),
        ("testOptionalUnsafeMutableRawPointer", testOptionalUnsafeMutableRawPointer),
        ("testOptionalUnsafePointer", testOptionalUnsafePointer),
        ("testOptionalUnsafeRawPointer", testOptionalUnsafeRawPointer),
        ("testUnmanaged", testUnmanaged),
        ("testUnsafeMutablePointer", testUnsafeMutablePointer),
        ("testUnsafeMutableRawPointer", testUnsafeMutableRawPointer),
        ("testUnsafePointer", testUnsafePointer),
        ("testUnsafeRawPointer", testUnsafeRawPointer),
    ]
}

extension AtomicRepresentableTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AtomicRepresentableTests = [
        ("testAtomicRepresentableEnum", testAtomicRepresentableEnum),
    ]
}

extension MemoryOrderingsTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__MemoryOrderingsTests = [
        ("testCASOrderings", testCASOrderings),
        ("testLoadOrderingDescriptions", testLoadOrderingDescriptions),
        ("testMemoryFence", testMemoryFence),
        ("testStoreOrderingDescriptions", testStoreOrderingDescriptions),
        ("testUpdateOrderingDescriptions", testUpdateOrderingDescriptions),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AtomicIntegerTests.__allTests__AtomicIntegerTests),
        testCase(AtomicLazyReferenceTests.__allTests__AtomicLazyReferenceTests),
        testCase(AtomicPointerTests.__allTests__AtomicPointerTests),
        testCase(AtomicRepresentableTests.__allTests__AtomicRepresentableTests),
        testCase(MemoryOrderingsTests.__allTests__MemoryOrderingsTests),
    ]
}
#endif
