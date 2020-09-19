import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(IntegerUtilsTests.allTests),
        testCase(NoteTests.allTests),
        testCase(NoteLetterTests.allTests),
        testCase(DiatonicMajorScaleTests.allTests),
        // testCase(DiatonicMinorScaleTests.allTests),
        testCase(BluesScaleTests.allTests)
    ]
}
#endif
