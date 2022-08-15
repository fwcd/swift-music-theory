import XCTest
@testable import MusicTheory

final class NoteLetterTests: XCTestCase {
    func testNoteLetter() throws {
        XCTAssertEqual(NoteLetter.c.advanced(by: 0), .c)
        XCTAssertEqual(NoteLetter.d.advanced(by: 2), .f)
        XCTAssertEqual(NoteLetter.e.advanced(by: 7), .e)
        XCTAssertEqual(NoteLetter.c.advanced(by: -1), .b)
    }
}
