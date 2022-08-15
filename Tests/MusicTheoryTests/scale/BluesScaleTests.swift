import XCTest
@testable import MusicTheory

final class BluesScaleTests: XCTestCase {
    func testMajorScale() {
        XCTAssertEqual(MajorBluesScale(key: Note(.g, 1)).notes, [
            Note(.g, 1),
            Note(.a, 1),
            Note(.b.flat, 1),
            Note(.b, 1),
            Note(.d, 2),
            Note(.e, 2),
        ])
    }

    func testMinorScale() {
        XCTAssertEqual(MinorBluesScale(key: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.e.flat, 0),
            Note(.f, 0),
            Note(.g.flat, 0),
            Note(.g, 0),
            Note(.b.flat, 0),
        ])
    }
}
