# Gazooee

A Swifty logging interface

## Purpose

This library is meant to offer a common interface to logging systems, simple or sophisticated.
To be able to start light, integrate later good logging facilities, and even later changes the logging facilities, without changing all the code.

## How to log

In your module, wether a library or an executable, you define one logger:

```swift
// Logger.swift
import Gazooee
let logger = Logger(subsystem: "MyLibrary")
```

From there you can record logs through the logger:

```swift
// MyClass.swift
class MyClass {
    func foo() {
        logger.error("Huston, we've got a problem")
    }
}
```

## How to route and filter logs

If you develop an App, you can configure how to manage logs, filtering with level, subsystem, file, function, etc… (by default it logs everything using "print()")
```swift
// main.swift
import GazooeeConfig
masterDestination = Filter(above: .warn, destination: ConsoleNSLog())
```

You can also define some custom `Destination` to take advantage of other logging systems (like, say, SwiftyBeaver)

## Samples

See the sample targets in the project.

## Installation

### Swift Package Manager

For [Swift Package Manager](https://github.com/apple/swift-package-manager) add the following package to your `Package.swift` file. Swift 3 is supported, Swift 2 should be but hasn't been tested recently.

```swift
.Package(url: "https://github.com/Nelyus/Gazooee.git", majorVersion: 0, minor: 3)
```
