//
//  NSLogDestination.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public struct NSLogDestination: Destination {
    public func log(record: Record, value: @noescape () -> (Any)) {
        NSLog("\(record.level) [\(record.file):\(record.line) - \(record.function)] \(value())")
    }
}
