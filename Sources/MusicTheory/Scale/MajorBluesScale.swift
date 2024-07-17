/// A hexatonic blues scale based on the major pentatonic scale plus the out-of-key, b3 'blue note'.
public struct MajorBluesScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .minorThird, // Blue note
        key + .majorThird,
        key + .perfectFifth,
        key + .majorSixth,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
