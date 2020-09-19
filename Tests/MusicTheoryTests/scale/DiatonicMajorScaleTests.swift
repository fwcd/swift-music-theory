import XCTest
@testable import MusicTheory

final class DiatonicMajorScaleTests: XCTestCase {
    static var allTests = [
        ("testDiatonicMajorScale", testDiatonicMajorScale)
    ]
    
    func testDiatonicMajorScale() throws {
        XCTAssertEqual(DiatonicMajorScale(key: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.d, 0),
            Note(.e, 0),
            Note(.f, 0),
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0)
        ])
        XCTAssertEqual(DiatonicMajorScale(key: Note(.g, 0)).notes, [
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 0),
            Note(.d, 0),
            Note(.e, 0),
            Note(.f, .sharp, 0),
            Note(.g, 0)
        ])
        XCTAssertEqual(DiatonicMajorScale(key: Note(.g, .flat, 0)).notes, [
            Note(.g, .flat, 0),
            Note(.a, .flat, 0),
            Note(.b, .flat, 0),
            Note(.c, .flat, 0),
            Note(.d, .flat, 0),
            Note(.e, .flat, 0),
            Note(.f, .flat, 0),
            Note(.g, .flat, 0)
        ])
    }
}
