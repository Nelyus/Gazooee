//
//  Destination.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public protocol Destination {
    #if swift(>=3.0)
    func log(record: Record, value: () -> (Any))
    #else
    func log(record _: Record, @noescape value: () -> (Any))
    #endif
}
