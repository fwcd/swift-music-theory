public struct PowerChord: Chord {
    public let root: Note

    public var notes: [Note] { [
        root,
        root + .perfectFifth
    ] }

    public init(root: Note) {
        self.root = root
    }
}
