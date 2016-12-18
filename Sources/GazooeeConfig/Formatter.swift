//
//  Formatter.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

/// Conforming types can be used by certain `Destination` to format or serialize their logs
///
/// - seealso: Console, ConsoleNSLog
public protocol Formatter {
    #if swift(>=3.0)
    /// should return a String representing the record
    ///
    /// - parameter record: the record metadata to represent
    /// - parameter value: the record value to represent
    /// - returns: the representation of the record
    func format(record: Record, value: () -> (Any)) -> String
    #else
    func format(record _: Record, @noescape value: () -> (Any)) -> String
    #endif
}
