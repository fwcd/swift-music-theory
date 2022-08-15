import XCTest
@testable import MusicTheory

final class BluesScaleTests: XCTestCase {
    func testMinorScale() throws {
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
