import XCTest
@testable import MusicTheory

private let epsilon = 0.001

final class EqualTemperamentTests: XCTestCase {
    func testSemitone() {
        let tuning = EqualTemperament()
        XCTAssertEqual(tuning.pitchHz(for: Note(.a, 4)), 440.0, accuracy: epsilon)
        XCTAssertEqual(tuning.pitchHz(for: Note(.a, 3)), 220.0, accuracy: epsilon)
        XCTAssertEqual(tuning.pitchHz(for: Note(.a, 2)), 110.0, accuracy: epsilon)
        XCTAssertEqual(tuning.pitchHz(for: Note(.g, 2)), 97.9988, accuracy: epsilon)
        XCTAssertEqual(tuning.pitchHz(for: Note(.c, 3)), 130.8127, accuracy: epsilon)

        XCTAssertEqual(tuning.semitone(for: 440.0), 57.0, accuracy: epsilon)
        XCTAssertEqual(tuning.semitone(for: 220.0), 45.0, accuracy: epsilon)

        XCTAssertEqual(tuning.closestNote(for: 440.0), Note(.a, 4))
        XCTAssertEqual(tuning.closestNote(for: 220.0), Note(.a, 3))
    }

    func testRoundtrip() {
        let tuning = EqualTemperament()
        let notes = NoteLetter.allCases.flatMap { letter in
            [NoteAccidental.flat, .unaltered, .sharp].map { accidental in
                Note(noteClass: NoteClass(letter: letter, accidental: accidental), octave: 2)
            }
        }

        for note in notes {
            XCTAssertEqual(note, tuning.closestNote(for: tuning.pitchHz(for: note)))
        }
    }
}
