import XCTest
@testable import MusicTheory

final class DiatonicScaleTests: XCTestCase {
    static var allTests = [
        ("testDiatonicMajorScale", testDiatonicMajorScale),
        ("testDiatonicMinorScale", testDiatonicMinorScale),
        ("testRelativeKeys", testRelativeKeys)
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
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f, .sharp, 1)
        ])
        XCTAssertEqual(DiatonicMajorScale(key: Note(.g, .flat, 0)).notes, [
            Note(.g, .flat, 0),
            Note(.a, .flat, 0),
            Note(.b, .flat, 0),
            Note(.c, .flat, 0), // TODO: Should this be denoted using octave 1?
            Note(.d, .flat, 1),
            Note(.e, .flat, 1),
            Note(.f, 1)
        ])
    }

    func testDiatonicMinorScale() {
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

    func testRelativeKeys() {
        assertRelativeKeys(NoteClass(.g), NoteClass(.e))
        assertRelativeKeys(NoteClass(.d), NoteClass(.b))
        assertRelativeKeys(NoteClass(.e), NoteClass(.c, .sharp))
        assertRelativeKeys(NoteClass(.d, .flat), NoteClass(.b, .flat))
    }

    private func assertRelativeKeys(_ major: NoteClass, _ minor: NoteClass) {
        XCTAssertEqual(
            Set(DiatonicMajorScale(key: Note(noteClass: major, octave: 0)).notes.map(\.noteClass)),
            Set(DiatonicMinorScale(key: Note(noteClass: minor, octave: 0)).notes.map(\.noteClass)),
            "\(major) major is not the relative key to \(minor) minor"
        )
    }
}
