/// A note is a named pitch or, viewed differently,
/// a note class with an octave in scientific pitch
/// notation.
public struct Note: Codable, Hashable, CustomStringConvertible {
    public var noteClass: NoteClass
    public var octave: Int

    public var letter: NoteLetter { noteClass.letter }
    public var accidental: NoteAccidental? { noteClass.accidental }

    /// The semitone within a C major scale
    public var semitone: Int { noteClass.semitone }
    /// A "global semitone" that identifies the note's pitch uniquely on the keyboard
    public var numValue: Int { (octave * NoteClass.twelveToneOctave.count) + noteClass.semitone }

    public var description: String { "\(noteClass)\(octave)" }

    public init(noteClass: NoteClass, octave: Int) {
        self.noteClass = noteClass
        self.octave = octave
    }

    /// Convenience initializer for brevity.
    public init(_ noteClass: NoteClass, _ octave: Int) {
        self.init(noteClass: noteClass, octave: octave)
    }

    public init(numValue: Int, enharmonicPicker: ([NoteClass]) -> NoteClass = { $0.first! }) {
        let count = NoteClass.twelveToneOctave.count
        self.init(
            noteClass: NoteClass(semitone: numValue.floorMod(count), enharmonicPicker: enharmonicPicker),
            octave: numValue.floorDiv(count)
        )
    }

    public func advanced(by n: Int) -> Note {
        Note(numValue: numValue + n)
    }

    public static func +(note: Note, interval: DiatonicInterval) -> Note {
        let newLetter = note.letter.advanced(by: interval.degrees)
        return Note(numValue: note.numValue + interval.semitones, enharmonicPicker: { $0.first { $0.letter == newLetter } ?? $0.first! })
    }

    public static func +(note: Note, interval: ChromaticInterval) -> Note {
        note.advanced(by: interval.semitones)
    }
}
