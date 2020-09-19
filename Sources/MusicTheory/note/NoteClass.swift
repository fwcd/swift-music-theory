/// A note without an octave. In contrast to a
/// (theoretical) pitch class, it does, however,
/// specify an enharmonic spelling.
public struct NoteClass: Codable, Hashable {
    public var letter: NoteLetter
    public var accidental: NoteAccidental?

    /// The semitone within a C major scale.
    public var semitone: Int { letter.semitone + (accidental?.semitones ?? 0) }

    public init(_ letter: NoteLetter, _ accidental: NoteAccidental? = nil) {
        self.letter = letter
        self.accidental = accidental
    }
}
