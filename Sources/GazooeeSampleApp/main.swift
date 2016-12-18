//
//  main.swift
//  Gazooee
//
//  Created by Pierre on 07/12/2016.
//
//

import Foundation

// definition of the logger (we do this once in each module, executable or library)
// - we import Gazooee
import Gazooee
// - we define the logger and its subsystem name
//   it will be available everywhere in the module
let logger = Logger(subsystem: "SampleApp")

// configuration of the destination (we do this only in the app)
// - we import GazooeeConfig
import GazooeeConfig
// - we configure the destination
//   we can use the subsystem name and other properties to filter / redirect logs
// Because we're in the app we configure the outputs
//#if DEBUG
//masterDestination = ConsoleNSLog()
//#else
masterDestination = Filter(above: .warn, destination: ConsoleNSLog())
//#endif

import GazooeeSampleLib
// we continue normal operations
// we configure a Logger with a subsystem

logger.info("starting up")

logger.debug("Hello 'debug' World")
logger.info("Hello 'info' World")
logger.warn("Hello 'warn' World")
logger.error("Hello 'error' World")
print("Hello World")

let sample = Sample(name: "Bar")
try? sample.foo(true)
try? sample.foo(false)

func t(f: GazooeeConfig.Formatter) {
    
}
