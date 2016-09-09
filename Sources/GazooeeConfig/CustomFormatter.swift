//
//  CustomFormatter.swift
//  Gazooee
//
//  Created by Pierre on 12/07/2016.
//
//

import Foundation

public struct CustomFormatter: Formatter {
    private let _formatImpl: (Record, Any) -> String

    #if swift(>=3.0)
    public init(_ impl: @escaping (Record, Any) -> String) {
        self._formatImpl = impl
    }

    public func format(record: Record, value: () -> (Any)) -> String {
        return _formatImpl(record, value())
    }
    #else
    public init(_ impl: (Record, Any) -> String) {
        self._formatImpl = impl
    }

    public func format(record record: Record, @noescape value: () -> (Any)) -> String {
        return _formatImpl(record, value())
    }
    #endif
}
