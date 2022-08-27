/// The classic pentatonic major scale derived from a set of stacked perfect fifths.
public struct MajorPentatonicScale: Scale {
    public let key: Note
    
    public var notes: [Note] { [
        key,
        key + .majorSecond,
        key + .majorThird,
        key + .perfectFifth,
        key + .majorSixth,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
