import XCTest
@testable import MusicTheory

final class NoteTests: XCTestCase {
    func testSemitone() {
        XCTAssertEqual(Note(.c, 0).semitone, 0)
        XCTAssertEqual(Note(.c, 1).semitone, 12)
        XCTAssertEqual(Note(.d, 0).semitone, 2)
        XCTAssertEqual(Note(.d.sharp, 0).semitone, 3)
        XCTAssertEqual(Note(.e.sharp, 4).semitone, Note(.f, 4).semitone)
    }

    func testDiatonicIntervals() {
        XCTAssertEqual(Note(.c, 0) + .octave, Note(.c, 1))
        XCTAssertEqual(Note(.c, 1) + .minorSecond, Note(.d.flat, 1))
        XCTAssertEqual(Note(.c, 1) + .majorSecond, Note(.d, 1))
    }

    func testChromaticIntervals() {
        XCTAssertEqual(Note(.c, 0) + .semitone, Note(.c.sharp, 0))
        XCTAssertEqual(Note(.c, 0) + .semitones(2), Note(.d, 0))
    }
}
