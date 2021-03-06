//
//  ConsoleNSLog.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

/// A default implementation of `Destination` to `NSLog` logs
public struct ConsoleNSLog: Destination {
    let formatter: Formatter

    public init(formatter: Formatter = OneLineFormatter()) {
        self.formatter = formatter
    }

    #if swift(>=3.0)
    public func log(record: Record, value: () -> (Any)) {
        NSLog(formatter.format(record: record, value: value))
    }
    #else
    public func log(record record: Record, @noescape value: () -> (Any)) {
        NSLog(formatter.format(record: record, value: value))
    }
    #endif
}
