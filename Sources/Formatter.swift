//
//  Formatter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public protocol Formatter {
    func format(record: Record, value: @noescape () -> (Any)) -> String
}
