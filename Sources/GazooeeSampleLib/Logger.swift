//
//  Logger.swift
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
let logger = Logger(subsystem: "SampleLib")
