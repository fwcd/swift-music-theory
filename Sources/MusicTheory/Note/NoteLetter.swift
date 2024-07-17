/// A note letter, corresponding to the steps of a C major scale.
public enum NoteLetter: String, CaseIterable, CustomStringConvertible, Codable, Hashable {
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case a = "A"
    case b = "B"

    /// The Western notation for this note letter.
    public var description: String { rawValue }

    /// The diatonic step of the letter.
    public var degree: Int {
        switch self {
        case .c: return 0
        case .d: return 1
        case .e: return 2
        case .f: return 3
        case .g: return 4
        case .a: return 5
        case .b: return 6
        }
    }

    /// The semitones above c.
    public var semitone: Int {
        switch self {
        case .c: return 0
        case .d: return 2
        case .e: return 4
        case .f: return 5
        case .g: return 7
        case .a: return 9
        case .b: return 11
        }
    }

    /// Parses a note letter from the given value.
    public init?(_ rawString: String) {
        self.init(rawValue: rawString)
    }

    /// Fetches the note letter the given number of (diatonic) steps above this letter.
    public func advanced(by diatonicSteps: Int) -> Self {
        Self.allCases[(Self.allCases.firstIndex(of: self)! + diatonicSteps).floorMod(Self.allCases.count)]
    }

    /// Fetches the note letter the given number of (diatonic) steps above this letter.
    public static func +(lhs: Self, rhs: Int) -> Self {
        lhs.advanced(by: rhs)
    }
}
