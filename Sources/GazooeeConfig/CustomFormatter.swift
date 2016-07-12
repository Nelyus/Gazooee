//
//  CustomFormatter.swift
//  Gazooee
//
//  Created by Pierre on 12/07/2016.
//
//

import Foundation

public struct CustomFormatter: Formatter {
    private let _formatImpl: (record: Record, value: Any) -> String

    public init(_ impl: (record: Record, value: Any) -> String) {
        self._formatImpl = impl
    }

    #if swift(>=3.0)
    public func format(record: Record, value: @noescape () -> (Any)) -> String {
        return _formatImpl(record: record, value: value())
    }
    #else
    public func format(record record: Record, @noescape value: () -> (Any)) -> String {
        return _formatImpl(record: record, value: value())
    }
    #endif
}
