public struct MinorTriad: Chord {
    public let root: Note

    public var notes: [Note] { [
        root,
        root + .minorThird,
        root + .perfectFifth
    ] }

    public init(root: Note) {
        self.root = root
    }
}
