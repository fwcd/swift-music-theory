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
}
