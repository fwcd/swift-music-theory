/// A note letter, corresponding to the steps
/// of a C major scale.
public enum NoteLetter: String, CaseIterable, CustomStringConvertible, Codable, Hashable {
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case a = "A"
    case b = "B"

    public var description: String { rawValue }

    public static func of(_ s: String) -> NoteLetter? {
        NoteLetter(rawValue: s)
    }
}
