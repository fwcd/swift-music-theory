/// A harmonic set of notes, usually played together.
public protocol Chord {
    /// The notes of the chord.
    var notes: [Note] { get }
}
