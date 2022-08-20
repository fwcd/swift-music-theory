import XCTest
@testable import MusicTheory

final class NoteTests: XCTestCase {
    func testSemitone() {
        XCTAssertEqual(Note(.c, 0).semitone, 0)
        XCTAssertEqual(Note(.c, 1).semitone, 12)
        XCTAssertEqual(Note(.d, 0).semitone, 2)
        XCTAssertEqual(Note(.d.sharp, 0).semitone, 3)
        XCTAssertEqual(Note(.e.sharp, 4).semitone, Note(.f, 4).semitone)

        XCTAssertEqual(Note(semitone: 0), Note(.c, 0))
        XCTAssertEqual(Note(semitone: 1), Note(.c.sharp, 0))
        XCTAssertEqual(Note(semitone: 2), Note(.d, 0))
        XCTAssertEqual(Note(semitone: 14), Note(.d, 1))
        XCTAssertEqual(Note(semitone: 57), Note(.a, 4))
    }

    func testCanonicalization() {
        XCTAssertEqual(Note(.c, 3).canonicalized, Note(.c, 3))
        XCTAssertEqual(Note(.d, 0).canonicalized, Note(.d, 0))
        XCTAssertEqual(Note(.c.flat, -1).canonicalized, Note(.b, -2))
        XCTAssertEqual(Note(.a.sharp.sharp, -1).canonicalized, Note(.b, -2))
        // TODO: Add more test cases
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
