private let midiSemitoneOffset: Int = 12

/// A note is a named pitch or, viewed differently,
/// a note class with an octave in scientific pitch
/// notation.
public struct Note: Codable, Hashable, CustomStringConvertible {
    public var noteClass: NoteClass
    public var octave: Int

    /// The note's letter, taken from the note class.
    public var letter: NoteLetter {
        get { noteClass.letter }
        set { noteClass.letter = newValue }
    }
    /// The note's accidental, taken from the note class.
    public var accidental: NoteAccidental {
        get { noteClass.accidental }
        set { noteClass.accidental = newValue }
    }

    /// The absolute (octave-dependent) semitone that identifies the note's pitch uniquely on the keyboard
    public var semitone: Int { (octave * NoteClass.twelveToneOctave.count) + noteClass.semitone }
    /// The absolute (octave-dependent) diatonic step of the note letter.
    public var letterDegree: Int { (octave * NoteLetter.allCases.count) + letter.degree }
    /// The absolute (octave-dependent) semitone that identifies the note letter's pitch uniquely on the keyboard
    public var letterSemitone: Int { (octave * NoteClass.twelveToneOctave.count) + letter.semitone }

    /// The MIDI note number.
    public var midiNumber: Int { semitone + midiSemitoneOffset }

    /// The Western notation for this note.
    public var description: String { "\(noteClass)\(octave)" }

    /// The canonical enharmonic equivalent of this note, which uses either zero or one flat.
    public var canonicalized: Self {
        let step = accidental.semitones.signum()
        if step == 0 {
            return self
        } else {
            var note = self
            // TODO: Make this more efficient than linear time in the accidental
            while !(.flat...(.unaltered)).contains(note.accidental) {
                note = note.enharmonicEquivalent(diatonicSteps: step)
            }
            // Handle edge case where the flattened value can be further rewritten to an unaltered letter
            if note.accidental == .flat {
                let equivalent = note.enharmonicEquivalent(diatonicSteps: -1)
                if equivalent.accidental.isUnaltered {
                    return equivalent
                }
            }
            return note
        }
    }

    public init(noteClass: NoteClass, octave: Int) {
        self.noteClass = noteClass
        self.octave = octave
    }

    /// Convenience initializer for brevity.
    public init(_ noteClass: NoteClass, _ octave: Int) {
        self.init(noteClass: noteClass, octave: octave)
    }

    public init(semitone: Int) {
        let count = NoteClass.twelveToneOctave.count
        self.init(
            noteClass: NoteClass(semitone: semitone.floorMod(count)),
            octave: semitone.floorDiv(count)
        )
    }

    public init(midiNumber: Int) {
        self.init(semitone: midiNumber - midiSemitoneOffset)
    }

    /// Fetches the enharmonic equivalent with the specified number of diatonic steps above this note.
    public func enharmonicEquivalent(diatonicSteps: Int) -> Self {
        // First compute the note with diatonicSteps letters above this one
        var newNote = Note(
            noteClass: NoteClass(letter: letter + diatonicSteps, accidental: accidental),
            octave: octave + (letter.degree + diatonicSteps).floorDiv(NoteLetter.allCases.count)
        )

        // Now we compute how many semitones we moved and subtract them from this accidental
        let semitoneDiff = letterSemitone - newNote.letterSemitone
        newNote.accidental = newNote.accidental + semitoneDiff

        return newNote
    }

    public func advanced(by n: Int) -> Note {
        Note(semitone: semitone + n)
    }

    public static func +(note: Self, interval: DiatonicInterval) -> Self {
        var newNote = note
        newNote.accidental += interval.semitones
        return newNote.enharmonicEquivalent(diatonicSteps: interval.degrees)
    }

    public static func +(note: Self, interval: ChromaticInterval) -> Self {
        note.advanced(by: interval.semitones)
    }

    public static func +=(note: inout Self, interval: DiatonicInterval) {
        note = note + interval
    }

    public static func +=(note: inout Self, interval: ChromaticInterval) {
        note = note + interval
    }
}
