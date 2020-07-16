import XCTest
@testable import Chmod

final class ChmodTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Chmod().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
