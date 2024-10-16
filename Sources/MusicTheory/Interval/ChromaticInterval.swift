/// An interval on the chromatic scale.
public struct ChromaticInterval: Hashable, Sendable, Codable, AdditiveArithmetic {
    /// The empty chromatic interval.
    public static let zero = Self(semitones: 0)

    /// The number of semitones that this interval represents.
    public let semitones: Int

    public static let semitone = Self(semitones: 1)

    public init(semitones: Int) {
        self.semitones = semitones
    }

    public static func semitones(_ n: Int) -> Self {
        Self(semitones: n)
    }

    public prefix static func -(operand: Self) -> Self {
        Self(semitones: -operand.semitones)
    }

    public static func +(lhs: Self, rhs: Self) -> Self {
        Self(semitones: lhs.semitones + rhs.semitones)
    }

    public static func -(lhs: Self, rhs: Self) -> Self {
        Self(semitones: lhs.semitones - rhs.semitones)
    }
}

extension ChromaticInterval: RawRepresentable {
    public var rawValue: Int { semitones }

    public init(rawValue: Int) {
        self.init(semitones: rawValue)
    }
}
