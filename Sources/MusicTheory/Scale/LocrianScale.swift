/// The seventh mode (Locrian).
public struct LocrianScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .minorSecond,
        key + .minorThird,
        key + .perfectFourth,
        key + .diminishedFifth,
        key + .minorSixth,
        key + .minorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
