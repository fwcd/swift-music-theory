/// A hexatonic blues scale based on the minor pentatonic scale plus the out-of-key, b5 'blue note'.
public struct MinorBluesScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .minorThird,
        key + .perfectFourth,
        key + .diminishedFifth, // Blue note
        key + .perfectFifth,
        key + .minorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
