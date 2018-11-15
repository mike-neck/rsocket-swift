import XCTest

import RSocketTests

var tests = [XCTestCaseEntry]()
tests += Payload_Extension_Test.allTests()
XCTMain(tests)
