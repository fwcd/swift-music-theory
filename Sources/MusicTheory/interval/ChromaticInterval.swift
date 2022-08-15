/// An interval on the chromatic scale.
public struct ChromaticInterval: Hashable, Codable {
    /// The number of semitones that this interval represents.
    public let semitones: Int

    public static let semitone = Self(semitones: 1)

    public init(semitones: Int) {
        self.semitones = semitones
    }

    public static func semitones(_ n: Int) -> Self {
        Self(semitones: n)
    }
}

extension ChromaticInterval: RawRepresentable {
    public var rawValue: Int { semitones }

    public init(rawValue: Int) {
        self.init(semitones: rawValue)
    }
}
