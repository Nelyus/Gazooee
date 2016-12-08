# Gazooee

A Swifty logging interface

### Table of Contents
* [Purpose](#purpose)
* [Usage](#usage)
  * [Recording logs](#recording-logs)
  * [Filtering and routing logs](#filtering-and-routing-logs)
  * [Extending](#extending)
  * [Samples](#samples)
* [Integration](#integration)
  * [Swift Package Manager](#swift-package-manager)
* [Reference](#reference)

--

## Purpose

This library is meant to offer a common interface to logging systems, simple or sophisticated.
To be able to start light, integrate later good logging facilities, and even later changes the logging facilities, without changing all the code.

## Usage

### Recording logs

In your module you define one logger. And in the rest of your code use that logger to record messages and informations.

```swift
// Logger.swift
import Gazooee
let logger = Logger(subsystem: "MyLibrary")
```

```swift
// MyClass.swift
class MyClass {
    func foo() {
        logger.error("Huston, we've got a problem")
    }
}
```

### Filtering and routing logs

If you develop an App, you'll certainly want to configure how to treat logs: filter them, direct some logs to the console, or to another destination, etc… Those settings will apply to your code and your dependencies.
By default it logs everything, and simply `print` it.

```swift
// main.swift
import GazooeeConfig
masterDestination = Filter(above: .warn, destination: ConsoleNSLog())
```

### Extending

There is 1 main point of extension: you can implement new `Destination`s to redirect logs to another system of logging (like, say, SwiftyBeaver), or managing routing in a different way.

You can also implement `Formatter` to format a logs in your own way.

### Samples

See the sample targets in the project.

## Integration

### Swift Package Manager

For [Swift Package Manager](https://github.com/apple/swift-package-manager) add the following to your dependencies, in your `Package.swift` file:

```swift
.Package(url: "https://github.com/Nelyus/Gazooee.git", majorVersion: 0, minor: 3)
```

For exemple:

```swift
let package = Package(
    name: "MyPackage",
    dependencies: [.Package(url: "https://github.com/Nelyus/Gazooee.git", majorVersion: 0, minor: 3)]
)
```

## Reference

There is currently 4 levels of logging: error, warn, info, debug.

A record consist of an arbitrary value, the level, the subsystem (eg: the module), the file, the line and the function
