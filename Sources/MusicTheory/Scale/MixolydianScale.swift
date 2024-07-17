/// The fifth mode (Mixolydian). The major scale with a flattened seventh.
public struct MixolydianScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .majorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .majorSixth,
        key + .minorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
