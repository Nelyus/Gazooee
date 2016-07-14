//
//  TestUtils.swift
//  Gazooee
//
//  Created by Pierre on 15/07/2016.
//
//

import Foundation
import GazooeeConfig

struct VoidDestination: Destination {
    #if swift(>=3.0)
    func log(record: Record, value: @noescape () -> (Any)) {
        // do nothing
    }
    #else
    func log(record record: Record, @noescape value: () -> (Any)) {
    // do nothing
    }
    #endif
}

class RecordBuffer: Destination {
    var records: [(record: Record, value: Any)] = []

    #if swift(>=3.0)
    func log(record: Record, value: @noescape () -> (Any)) {
        records.append(record: record, value: value())
    }
    #else
    func log(record record: Record, @noescape value: () -> (Any)) {
        records.append(record: record, value: value())
    }
    #endif
}
