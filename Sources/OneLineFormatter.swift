//
//  OneLineFormatter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

struct OneLineFormatter: Formatter {
    func format(record: Record, value: @noescape () -> (Any)) -> String {
        return "\(record.level) [\(record.file):\(record.line) - \(record.function)] \(value())"
    }
}
