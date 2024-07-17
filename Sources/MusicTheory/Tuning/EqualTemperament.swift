import Foundation

/// The standard, twelve-tone equal temperament tuning.
public struct EqualTemperament: Tuning {
    private let referencePitchHz: Double
    private let referencePitchSemitone: Int

    // The conversion function can be derived as a solution of the following recursive system of equations
    // (for simplicity we'll assume referencePitchHz = 440, referencePitchSemitone = 57):
    //
    //   2 * f(n) = f(n + 12)    (moving up 12 semitones should double the pitch/frequency)
    //      f(57) = 440          (57 = 12 * 4 + 9 is the semitone of A4)
    //
    // Substituting in a generic exponential function c * b^n and solving yields:
    //
    //   b = 12th root of 2
    //   c = 440 / (12th root of 2)^57
    //
    // Simplifying gets us
    // 
    //   f(n) = c * b^n
    //        = 440 * (1 / (12th root of 2)^57) * 2^(n / 12)
    //        = 440 * 2^(-57 / 12) * 2^(n / 12)
    //        = 440 * 2^((n - 57) / 12)

    public init(
        referencePitchHz: Double = 440,
        referencePitchSemitone: Int = Note(.a, 4).semitone
    ) {
        self.referencePitchHz = referencePitchHz
        self.referencePitchSemitone = referencePitchSemitone
    }

    public func pitchHz(for note: Note) -> Double {
        referencePitchHz * pow(2, Double(note.semitone - referencePitchSemitone) / 12.0)
    }

    public func semitone(for pitchHz: Double) -> Double {
        assert(pitchHz > 0)
        return 12.0 * log2(pitchHz / referencePitchHz) + Double(referencePitchSemitone)
    }
}
