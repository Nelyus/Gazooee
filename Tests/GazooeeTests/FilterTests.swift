//
//  FilterTests.swift
//  Gazooee
//
//  Created by Pierre on 15/07/2016.
//
//

import XCTest
@testable import Gazooee
@testable import GazooeeConfig

class FilterTests: XCTestCase {
    var defaultConsole: RecordBuffer!
    var logger: Logger!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        defaultConsole = RecordBuffer()
        logger = Logger(subsystem: "FilterTests")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
        XCTAssertEqual(.warn, defaultConsole.records[0].record.level)
        XCTAssertEqual(.error, defaultConsole.records[1].record.level)
    }

    func testPerformanceFilteredOut() {
        let buffer = defaultConsole!
        masterDestination = Filter(above: .info, destination: buffer)
        measure {
            for _ in 0..<1000 {
                self.logger.log(.debug, "test")
            }
        }
        XCTAssertEqual(0, buffer.records.count)
    }

    func testPerformanceFilteredIn() {
        let buffer = defaultConsole!
        buffer.records.reserveCapacity(10000)
        masterDestination = Filter(above: .info, destination: buffer)
        measure {
            for _ in 0..<1000 {
                self.logger.log(.error, "test")
            }
        }
        print("count -> \(buffer.records.count)")
        //XCTAssertEqual(1000, buffer.buffer.count)
    }

}
