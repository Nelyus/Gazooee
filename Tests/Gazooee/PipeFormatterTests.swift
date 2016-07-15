//
//  PipeFormatterTests.swift
//  Gazooee
//
//  Created by Pierre on 15/07/2016.
//
//

import XCTest
@testable import GazooeeConfig


class PipeFormatterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPipeFormatter() {
        let sut = PipeFormatter()
        let result = sut.format(record: Record(level: .debug, subsystem: "testsSubsystem", file: "file.swift", line: 42, function: "testFunction"), value: {"TheValue"})
        print(result)
        XCTAssertTrue(result.contains("debug"))
        XCTAssertTrue(result.contains("testsSubsystem"))
        XCTAssertTrue(result.contains("file.swift"))
        XCTAssertTrue(result.contains("42"))
        XCTAssertTrue(result.contains("testFunction"))
        XCTAssertTrue(result.contains("TheValue"))
    }
}
