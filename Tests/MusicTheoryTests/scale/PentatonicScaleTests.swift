import XCTest
@testable import MusicTheory

final class PentatonicScaleTests: XCTestCase {
    func testMajorScale() {
        XCTAssertEqual(MajorPentatonicScale(key: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.d, 0),
            Note(.e, 0),
            Note(.g, 0),
            Note(.a, 0),
        ])
        XCTAssertEqual(MajorPentatonicScale(key: Note(.a, 2)).notes, [
            Note(.a, 2),
            Note(.b, 2),
            Note(.c.sharp, 3),
            Note(.e, 3),
            Note(.f.sharp, 3),
        ])
    }

    func testMinorScale() {
        XCTAssertEqual(MinorPentatonicScale(key: Note(.a, -1)).notes, [
            Note(.a, -1),
            Note(.c, 0),
            Note(.d, 0),
            Note(.e, 0),
            Note(.g, 0),
        ])
    }
}
