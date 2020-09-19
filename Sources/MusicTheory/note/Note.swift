/// A note is a named pitch or, viewed differently,
/// a note class with an octave in scientific pitch
/// notation.
public struct Note: Codable, Hashable {
    public var noteClass: NoteClass
    public var octave: Int

    public init(noteClass: NoteClass, octave: Int) {
        self.noteClass = noteClass
        self.octave = octave
    }
}
