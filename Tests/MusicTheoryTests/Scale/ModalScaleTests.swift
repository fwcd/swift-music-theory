import XCTest
@testable import MusicTheory

final class ModalScaleTests: XCTestCase {
    func testIonian() {
        XCTAssertEqual(IonianScale(key: Note(.c, 0)).notes, [
            Note(.c, 0),
            Note(.d, 0),
            Note(.e, 0),
            Note(.f, 0),
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0)
        ])
    }

    func testDorian() {
        XCTAssertEqual(DorianScale(key: Note(.d, 0)).notes, [
            Note(.d, 0),
            Note(.e, 0),
            Note(.f, 0),
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
        ])
    }

    func testPhrygian() {
        XCTAssertEqual(PhrygianScale(key: Note(.e, 0)).notes, [
            Note(.e, 0),
            Note(.f, 0),
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
        ])
    }

    func testLydian() {
        XCTAssertEqual(LydianScale(key: Note(.f, 0)).notes, [
            Note(.f, 0),
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
        ])
    }

    func testMixolydian() {
        XCTAssertEqual(MixolydianScale(key: Note(.g, 0)).notes, [
            Note(.g, 0),
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f, 1),
        ])
    }

    func testAeolian() {
        XCTAssertEqual(AeolianScale(key: Note(.a, 0)).notes, [
            Note(.a, 0),
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f, 1),
            Note(.g, 1),
        ])
    }

    func testLocrian() {
        XCTAssertEqual(LocrianScale(key: Note(.b, 0)).notes, [
            Note(.b, 0),
            Note(.c, 1),
            Note(.d, 1),
            Note(.e, 1),
            Note(.f, 1),
            Note(.g, 1),
            Note(.a, 1),
        ])
    }
}
