import XCTest
@testable import Gazooee
//import func Gazooee.log

class GazooeeTests: XCTestCase {
    func testDefaultLogs() {
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    func testNoLog() {
        masterDestination = ConsoleDestination().filtered({_ in false})
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    func testWarnAndErrorLogs() {
        masterDestination = ConsoleDestination().filtered(above: .warn)
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    func testOtherSyntax() {
        masterDestination = Filter(above: .warn, destination: ConsoleDestination())
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    static var allTests : [(String, (GazooeeTests) -> () throws -> Void)] {
        return [
            ("testDefaultLogs", testDefaultLogs),
            ("testNoLog", testNoLog),
            ("testWarnAndErrorLogs", testWarnAndErrorLogs),
        ]
    }
}
