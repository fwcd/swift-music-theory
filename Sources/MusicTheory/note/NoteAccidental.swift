/// An accidental raises or lowers a note by a number of semitones.
public struct NoteAccidental: CustomStringConvertible, Codable, Hashable, Strideable, AdditiveArithmetic {
    /// The number of semitones the note in altered by. Sharp if > 0, flat if < 0.
    public var semitones: Int

    public static let doubleFlat = Self(semitones: -2)
    public static let flat = Self(semitones: -1)
    public static let unaltered = Self(semitones: 0)
    public static let sharp = Self(semitones: 1)
    public static let doubleSharp = Self(semitones: 2)

    /// The unaltered accidental.
    public static var zero = unaltered

    /// This accidental sharpened by one semitone.
    public var sharp: Self { Self(semitones: semitones + 1) }
    /// This accidental flattened by one semitone.
    public var flat: Self { Self(semitones: semitones - 1) }

    /// Whether the accidental is unaltered/zero.
    public var isUnaltered: Bool { semitones == 0 }

    /// The Western notation for this note accidental.
    public var description: String {
        if semitones >= 0 {
            return String(repeating: "#", count: semitones)
        } else {
            return String(repeating: "b", count: -semitones)
        }
    }

    public init(semitones: Int) {
        self.semitones = semitones
    }

    /// Parses an accidental from the given string.
    public init?(_ rawString: String) {
        if let symbol = rawString.first {
            guard rawString.allSatisfy({ $0 == symbol }) else { return nil }

            let factor: Int
            switch symbol {
            case "#": factor = 1
            case "b": factor = 1
            default: return nil
            }

            semitones = rawString.count * factor
        } else {
            semitones = 0
        }
    }

    public func advanced(by n: Int) -> Self {
        self + n
    }

    public func distance(to other: Self) -> Int {
        other.semitones - semitones
    }

    public static func +(lhs: Self, rhs: Int) -> Self {
        Self(semitones: lhs.semitones + rhs)
    }

    public static func +=(lhs: inout Self, rhs: Int) {
        lhs.semitones += rhs
    }

    public static func +(lhs: Self, rhs: Self) -> Self {
        Self(semitones: lhs.semitones + rhs.semitones)
    }

    public static func -(lhs: Self, rhs: Self) -> Self {
        Self(semitones: lhs.semitones - rhs.semitones)
    }
}

extension NoteAccidental: RawRepresentable {
    public var rawValue: Int { semitones }

    public init(rawValue: Int) {
        self.init(semitones: rawValue)
    }
}
