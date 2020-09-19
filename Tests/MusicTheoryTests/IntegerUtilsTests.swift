import XCTest
@testable import MusicTheory

final class IntegerUtilsTests: XCTestCase {
    static var allTests = [
        ("testFloorDiv", testFloorDiv),
        ("testFloorMod", testFloorMod)
    ]

    func testFloorDiv() {
        XCTAssertEqual(3.floorDiv(3), 1)
        XCTAssertEqual(2.floorDiv(3), 0)
        XCTAssertEqual(1.floorDiv(3), 0)
        XCTAssertEqual(0.floorDiv(3), 0)
        XCTAssertEqual((-1).floorDiv(3), -1)
        XCTAssertEqual((-2).floorDiv(3), -1)
        XCTAssertEqual((-3).floorDiv(3), -1)
        XCTAssertEqual((-4).floorDiv(3), -2)
    }

    func testFloorMod() {
        XCTAssertEqual(3.floorMod(3), 0)
        XCTAssertEqual(2.floorMod(3), 2)
        XCTAssertEqual(1.floorMod(3), 1)
        XCTAssertEqual(0.floorMod(3), 0)
        XCTAssertEqual((-1).floorMod(3), 2)
        XCTAssertEqual((-2).floorMod(3), 1)
        XCTAssertEqual((-3).floorMod(3), 0)
        XCTAssertEqual((-4).floorMod(3), 2)
    }
}
