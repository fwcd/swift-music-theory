/// The classic heptatonic minor scale derived from a set of stacked perfect fifths.
public struct DiatonicMinorScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .minorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .minorSixth,
        key + .minorSeventh
    ] }

    public init(key: Note) {
        self.key = key
    }
}
