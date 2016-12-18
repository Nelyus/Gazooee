//
//  LoggerTests.swift
//  Gazooee
//
//  Created by Pierre on 15/07/2016.
//
//

import XCTest
@testable import Gazooee
@testable import GazooeeConfig

class LoggerTests: XCTestCase {
    let buffer = RecordBuffer()
    let sut = Logger(subsystem: "tests-subsystem")

    override func setUp() {
        masterDestination = buffer
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLogDebug() {
        let sut = Logger(subsystem: "tests")
        //
        sut.log(.debug, "TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.debug, result.record.level)
    }

    func testDebug() {
        let sut = Logger(subsystem: "tests")
        //
        sut.debug("TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.debug, result.record.level)
    }

    func testLogInfo() {
        let sut = Logger(subsystem: "tests")
        //
        sut.log(.info, "TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.info, result.record.level)
    }

    func testInfo() {
        let sut = Logger(subsystem: "tests")
        //
        sut.info("TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.info, result.record.level)
    }

    func testLogWarn() {
        let sut = Logger(subsystem: "tests")
        //
        sut.log(.warn, "TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.warn, result.record.level)
    }

    func testWarn() {
        let sut = Logger(subsystem: "tests")
        //
        sut.warn("TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.warn, result.record.level)
    }

    func testLogError() {
        let sut = Logger(subsystem: "tests")
        //
        sut.log(.error, "TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.error, result.record.level)
    }

    func testError() {
        let sut = Logger(subsystem: "tests")
        //
        sut.error("TheValue")
        XCTAssertEqual(1, buffer.records.count)
        let result = buffer.records[0]
        XCTAssertEqual("TheValue", result.value as! String)
        XCTAssertEqual(.error, result.record.level)
    }
}
