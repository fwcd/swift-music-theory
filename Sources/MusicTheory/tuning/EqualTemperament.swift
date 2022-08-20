import Foundation

private let twelfthRootOf2 = pow(2.0, 1.0 / 12.0)
private let twelfthRootOf2ToThePowerOf57 = pow(twelfthRootOf2, 57)
private let logTwelfthRootOf2 = log(twelfthRootOf2)

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

    private var constant: Double { a4PitchHz / twelfthRootOf2ToThePowerOf57 }

    public init(a4PitchHz: Double = 440) {
        self.a4PitchHz = a4PitchHz
    }

    public func pitchHz(for note: Note) -> Double {
        constant * pow(twelfthRootOf2, Double(note.semitone))
    }

    public func semitone(for pitchHz: Double) -> Double {
        assert(pitchHz > 0)
        return log(pitchHz / constant) / logTwelfthRootOf2
    }
}
