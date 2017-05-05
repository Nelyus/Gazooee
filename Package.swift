import PackageDescription

let package = Package(
    name: "Gazooee",
    targets: [
        Target(
            name: "Gazooee",
            dependencies: ["GazooeeConfig"]
        ),
        Target(
            name: "GazooeeConfig"
        ),
    ]
)
