/// The fourth mode (Lydian). The major scale with a sharpened fourth.
public struct LydianScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .majorThird,
        key + .augmentedFourth,
        key + .perfectFifth,
        key + .majorSixth,
        key + .majorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
