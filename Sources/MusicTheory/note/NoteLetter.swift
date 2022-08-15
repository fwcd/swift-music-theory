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

    /// The Western notation for this note letter.
    public var description: String { rawValue }

    /// Parses a note letter from the given value.
    public init?(_ rawString: String) {
        self.init(rawValue: rawString)
    }

    public func advanced(by n: Int) -> NoteLetter {
        Self.allCases[(Self.allCases.firstIndex(of: self)! + n).floorMod(Self.allCases.count)]
    }
}
