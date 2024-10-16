/// A sequence of, usually distinct, notes.
public protocol Scale: Sendable {
    /// The notes of the scale.
    var notes: [Note] { get }
}
