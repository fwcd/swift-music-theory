/// The second mode (Dorian). The minor scale with a sharpened sixth.
public struct DorianScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .minorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .majorSixth,
        key + .minorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
