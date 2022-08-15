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

    /// The twelve note classes with their (most common)
    /// enharmonic spellings.
    public static let twelveToneOctave: [[NoteClass]] = [
        [.c, .b.sharp],
        [.c.sharp, .d.flat],
        [.d],
        [.d.sharp, .e.flat],
        [.e, .f.flat],
        [.f, .e.sharp],
        [.f.sharp, .g.flat],
        [.g],
        [.g.sharp, .a.flat],
        [.a],
        [.a.sharp, .b.flat],
        [.b, .c.flat]
    ]

    public var letter: NoteLetter
    public var accidental: NoteAccidental

    /// This note class sharpened by one semitone.
    public var sharp: Self { Self(letter: letter, accidental: accidental.sharp) }
    /// This note class flattened by one semitone.
    public var flat: Self { Self(letter: letter, accidental: accidental.flat) }

    /// The semitone within a C major scale.
    public var semitone: Int {
        guard let st = Self.twelveToneOctave.firstIndex(where: { $0.contains(self) }) else {
            fatalError("Invalid note class: \(self), twelve-tone octave should contain all note classes. This is a bug.")
        }
        return st
    }

    /// The Western notation for this note class.
    public var description: String { "\(letter)\(accidental)" }

    public init(letter: NoteLetter, accidental: NoteAccidental = .unaltered) {
        self.letter = letter
        self.accidental = accidental
    }

    public init(semitone: Int, enharmonicPicker: ([NoteClass]) -> NoteClass = { $0.first! }) {
        let modSemitone = semitone.floorMod(Self.twelveToneOctave.count)
        let equivalents = Self.twelveToneOctave[modSemitone]
        let enharmonic = enharmonicPicker(equivalents)

        self.init(letter: enharmonic.letter, accidental: enharmonic.accidental)
    }
}
