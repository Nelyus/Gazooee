//
//  OneLineFormatter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public struct OneLineFormatter: Formatter {
    public func format(record: Record, value: @noescape () -> (Any)) -> String {
        return "\(record.level) [\(record.file):\(record.line) - \(record.function)] \(value())"
    }
}
