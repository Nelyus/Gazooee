//
//  Sample.swift
//  Gazooee
//
//  Created by Pierre on 07/12/2016.
//
//

import Foundation

public class Sample {
    public var name: String
    
    public enum Failure: Error {
        case bar
    }

    public init(name: String) {
        logger.debug("will init Sample \(name)")
        self.name = name
    }
    
    public func foo(_ flag: Bool) throws {
        guard false == flag else {
            logger.error("\(name): will fail")
            throw Failure.bar
        }
        logger.info("\(name): will succeed")
    }
}
