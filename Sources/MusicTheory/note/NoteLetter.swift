/// A note letter, corresponding to the steps
/// of a C major scale.
public enum NoteLetter: Int, CaseIterable, CustomStringConvertible, Codable, Hashable {
    case c = 0
    case d = 2
    case e = 4
    case f = 5
    case g = 7
    case a = 9
    case b = 11

    private static let letterStrings: [NoteLetter: String] = [
        .c: "C",
        .d: "D",
        .e: "E",
        .f: "F",
        .g: "G",
        .a: "A",
        .b: "B"
    ]

    /// The semitone within a C major scale.
    public var semitone: Int { rawValue }
    public var description: String { Self.letterStrings[self]! }

    public static func of(_ s: String) -> NoteLetter? {
        letterStrings.first { $0.value == s }.map(\.key)
    }
}
