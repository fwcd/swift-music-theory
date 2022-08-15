/// A note without an octave. In contrast to a
/// (theoretical) pitch class, it does, however,
/// specify an enharmonic spelling.
public struct NoteClass: Codable, Hashable, CustomStringConvertible {
    /// The twelve note classes with their (most common)
    /// enharmonic spellings.
    public static let twelveToneOctave: [[NoteClass]] = [
        [Self(.c), Self(.b, .sharp)],
        [Self(.c, .sharp), Self(.d, .flat)],
        [Self(.d)],
        [Self(.d, .sharp), Self(.e, .flat)],
        [Self(.e), Self(.f, .flat)],
        [Self(.f), Self(.e, .sharp)],
        [Self(.f, .sharp), Self(.g, .flat)],
        [Self(.g)],
        [Self(.g, .sharp), Self(.a, .flat)],
        [Self(.a)],
        [Self(.a, .sharp), Self(.b, .flat)],
        [Self(.b), Self(.c, .flat)]
    ]

    public var letter: NoteLetter
    public var accidental: NoteAccidental

    /// The semitone within a C major scale.
    public var semitone: Int {
        guard let st = Self.twelveToneOctave.firstIndex(where: { $0.contains(self) }) else {
            fatalError("Invalid note class: \(self), twelve-tone octave should contain all note classes. This is a bug.")
        }
        return st
    }

    public var description: String { "\(letter)\(accidental)" }

    public init(_ letter: NoteLetter, _ accidental: NoteAccidental = .unaltered) {
        self.letter = letter
        self.accidental = accidental
    }

    public init(semitone: Int, enharmonicPicker: ([NoteClass]) -> NoteClass = { $0.first! }) {
        let modSemitone = semitone.floorMod(Self.twelveToneOctave.count)
        let equivalents = Self.twelveToneOctave[modSemitone]
        let enharmonic = enharmonicPicker(equivalents)

        self.init(enharmonic.letter, enharmonic.accidental)
    }
}
