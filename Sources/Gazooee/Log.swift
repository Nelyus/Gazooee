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

/// The preferred way to record logs
///
/// Usage:
/// ```
///     //MyProject/Logger.swift
///     let logger = Logger(subsystem: "MyProject")
///     logger.debug("Hello World")
/// ```
public struct Logger {
    let subsystem: String
    
    /// Initializes a new Logger for the given `subsystem`
    ///
    /// - parameter subsystem: a name for the current subsystem
    public init(subsystem: String) {
        self.subsystem = subsystem
    }

    #if swift(>=3.0)
    /// records `value` with the given level
    ///
    /// - parameter level: the log level
    /// - parameter value: the data to log
    /// - parameter file: the current file (defaults to #file)
    /// - parameter line: the current line (defaults to #line)
    /// - parameter function: the current function (defaults to #function)
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
    /// records `value` with the level `debug`
    ///
    /// - parameter value: the data to log
    /// - parameter file: the current file (defaults to #file)
    /// - parameter line: the current line (defaults to #line)
    /// - parameter function: the current function (defaults to #function)
    public func debug(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .debug, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func debug(@autoclosure value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .debug, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    ///
    #if swift(>=3.0)
    /// records `value` with the level `info`
    ///
    /// - parameter value: the data to log
    /// - parameter file: the current file (defaults to #file)
    /// - parameter line: the current line (defaults to #line)
    /// - parameter function: the current function (defaults to #function)
    public func info(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .info, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func info(@autoclosure value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .info, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    #if swift(>=3.0)
    /// records `value` with the level `warn`
    ///
    /// - parameter value: the data to log
    /// - parameter file: the current file (defaults to #file)
    /// - parameter line: the current line (defaults to #line)
    /// - parameter function: the current function (defaults to #function)
    public func warn(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .warn, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func warn(@autoclosure value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .warn, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif

    #if swift(>=3.0)
    /// records `value` with the level `error`
    ///
    /// - parameter value: the data to log
    /// - parameter file: the current file (defaults to #file)
    /// - parameter line: the current line (defaults to #line)
    /// - parameter function: the current function (defaults to #function)
    public func error(_ value: @autoclosure () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .error, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #else
    public func error(@autoclosure value: () -> (Any), _file file: String = #file, _line line: Int = #line, _function function: String = #function) {
        var valueCache: Any? = nil
        masterDestination.log(
            record: Record(level: .error, subsystem: subsystem, file: file, line: line, function: function),
            value: { valueCache ??= value() }
        )
    }
    #endif
}
