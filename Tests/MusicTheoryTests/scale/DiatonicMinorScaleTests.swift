import XCTest
@testable import MusicTheory

final class DiatonicMinorScaleTests: XCTestCase {
    static var allTests = [
        ("testDiatonicMinorScale", testDiatonicMinorScale)
    ]
    
    func testDiatonicMinorScale() throws {
        XCTAssertEqual(DiatonicMinorScale(key: Note(.a, 0)).notes, [
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f, 1),
            Note(.g, 1)
        ])
    }
}
