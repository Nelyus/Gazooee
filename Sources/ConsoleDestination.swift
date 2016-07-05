//
//  ConsoleDestination.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public struct ConsoleDestination: Destination {
    public func log(record: Record, value: @noescape () -> (Any)) {
        print("\(record.level) [\(record.file):\(record.line) - \(record.function)] \(value())")
    }
}
