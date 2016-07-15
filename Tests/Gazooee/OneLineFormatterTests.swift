//
//  OneLineFormatterTests.swift
//  Gazooee
//
//  Created by Pierre on 14/07/2016.
//
//

import Foundation
import XCTest
@testable import GazooeeConfig

class OneLineFormatterTests: XCTestCase {

    func testOneLineFormatter() {
        let sut = OneLineFormatter()
        let result = sut.format(record: Record(level: .debug, subsystem: "testsSubsystem", file: "file.swift", line: 42, function: "testFunction"), value: {"TheValue"})
        XCTAssertTrue(result.contains("debug"))
        XCTAssertTrue(result.contains("testsSubsystem"))
        XCTAssertTrue(result.contains("file.swift"))
        XCTAssertTrue(result.contains("42"))
        XCTAssertTrue(result.contains("testFunction"))
        XCTAssertTrue(result.contains("TheValue"))
    }
}
