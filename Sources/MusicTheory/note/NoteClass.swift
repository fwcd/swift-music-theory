/// A note without an octave. In contrast to a
/// (theoretical) pitch class, it does, however,
/// specify an enharmonic spelling.
public struct NoteClass: Codable, Hashable {
    /// The twelve note classes with their (most common)
    /// enharmonic spellings.
    public static let twelveToneOctave: [[NoteClass]] = [
        [Self(.c)],
        [Self(.c, .sharp), Self(.d, .flat)],
        [Self(.d)],
        [Self(.d, .sharp), Self(.e, .flat)],
        [Self(.e)],
        [Self(.f)],
        [Self(.f, .sharp), Self(.g, .flat)],
        [Self(.g)],
        [Self(.g, .sharp), Self(.a, .flat)],
        [Self(.a)],
        [Self(.a, .sharp), Self(.b, .flat)],
        [Self(.b)]
    ]

    public var letter: NoteLetter
    public var accidental: NoteAccidental?

    /// The semitone within a C major scale.
    public var semitone: Int { letter.semitone + (accidental?.semitones ?? 0) }

    public init(_ letter: NoteLetter, _ accidental: NoteAccidental? = nil) {
        self.letter = letter
        self.accidental = accidental
    }
}
