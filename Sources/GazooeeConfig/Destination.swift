//
//  Destination.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

/// Conforming types are responsible for what happens to logs
///
/// An implementation of Destination will typically either store, print or forward logs to another destination.
public protocol Destination {
    #if swift(>=3.0)
    /// Handles a log
    ///
    /// - parameter record: the record metadata
    /// - parameter value: the record value; value is a avoid generating the value when the record is ignored
    func log(record: Record, value: () -> (Any))
    #else
    func log(record _: Record, @noescape value: () -> (Any))
    #endif
}
