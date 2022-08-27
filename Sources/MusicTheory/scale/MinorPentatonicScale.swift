/// The classic pentatonic minor scale derived from a set of stacked perfect fifths.
public struct MinorPentatonicScale: Scale {
    public let key: Note
    
    public var notes: [Note] { [
        key,
        key + .minorThird,
        key + .perfectFourth,
        key + .perfectFifth,
        key + .minorSeventh,
    ] }

    public init(key: Note) {
        self.key = key
    }
}
