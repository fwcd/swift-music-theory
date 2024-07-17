import XCTest
@testable import MusicTheory

final class NoteAccidentalTests: XCTestCase {
    func testArithmetic() {
        XCTAssertEqual(NoteAccidental.flat.sharp, .unaltered)
        XCTAssertEqual(NoteAccidental.flat.sharp.sharp, .sharp)
        XCTAssertEqual(NoteAccidental.sharp.sharp, .doubleSharp)

        XCTAssertEqual(NoteAccidental(semitones: -1), .flat)
        XCTAssertEqual(NoteAccidental(semitones: 1), .sharp)

        XCTAssertEqual(NoteAccidental(semitones: -1) + 1, .unaltered)
        XCTAssertEqual(NoteAccidental(semitones: -1) + .init(semitones: 1), .unaltered)
        XCTAssertEqual(NoteAccidental(semitones: -1) - .init(semitones: 1), .doubleFlat)
        XCTAssertEqual(NoteAccidental.unaltered, .zero)
    }

    func testFormatting() {
        XCTAssertEqual(NoteAccidental.flat.description, "b")
        XCTAssertEqual(NoteAccidental.sharp.description, "#")
        XCTAssertEqual(NoteAccidental.doubleSharp.description, "##")
        XCTAssertEqual(NoteAccidental.flat.flat.flat.description, "bbb")
    }

    func testParsing() {
        XCTAssertEqual(NoteAccidental("##"), .doubleSharp)
        XCTAssertEqual(NoteAccidental("b"), .flat)
        XCTAssertEqual(NoteAccidental("bb"), .doubleFlat)
    }
}
