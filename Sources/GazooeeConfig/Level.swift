//
//  Level.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

public enum Level: Int, Comparable {
    case debug, info, warn, error
}


public func <(lhs: Level, rhs: Level) -> Bool {
    return lhs.rawValue < rhs.rawValue
}
