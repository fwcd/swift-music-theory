import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(IntegerUtilsTests.allTests),
        testCase(NoteTests.allTests),
        testCase(NoteLetterTests.allTests),
        testCase(DiatonicScaleTests.allTests),
        testCase(BluesScaleTests.allTests)
    ]
}
#endif
