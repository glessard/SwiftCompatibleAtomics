#if !canImport(ObjectiveC)
import XCTest

extension AtomicsTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AtomicsTests = [
        ("testAtomicFunctionShapes", testAtomicFunctionShapes),
        ("testAtomicTypeShape", testAtomicTypeShape),
    ]
}

extension CAtomicsBasicTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__CAtomicsBasicTests = [
        ("testAtomicDoubleWidth", testAtomicDoubleWidth),
        ("testAtomicMutableRawPointer", testAtomicMutableRawPointer),
        ("testAtomicRawPointer", testAtomicRawPointer),
        ("testDoubleWidth", testDoubleWidth),
        ("testFence", testFence),
        ("testInt", testInt),
        ("testInt16", testInt16),
        ("testInt32", testInt32),
        ("testInt64", testInt64),
        ("testInt8", testInt8),
        ("testUInt", testUInt),
        ("testUInt16", testUInt16),
        ("testUInt32", testUInt32),
        ("testUInt64", testUInt64),
        ("testUInt8", testUInt8),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AtomicsTests.__allTests__AtomicsTests),
        testCase(CAtomicsBasicTests.__allTests__CAtomicsBasicTests),
    ]
}
#endif
