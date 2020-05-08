import XCTest

import CAtomicPrimitivesTests
import SwiftCompatibleAtomicsTests

var tests = [XCTestCaseEntry]()
tests += CAtomicPrimitivesTests.__allTests()
tests += SwiftCompatibleAtomicsTests.__allTests()

XCTMain(tests)
