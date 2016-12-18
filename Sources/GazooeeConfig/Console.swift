//
//  Console.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

/// A default implementation of Destination to `print` logs
public struct Console: Destination {
    let formatter: Formatter

    public init(formatter: Formatter = OneLineFormatter()) {
        self.formatter = formatter
    }

    #if swift(>=3.0)
    public func log(record: Record, value: () -> (Any)) {
        print(formatter.format(record: record, value: value))
    }
    #else
    public func log(record record: Record, @noescape value: () -> (Any)) {
        print(formatter.format(record: record, value: value))
    }
    #endif
}
