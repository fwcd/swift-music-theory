import XCTest
@testable import MusicTheory

final class NoteTests: XCTestCase {
    static var allTests = [
        ("testNote", testNote),
        ("testDiatonicIntervals", testDiatonicIntervals),
        ("testChromaticIntervals", testChromaticIntervals)
    ]
    
    func testNote() {
        XCTAssertEqual(Note(.c, 0).numValue, 0)
        XCTAssertEqual(Note(.c, 1).numValue, 12)
        XCTAssertEqual(Note(.d, 0).numValue, 2)
        XCTAssertEqual(Note(.d, .sharp, 0).numValue, 3)
        XCTAssertEqual(Note(.e, .sharp, 4).numValue, Note(.f, 4).numValue)
    }

    func testDiatonicIntervals() {
        XCTAssertEqual(Note(.c, 0) + .octave, Note(.c, 1))
        XCTAssertEqual(Note(.c, 1) + .minorSecond, Note(.d, .flat, 1))
        XCTAssertEqual(Note(.c, 1) + .majorSecond, Note(.d, 1))
    }

    func testChromaticIntervals() {
        XCTAssertEqual(Note(.c, 0) + .semitone, Note(.c, .sharp, 0))
        XCTAssertEqual(Note(.c, 0) + .semitones(2), Note(.d, 0))
    }
}
