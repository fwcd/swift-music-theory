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
        XCTAssertEqual(Note(semitone: 1), Note(.d.flat, 0))
        XCTAssertEqual(Note(semitone: 2), Note(.d, 0))
        XCTAssertEqual(Note(semitone: 14), Note(.d, 1))
        XCTAssertEqual(Note(semitone: 57), Note(.a, 4))
    }

    func testMidiNumber() {
        XCTAssertEqual(Note(.f, 9).midiNumber, 125)
        XCTAssertEqual(Note(.d.sharp, 9).midiNumber, 123)
        XCTAssertEqual(Note(.e.flat, 9).midiNumber, 123)
        XCTAssertEqual(Note(.a, 8).midiNumber, 117)

        XCTAssertEqual(Note(midiNumber: 115), Note(.g, 8))
        XCTAssertEqual(Note(midiNumber: 113), Note(.f, 8))
    }

    func testCanonicalization() {
        XCTAssertEqual(Note(.c, 3).canonicalized, Note(.c, 3))
        XCTAssertEqual(Note(.d, 0).canonicalized, Note(.d, 0))
        XCTAssertEqual(Note(.c.flat, -1).canonicalized, Note(.b, -2))
        XCTAssertEqual(Note(.a.sharp.sharp, -2).canonicalized, Note(.b, -2))
        // TODO: Add more test cases
    }

    func testDiatonicIntervals() {
        XCTAssertEqual(Note(.c, 0) + .octave, Note(.c, 1))
        XCTAssertEqual(Note(.c, 1) + .minorSecond, Note(.d.flat, 1))
        XCTAssertEqual(Note(.c, 1) + .majorSecond, Note(.d, 1))
        XCTAssertEqual(Note(.c, 1) - .majorSecond, Note(.b.flat, 0))
        XCTAssertEqual(Note(.c, 1) - .minorSecond, Note(.b, 0))

        XCTAssertEqual(Note(.c, 4) + .majorSecond, Note(.d, 4))
		XCTAssertEqual(Note(.c, 4) - .minorSecond, Note(.b, 3))
		XCTAssertEqual(Note(.c, 4) - .majorSecond, Note(.b.flat, 3))
		XCTAssertEqual(Note(.c, 4) + .octaves(2), Note(.c, 6))
		XCTAssertEqual(Note(.c, 4) + .octaves(-1), Note(.c, 3))
		XCTAssertEqual(Note(.c, 4) - .octaves(3), Note(.c, 1))
		XCTAssertEqual(Note(.f.sharp, 7) - .majorSeventh, Note(.g, 6))
		XCTAssertEqual(Note(.d, 3) + .minorThird, Note(.f, 3))
		XCTAssertEqual(Note(.d, 3) + .majorThird, Note(.f.sharp, 3))
		XCTAssertEqual(Note(.a.sharp, 2) + .unison, Note(.a.sharp, 2))
		XCTAssertEqual(Note(.g.flat, 1) + .octave, Note(.g.flat, 2))
    }

    func testChromaticIntervals() {
        XCTAssertEqual(Note(.c, 0) + .semitone, Note(.d.flat, 0))
        XCTAssertEqual(Note(.c, 0) + .semitones(2), Note(.d, 0))
    }
}
