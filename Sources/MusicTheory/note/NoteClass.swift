/// A note without an octave. In contrast to a
/// (theoretical) pitch class, it does, however,
/// specify an enharmonic spelling.
public struct NoteClass: Codable, Hashable, CustomStringConvertible {
    public static let c = Self(letter: .c)
    public static let d = Self(letter: .d)
    public static let e = Self(letter: .e)
    public static let f = Self(letter: .f)
    public static let g = Self(letter: .g)
    public static let a = Self(letter: .a)
    public static let b = Self(letter: .b)

    /// The twelve note classes with their canonical spellings.
    public static let twelveToneOctave: [NoteClass] = [
        .c,
        .d.flat,
        .d,
        .e.flat,
        .f.flat,
        .f,
        .g.flat,
        .g,
        .a.flat,
        .a,
        .b.flat,
        .b,
    ]

    public var letter: NoteLetter
    public var accidental: NoteAccidental

    /// This note class sharpened by one semitone.
    public var sharp: Self { Self(letter: letter, accidental: accidental.sharp) }
    /// This note class flattened by one semitone.
    public var flat: Self { Self(letter: letter, accidental: accidental.flat) }

    /// The semitone within a C major scale.
    public var semitone: Int { letter.semitone + accidental.semitones }

    /// The Western notation for this note class.
    public var description: String { "\(letter)\(accidental)" }

    public init(letter: NoteLetter, accidental: NoteAccidental = .unaltered) {
        self.letter = letter
        self.accidental = accidental
    }

    public init(semitone: Int) {
        let modSemitone = semitone.floorMod(Self.twelveToneOctave.count)
        self = Self.twelveToneOctave[modSemitone]
    }
}
