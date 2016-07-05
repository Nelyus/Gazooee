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
    let level: Level
    let file: String
    let line: Int
    let function: String

    public init(level: Level, file: String, line: Int, function: String) {
        self.level = level
        self.file = file.fileName()
        self.line = line
        self.function = function
    }
}
