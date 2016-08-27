//
//  Formatter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public protocol Formatter {
    #if swift(>=3.0)
    func format(record: Record, value: () -> (Any)) -> String
    #else
    func format(record _: Record, @noescape value: () -> (Any)) -> String
    #endif
}
