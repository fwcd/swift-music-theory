import XCTest
@testable import MusicTheory

final class DiatonicScaleTests: XCTestCase {
    func testMajorScale() {
        XCTAssertEqual(MajorScale(key: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.d, 0),
            Note(.e, 0),
            Note(.f, 0),
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
        ])
        XCTAssertEqual(MajorScale(key: Note(.g, 0)).notes, [
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f.sharp, 1),
        ])
        XCTAssertEqual(MajorScale(key: Note(.g.flat, 0)).notes, [
            Note(.g.flat, 0),
            Note(.a.flat, 0),
            Note(.b.flat, 0),
            Note(.c.flat, 1),
            Note(.d.flat, 1),
            Note(.e.flat, 1),
            Note(.f, 1),
        ])
    }

    func testMinorScale() {
        XCTAssertEqual(MinorScale(key: Note(.a, 0)).notes, [
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f, 1),
            Note(.g, 1),
        ])
    }

    func testRelativeKeys() {
        assertRelativeKeys(.g, .e)
        assertRelativeKeys(.d, .b)
        assertRelativeKeys(.e, .c.sharp)
        assertRelativeKeys(.d.flat, .b.flat)
    }

    private func assertRelativeKeys(_ major: NoteClass, _ minor: NoteClass) {
        XCTAssertEqual(
            Set(MajorScale(key: Note(noteClass: major, octave: 0)).notes.map(\.noteClass)),
            Set(MinorScale(key: Note(noteClass: minor, octave: 0)).notes.map(\.noteClass)),
            "\(major) major is not the relative key to \(minor) minor"
        )
    }
}
