/// A harmonic set of notes, usually played together.
public protocol Chord: Sendable {
    /// The notes of the chord.
    var notes: [Note] { get }
}
