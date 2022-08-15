/// An accidental raises or lowers a note by a number of semitones.
public struct NoteAccidental: CustomStringConvertible, Codable, Hashable {
    /// The number of semitones the note in altered by. Sharp if > 0, flat if < 0.
    public let semitones: Int

    public static let doubleFlat = Self(semitones: -2)
    public static let flat = Self(semitones: -1)
    public static let unaltered = Self(semitones: 0)
    public static let sharp = Self(semitones: 1)
    public static let DoubleSharp = Self(semitones: 2)

    public var description: String {
        if semitones >= 0 {
            return String(repeating: "#", count: semitones)
        } else {
            return String(repeating: "b", count: semitones)
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
}

extension NoteAccidental: RawRepresentable {
    public var rawValue: Int { semitones }

    public init(rawValue: Int) {
        self.init(semitones: rawValue)
    }
}
