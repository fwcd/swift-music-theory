import XCTest
@testable import MusicTheory

final class NoteTests: XCTestCase {
    static var allTests = [
        ("testNote", testNote)
    ]
    
    func testNote() throws {
        XCTAssertEqual(Note(.c, 0).numValue, 0)
        XCTAssertEqual(Note(.c, 1).numValue, 12)
        XCTAssertEqual(Note(.d, 0).numValue, 2)
        XCTAssertEqual(Note(.d, .sharp, 0).numValue, 3)
        XCTAssertEqual(Note(.e, .sharp, 4).numValue, Note(.f, 4).numValue)
    }
}
