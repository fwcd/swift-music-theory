public protocol Tuning: Sendable {
    /// Fetches the pitch for the given note.
    /// 
    /// - Parameter note: The note
    /// - Returns: The pitch for this note in Hertz
    func pitchHz(for note: Note) -> Double

    /// Fetches the semitone as a floating-point.
    /// 
    /// - Parameter pitchHz: The pitch in Hertz
    /// - Returns: The semitone
    func semitone(for pitchHz: Double) -> Double
}

extension Tuning {
    /// Fetches the note closest to the given pitch.
    /// 
    /// - Parameter pitchHz: The pitch in Hertz
    /// - Returns: The closest note
    func closestNote(for pitchHz: Double) -> Note {
        Note(semitone: Int(semitone(for: pitchHz).rounded()))
    }
}
