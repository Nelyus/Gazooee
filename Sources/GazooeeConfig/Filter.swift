//
//  Filter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

struct Filter : Destination {
    let predicate: (Record) -> (Bool)
    let destination: Destination

    init(_ predicate: (Record) -> (Bool), destination: Destination) {
        self.predicate = predicate
        self.destination = destination
    }

    init(above minLevel: Level, destination: Destination) {
        self.init({ $0.level >= minLevel }, destination: destination)
    }

    #if swift(>=3.0)
    func log(record: Record, value: @noescape () -> (Any)) {
        guard predicate(record) else {
            return
        }
        destination.log(record: record, value: value)
    }
    #else
    func log(record record: Record, @noescape value: () -> (Any)) {
        guard predicate(record) else {
            return
        }
        destination.log(record: record, value: value)
    }
    #endif
}

public extension Destination {
    #if swift(>=3.0)
    func filtered(_ predicate: (Record) -> (Bool)) -> Destination {
        return Filter(predicate, destination: self)
    }
    #else
    func filtered(predicate: (Record) -> (Bool)) -> Destination {
        return Filter(predicate, destination: self)
    }
    #endif

    func filtered(above minLevel: Level) -> Destination {
        return filtered({ $0.level >= minLevel })
    }
}
