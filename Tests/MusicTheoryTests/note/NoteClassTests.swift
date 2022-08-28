import XCTest
@testable import MusicTheory

final class NoteClassTests: XCTestCase {
    func testSemitone() throws {
        let semitones: [(UInt, NoteClass, Int)] = [
            (#line, .c.flat, -1),
            (#line, .c, 0),
            (#line, .c.sharp, 1),
            (#line, .d.flat, 1),
            (#line, .d, 2),
            (#line, .d.sharp, 3),
            (#line, .d.sharp.sharp, 4),
            (#line, .e, 4),
            (#line, .f, 5),
            (#line, .f.sharp, 6),
            (#line, .g.flat, 6),
            (#line, .g, 7),
            (#line, .g.sharp, 8),
            (#line, .a.flat, 8),
            (#line, .a, 9),
            (#line, .a.sharp, 10),
            (#line, .b.flat, 10),
            (#line, .b, 11),
            (#line, .b.sharp, 12), // Note that we choose not to wrap around to 0
        ]

        for (line, noteClass, semitone) in semitones {
            XCTAssertEqual(noteClass.semitone, semitone, line: line)
        }
    }

    func testDiatonicIntervals() {
        XCTAssertEqual(.c + .octave, .c)
        XCTAssertEqual(.c + .minorSecond, .d.flat)
        XCTAssertEqual(.c + .majorSecond, .d)
        XCTAssertEqual(.c - .majorSecond, .b.flat)
        XCTAssertEqual(.c - .minorSecond, .b)

        XCTAssertEqual(.c + .majorSecond, .d)
		XCTAssertEqual(.c - .minorSecond, .b)
		XCTAssertEqual(.c - .majorSecond, .b.flat)
		XCTAssertEqual(.c + .octaves(2), .c)
		XCTAssertEqual(.c + .octaves(-1), .c)
		XCTAssertEqual(.c - .octaves(3), .c)
		XCTAssertEqual(.f.sharp - .majorSeventh, .g)
		XCTAssertEqual(.d + .minorThird, .f)
		XCTAssertEqual(.d + .majorThird, .f.sharp)
		XCTAssertEqual(.a.sharp + .unison, .a.sharp)
		XCTAssertEqual(.g.flat + .octave, .g.flat)

        var aSharp = NoteClass.a.sharp
        aSharp -= .majorThird
        XCTAssertEqual(aSharp, .f.sharp)
        aSharp += .majorThird
        XCTAssertEqual(aSharp, .a.sharp)
    }
}
