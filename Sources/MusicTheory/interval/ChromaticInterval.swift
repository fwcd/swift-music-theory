public struct ChromaticInterval {
    public let semitones: Int

    public static let semitone = Self(semitones: 1)

    public init(semitones: Int) {
        self.semitones = semitones
    }

    public static func semitones(_ n: Int) -> Self {
        Self(semitones: n)
    }
}
