/// A note is a named pitch or, viewed differently,
/// a note class with an octave in scientific pitch
/// notation.
public struct Note: Codable, Hashable {
    public var noteClass: NoteClass
    public var octave: Int

    public var letter: NoteLetter { noteClass.letter }
    public var accidental: NoteAccidental? { noteClass.accidental }

    /// The semitone within a C major scale
    public var semitone: Int { noteClass.semitone }
    /// A "global semitone" that identifies the note's pitch uniquely on the keyboard
    public var numValue: Int { (octave * NoteClass.twelveToneOctave.count) + noteClass.semitone }

    private init(noteClass: NoteClass, octave: Int) {
        self.noteClass = noteClass
        self.octave = octave
    }

    public init(_ letter: NoteLetter, _ accidental: NoteAccidental?, _ octave: Int) {
        self.init(noteClass: NoteClass(letter, accidental), octave: octave)
    }

    public init(_ letter: NoteLetter, _ octave: Int) {
        // Workaround since optional unlabeled arguments in the middle
        // confuse Swift's overload resolution.
        self.init(letter, nil, octave)
    }

    public init(numValue: Int) {
        let count = NoteClass.twelveToneOctave.count
        self.init(
            noteClass: NoteClass(semitone: numValue.floorMod(count)),
            octave: numValue.floorDiv(count)
        )
    }
}
