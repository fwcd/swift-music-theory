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

    public init(_ noteClass: NoteClass, _ octave: Int) {
        self.noteClass = noteClass
        self.octave = octave
    }

    public init(_ letter: NoteLetter, _ accidental: NoteAccidental, _ octave: Int) {
        self.init(NoteClass(letter, accidental), octave)
    }
}
