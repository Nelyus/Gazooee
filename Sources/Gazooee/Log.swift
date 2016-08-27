//
//  Log.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation
import GazooeeConfig

#if swift(>=3.0)
infix operator ??= : AssignmentPrecedence
#else
infix operator ??= { assignment }
#endif

#if swift(>=3.0)
func ??=<T>(rhs: inout T?, lhs: @autoclosure () -> (T)) -> T {
    if let value = rhs {
        return value
    }
    let newValue = lhs()
    rhs = newValue
    return newValue
}
#else
func ??=<T>(inout rhs: T?, @autoclosure lhs: () -> (T)) -> T {
    if let value = rhs {
        return value
    }
    let newValue = lhs()
    rhs = newValue
    return newValue
}
#endif

//#if swift(>=3.0)
//public func log(_ level: Level, _ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
//    var valueCache: Any? = nil
//    masterDestination.log(
//        record: Record(level: level, file: file, line: line, function: function),
//        value: { valueCache ??= value() }
//    )
//}
//#else
//public func log(level: Level, @autoclosure _ value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
//    var valueCache: Any? = nil
//    masterDestination.log(
//        record: Record(level: level, file: file, line: line, function: function),
//        value: { valueCache ??= value() }
//    )
//}
//#endif

public struct Logger {
    let subsystem: String
    public init(subsystem: String) {
        self.subsystem = subsystem
    }

    #if swift(>=3.0)
    public func log(_ level: Level, _ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: level, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func log(level: Level, @autoclosure _ value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: level, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    #if swift(>=3.0)
    public func debug(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .debug, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func debug(@autoclosure _ value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .debug, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    #if swift(>=3.0)
    public func info(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .info, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func info(@autoclosure _ value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .info, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    #if swift(>=3.0)
    public func warn(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .warn, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func warn(@autoclosure _ value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .warn, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    #if swift(>=3.0)
    public func error(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .error, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func error(@autoclosure _ value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .error, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif
}
