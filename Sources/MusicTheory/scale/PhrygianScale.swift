/// The third mode (Phrygian). The minor scale with a flattened second.
public struct PhrygianScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .minorSecond,
        key + .minorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .minorSixth,
        key + .minorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
