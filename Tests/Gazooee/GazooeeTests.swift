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
        let errorConsole = MockConsole()
        masterDestination = Multi([
            Filter({ $0.level <= .warn }, destination: defaultConsole),
            Filter({ $0.level >= .warn }, destination: errorConsole),
        ])
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
        XCTAssertEqual(3, defaultConsole.records.count)
        XCTAssertEqual(2, errorConsole.records.count)
    }

    static var allTests : [(String, (GazooeeTests) -> () throws -> Void)] {
        return [
            ("testDefaultLogs", testDefaultLogs),
            ("testNoLog", testNoLog),
            ("testWarnAndErrorLogs", testWarnAndErrorLogs),
        ]
    }
}
