import XCTest
@testable import Gazooee
@testable import GazooeeConfig
//import func Gazooee.log

class MockConsole: Destination {
    var records: [(Record, String)] = []
    #if swift(>=3.0)
    func log(record: Record, value: @noescape () -> (Any)) {
        records.append((record, "\(value())"))
    }
    #else
    func log(record record: Record, @noescape value: () -> (Any)) {
        records.append((record, "\(value())"))
    }
    #endif
}

class GazooeeTests: XCTestCase {
    var defaultConsole = MockConsole()
    var logger = Logger(domain: "test")

    func testDefaultLogs() {
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
    }

    // probably not on linux
    func testConsoleNSLog() {
        masterDestination = ConsoleNSLog()
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
    }

    func testNoFilter() {
        masterDestination = defaultConsole
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(4, defaultConsole.records.count)
    }

    func testNoLog() {
        masterDestination = Filter({_ in false}, destination: defaultConsole)
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(0, defaultConsole.records.count)
    }

    func testWarnAndErrorLogs() {
        masterDestination = Filter(above: .warn, destination: defaultConsole)
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(2, defaultConsole.records.count)
    }

    func testMulti() {
        let secondConsole = MockConsole()
        masterDestination = Multi([defaultConsole, secondConsole])
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(4, defaultConsole.records.count)
        XCTAssertEqual(4, secondConsole.records.count)
    }

    func testMultiAlso() {
        let errorConsole = MockConsole()
        masterDestination = Multi([
            defaultConsole,
            Filter(above: .warn, destination: errorConsole),
        ])
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
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
