/// A note is a named pitch or, viewed differently,
/// a note class with an octave in scientific pitch
/// notation.
public struct Note: Codable, Hashable, CustomStringConvertible {
    public var noteClass: NoteClass
    public var octave: Int

    public var letter: NoteLetter { noteClass.letter }
    public var accidental: NoteAccidental? { noteClass.accidental }

    /// A "global semitone" that identifies the note's pitch uniquely on the keyboard
    public var semitone: Int { (octave * NoteClass.twelveToneOctave.count) + noteClass.semitone }

    /// The Western notation for this note.
    public var description: String { "\(noteClass)\(octave)" }

    public init(noteClass: NoteClass, octave: Int) {
        self.noteClass = noteClass
        self.octave = octave
    }

    /// Convenience initializer for brevity.
    public init(_ noteClass: NoteClass, _ octave: Int) {
        self.init(noteClass: noteClass, octave: octave)
    }

    public init(semitone: Int, enharmonicPicker: ([NoteClass]) -> NoteClass = { $0.first! }) {
        let count = NoteClass.twelveToneOctave.count
        self.init(
            noteClass: NoteClass(semitone: semitone.floorMod(count), enharmonicPicker: enharmonicPicker),
            octave: semitone.floorDiv(count)
        )
    }

    public func advanced(by n: Int) -> Note {
        Note(semitone: semitone + n)
    }

    public static func +(note: Note, interval: DiatonicInterval) -> Note {
        let newLetter = note.letter.advanced(by: interval.degrees)
        return Note(semitone: note.semitone + interval.semitones, enharmonicPicker: { $0.first { $0.letter == newLetter } ?? $0.first! })
    }

    public static func +(note: Note, interval: ChromaticInterval) -> Note {
        note.advanced(by: interval.semitones)
    }
}
