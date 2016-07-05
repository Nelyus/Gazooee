//
//  MultiDestination.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public struct MultiDestination: Destination {
    let destinations: [Destination]

    public init(_ destinations: [Destination]) {
        self.destinations = destinations
    }

    public func log(record: Record, value: @noescape () -> (Any)) {
        for aDestination in destinations {
            aDestination.log(record: record, value: value)
        }
    }
}
