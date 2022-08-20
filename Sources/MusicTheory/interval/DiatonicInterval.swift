/// An interval on the diatonic scale.
public struct DiatonicInterval: Hashable, Codable {
    /// The total number of diatonic steps in this interval.
    public let degrees: Int
    /// The total number of semitones in this interval.
    public let semitones: Int

    // Main intervals
    public static let unison = Self(degrees: 0, semitones: 0)
    public static let minorSecond = Self(degrees: 1, semitones: 1)
    public static let majorSecond = Self(degrees: 1, semitones: 2)
    public static let minorThird = Self(degrees: 2, semitones: 3)
    public static let majorThird = Self(degrees: 2, semitones: 4)
    public static let perfectFourth = Self(degrees: 3, semitones: 5)
    public static let augmentedFourth = Self(degrees: 3, semitones: 6)
    public static let diminishedFifth = Self(degrees: 4, semitones: 6)
    public static let perfectFifth = Self(degrees: 4, semitones: 7)
    public static let minorSixth = Self(degrees: 5, semitones: 8)
    public static let majorSixth = Self(degrees: 5, semitones: 9)
    public static let minorSeventh = Self(degrees: 6, semitones: 10)
    public static let majorSeventh = Self(degrees: 6, semitones: 11)
    public static let octave = Self(degrees: 7, semitones: 12)

    // Main compound intervals
    public static let minorNinth = Self(degrees: 8, semitones: 13)
    public static let majorNinth = Self(degrees: 8, semitones: 14)
    public static let minorTenth = Self(degrees: 9, semitones: 15)
    public static let majorTenth = Self(degrees: 9, semitones: 16)
    public static let perfectEleventh = Self(degrees: 10, semitones: 17)
    public static let perfectTwelfth = Self(degrees: 11, semitones: 19) // also called 'tritave'
    public static let minorThirteenth = Self(degrees: 12, semitones: 20)
    public static let majorThirteenth = Self(degrees: 12, semitones: 21)
    public static let minorFourteenth = Self(degrees: 13, semitones: 22)
    public static let majorFourteenth = Self(degrees: 13, semitones: 23)
    public static let doubleOctave = Self(degrees: 14, semitones: 24)

    prefix static func -(operand: Self) -> Self {
        return Self(degrees: -operand.degrees, semitones: -operand.semitones)
    }

    static func octaves(_ count: Int) -> Self {
        return Self(degrees: 7 * count, semitones: 12 * count)
    }
}
