//
//  Log.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation
import GazooeeConfig

infix operator ??= { assignment }

func ??=<T>(rhs: inout T?, lhs: @autoclosure () -> (T)) -> T {
    if let value = rhs {
        return value
    }
    let newValue = lhs()
    rhs = newValue
    return newValue
}

public func log(_ level: Level, _ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
    var valueCache: Any? = nil
    let valueGetter: @noescape () -> Any = { return valueCache ??= value() }
    masterDestination.log(
        record: Record(level: level, file: file, line: line, function: function),
        value: valueGetter
    )
}
