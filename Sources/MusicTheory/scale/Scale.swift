/// A sequence of, usually distinct, notes.
public protocol Scale {
    /// The notes of the scale.
    var notes: [Note] { get }
}
