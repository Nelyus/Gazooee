//
//  Record.swift
//  Gazooee
//
//  Created by Pierre on 05/07/2016.
//
//

import Foundation

private extension String {
    func fileName() -> String {
        var chars = characters
        while let slash = chars.index(of: "/") {
            chars.removeSubrange(Range(uncheckedBounds: (lower: chars.startIndex, upper: chars.index(after: slash))))
        }
        return String(chars)
    }
}

public struct Record {
    public let level: Level
    public let file: String
    public let line: Int
    public let function: String

    public init(level: Level, file: String, line: Int, function: String) {
        self.level = level
        self.file = file.fileName()
        self.line = line
        self.function = function
    }
}