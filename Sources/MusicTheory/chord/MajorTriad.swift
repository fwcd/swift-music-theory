public struct MajorTriad: Chord {
    public let root: Note

    public var notes: [Note] { [
        root,
        root + .majorThird,
        root + .perfectFifth
    ] }

    public init(root: Note) {
        self.root = root
    }
}
