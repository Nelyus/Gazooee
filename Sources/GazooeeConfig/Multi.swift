//
//  Multi.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public struct Multi: Destination {
    let destinations: [Destination]

    public init(_ destinations: [Destination]) {
        self.destinations = destinations
    }

    #if swift(>=3.0)
    public func log(record: Record, value: @noescape () -> (Any)) {
        for aDestination in destinations {
            aDestination.log(record: record, value: value)
        }
    }
    #else
    public func log(record record: Record, @noescape value: () -> (Any)) {
        for aDestination in destinations {
            aDestination.log(record: record, value: value)
        }
    }
    #endif
}
