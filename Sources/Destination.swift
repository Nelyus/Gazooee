//
//  Destination.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public protocol Destination {
    func log(record: Record, value: @noescape () -> (Any))
}
