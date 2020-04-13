import XCTest

import CAtomicsPrimitivesTests
import SwiftCompatibleAtomicsTests

var tests = [XCTestCaseEntry]()
tests += CAtomicsPrimitivesTests.__allTests()
tests += SwiftCompatibleAtomicsTests.__allTests()

XCTMain(tests)
