import XCTest
@testable import Gazooee
@testable import GazooeeConfig
//import func Gazooee.log

class MockConsole: Destination {
    var records: [(Record, String)] = []
    func log(record: Record, value: @noescape () -> (Any)) {
        records.append((record, "\(value())"))
    }
}

class GazooeeTests: XCTestCase {
    var defaultConsole = MockConsole()
    func testDefaultLogs() {
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    // probably not on linux
    func testConsoleNSLog() {
        masterDestination = ConsoleNSLog()
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    func testNoFilter() {
        masterDestination = defaultConsole
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
        XCTAssertEqual(4, defaultConsole.records.count)
    }

    func testNoLog() {
        masterDestination = Filter({_ in false}, destination: defaultConsole)
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
        XCTAssertEqual(0, defaultConsole.records.count)
    }

    func testWarnAndErrorLogs() {
        masterDestination = Filter(above: .warn, destination: defaultConsole)
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
        XCTAssertEqual(2, defaultConsole.records.count)
    }

    func testMulti() {
        let secondConsole = MockConsole()
        masterDestination = Multi([defaultConsole, secondConsole])
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
        XCTAssertEqual(4, defaultConsole.records.count)
        XCTAssertEqual(4, secondConsole.records.count)
    }

    func testMultiAlso() {
        let errorConsole = MockConsole()
        masterDestination = Multi([
            defaultConsole,
            Filter(above: .warn, destination: errorConsole),
        ])
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
        XCTAssertEqual(4, defaultConsole.records.count)
        XCTAssertEqual(2, errorConsole.records.count)
    }

    static var allTests : [(String, (GazooeeTests) -> () throws -> Void)] {
        return [
            ("testDefaultLogs", testDefaultLogs),
            ("testNoFilter", testNoFilter),
            ("testNoLog", testNoLog),
            ("testWarnAndErrorLogs", testWarnAndErrorLogs),
            ("testMulti", testMulti),
            ("testMultiAlso", testMultiAlso),
        ]
    }
}
