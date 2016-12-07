# Gazooee
a logging interface for swift

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
masterDestination = Filter({ $0.level >= .warn && $0.subsystem == "SampleApp" }, destination: ConsoleNSLog())
```

You can also define custome `Destination` to take advantage of other logging systems (like, say, SwiftyBeaver)
