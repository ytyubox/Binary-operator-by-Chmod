import XCTest
@testable import Chmod

final class ChmodTests: XCTestCase {
    func testModValue() {
        func AssertModValue(mod: Mod, expect:Mod.Value) {
            XCTAssertEqual(mod.value, expect)
        }
        AssertModValue(mod: .execute, expect: 1)
        AssertModValue(mod: .write, expect: 2)
        AssertModValue(mod: .read, expect: 4)
    }
    func testModInitByValue() throws {
        func AssertModInit(
            value:Mod.Value,
            expect: Mod) throws {
            let mod = try XCTUnwrap(Mod(value))
            XCTAssertEqual(mod, expect)
        }
        
        try AssertModInit(value: 1, expect: .execute)
        try AssertModInit(value: 2, expect: .write)
        try AssertModInit(value: 4, expect: .read)
    }
    func testModInitNil() {
        let toTest = Set(0...10).subtracting(Set([1,2,4]))
        for value in toTest {
            XCTAssertNil(Mod(value))
        }
    }
    func testChmodMakeNumberByMod() {
        let chmod = Chmod()
        let mods:[Mod] = Mod.allCases
        for mod in mods {
            XCTAssertEqual(
                chmod.makeNumber(mod),
                mod.value)
        }
    }
    
    typealias Pair = (value:Mod.Value, mods:[Mod])
    
    let modsList:[Pair] = [
        (7,    [.read, .write, .execute]),
        (6,    [.read, .write          ]),
        (5,    [.read,         .execute]),
        (4,    [.read,                 ]),
        (3,    [       .write, .execute]),
        (2,    [       .write,         ]),
        (1,    [               .execute]),
        (0,    [                       ]),]
    
    func testChmodMakeNumberByArrayMod() {
        let chmod = Chmod()
        for pair in modsList {
            XCTAssertEqual(
                chmod.makeNumber(pair.mods),
                pair.value)
        }
    }
    func testMakeMods() {
        let chmod = Chmod()
        for pair in modsList {
            XCTAssertEqual(chmod.makeMods(pair.value),
                           pair.mods)
        }
    }
    
    func testMakeModsShouldReturnEmpty() {
        let chmod = Chmod()
        for value in [-1,8] {
            XCTAssertTrue(chmod.makeMods(value).isEmpty)
        }
    }
    
    static var allTests = [
        ("testModValue", testModValue),
        ("testModInitByValue", testModInitByValue),
        ("testModInitNil", testModInitNil),
        ("testChmodMakeNumberByMod",testChmodMakeNumberByMod),
        ("testChmodMakeNumberByArrayMod",testChmodMakeNumberByArrayMod),
        ("testMakeMods",testMakeMods),
        ("testMakeModsShouldReturnEmpty",testMakeModsShouldReturnEmpty)
    ]
}

