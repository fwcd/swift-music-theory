/// An accidental raises or lowers a note
/// by a semitone.
public enum NoteAccidental: String, CustomStringConvertible, Codable, Hashable {
    case flat = "b"
    case sharp = "#"

    public var description: String { rawValue }
    public var semitones: Int {
        switch self {
            case .flat: return -1
            case .sharp: return 1
        }
    }

    public static func of(_ s: String) -> NoteAccidental? {
        NoteAccidental(rawValue: s)
    }
}
