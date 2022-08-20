import Foundation

/// The standard, twelve-tone equal temperament tuning.
public struct EqualTemperament: Tuning {
    public let a4PitchHz: Double

    // The conversion function can be derived as a solution of the following recursive system of equations:
    //
    //   2 * f(n) = f(n + 12)    (moving up 12 semitones should double the pitch/frequency)
    //      f(57) = 440          (57 = 12 * 4 + 9 is the semitone of A4)
    //
    // Substituting in a generic exponential function c * b^n and solving yields:
    //
    //   b = 12th root of 2
    //   c = a4PitchHz / (12th root of 2)^57
    //
    // Simplifying gets us
    // 
    //   f(n) = c * b^n
    //        = a4PitchHz * (1 / (12th root of 2)^57) * 2^(n / 12)
    //        = a4PitchHz * 2^(-57 / 12) * 2^(n / 12)
    //        = a4PitchHz * 2^((n - 57) / 12)

    public init(a4PitchHz: Double = 440) {
        self.a4PitchHz = a4PitchHz
    }

    public func pitchHz(for note: Note) -> Double {
        a4PitchHz * pow(2, Double(note.semitone - 57) / 12.0)
    }

    public func semitone(for pitchHz: Double) -> Double {
        assert(pitchHz > 0)
        return 12.0 * log2(pitchHz / a4PitchHz) + 57
    }
}
