import XCTest
@testable import MusicTheory

final class TriadTests: XCTestCase {
    static var allTests = [
        ("testMajorTriad", testMajorTriad),
        ("testMinorTriad", testMinorTriad)
    ]
    
    func testMajorTriad() {
        XCTAssertEqual(MajorTriad(root: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.e, 0),
            Note(.g, 0)
        ])
    }

    func testMinorTriad() {
        XCTAssertEqual(MinorTriad(root: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.e, .flat, 0),
            Note(.g, 0)
        ])
    }
}
