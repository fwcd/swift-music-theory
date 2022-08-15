/// The classic heptatonic major scale derived from a set of stacked perfect fifths.
public struct DiatonicMajorScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .majorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .majorSixth,
        key + .majorSeventh
    ] }

    public init(key: Note) {
        self.key = key
    }
}
