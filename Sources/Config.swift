//
//  Config.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

var sharedConfig = Config(destinations: [ConsoleDestination()])

class Config: Destination {
    var destinations: [Destination] = []

    init(destinations: [Destination] = []) {
        self.destinations = destinations
    }

    func log(record: Record, value: @noescape () -> (Any)) {
        for dest in destinations {
            dest.log(record: record, value: value)
        }
    }
}
