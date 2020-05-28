//
//  OneLineFormatter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

/// A default implementation of Formatter
public struct OneLineFormatter: Formatter {
    public init() {}

    #if swift(>=3.0)
    public func format(record: Record, value: () -> (Any)) -> String {
        return "\(record.level) [\(record.subsystem): \(record.file):\(record.line) - \(record.function)] \(value())"
    }
    #else
    public func format(record record: Record, @noescape value: () -> (Any)) -> String {
        return "\(record.level) [\(record.subsystem): \(record.file):\(record.line) - \(record.function)] \(value())"
    }
    #endif
}
