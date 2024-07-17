/// The classic diatonic (heptatonic) major scale derived from a set of stacked perfect fifths.
public struct MajorScale: Scale {
    public let key: Note

    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .majorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .majorSixth,
        key + .majorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}

public typealias IonianScale = MajorScale
