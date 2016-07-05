//
//  Filter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

struct Filter : Destination {
    let destination: Destination
    let predicate: (Record) -> (Bool)

    init(destination: Destination, _ predicate: (Record) -> (Bool)) {
        self.destination = destination
        self.predicate = predicate
    }

    func log(record: Record, value: @noescape () -> (Any)) {
        guard predicate(record) else {
            return
        }
        destination.log(record: record, value: value)
    }
}

public extension Destination {
    func filtered(_ predicate: (Record) -> (Bool)) -> Destination {
        return Filter(destination: self, predicate)
    }

    func filtered(above minLevel: Level) -> Destination {
        return filtered({ $0.level >= minLevel })
    }
}
