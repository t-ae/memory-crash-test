import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(memory_crash_testTests.allTests),
    ]
}
#endif
