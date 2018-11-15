import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Payload_Extension_Test.allTests),
    ]
}
#endif