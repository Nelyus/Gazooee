//
//  ConsoleNSLog.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public struct ConsoleNSLog: Destination {
    let formatter: Formatter

    public init(formatter: Formatter = OneLineFormatter()) {
        self.formatter = formatter
    }

    public func log(record: Record, value: @noescape () -> (Any)) {
        NSLog(formatter.format(record: record, value: value))
    }
}
