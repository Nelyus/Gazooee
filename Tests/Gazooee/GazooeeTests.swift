import XCTest
@testable import Gazooee
@testable import GazooeeConfig

class GazooeeTests: XCTestCase {
    var defaultDestination = RecordBuffer()
    var logger = Logger(domain: "test")

    func testDefaultLogs() {
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
    }

    // probably not on linux
    func testConsole() {
        masterDestination = Console()
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
        masterDestination = defaultDestination
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(4, defaultDestination.records.count)
    }

    func testMulti() {
        let secondConsole = RecordBuffer()
        masterDestination = Multi([defaultDestination, secondConsole])
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(4, defaultDestination.records.count)
        XCTAssertEqual(4, secondConsole.records.count)
    }

    func testMultiAlso() {
        let errorConsole = RecordBuffer()
        masterDestination = Multi([
            defaultDestination,
            Filter(above: .warn, destination: errorConsole),
        ])
        logger.log(.debug, "this is debug")
        logger.log(.info, "this is info")
        logger.log(.warn, "this is warn")
        logger.log(.error, "this is error")
        XCTAssertEqual(4, defaultDestination.records.count)
        XCTAssertEqual(2, errorConsole.records.count)
    }

    func testLogPerformance() {
        masterDestination = VoidDestination()
        measure {
            for _ in 0..<1000 {
                self.logger.log(.debug, "this is debug")
            }
        }
    }

    static var allTests : [(String, (GazooeeTests) -> () throws -> Void)] {
        return [
            ("testDefaultLogs", testDefaultLogs),
            ("testNoFilter", testNoFilter),
            ("testMulti", testMulti),
            ("testMultiAlso", testMultiAlso),
        ]
    }
}
