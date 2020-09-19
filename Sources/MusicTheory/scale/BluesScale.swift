public struct BluesScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .minorThird,
        key + .perfectFourth,
        key + .diminishedFifth,
        key + .perfectFifth,
        key + .minorSeventh
    ] }

    public init(key: Note) {
        self.key = key
    }
}
