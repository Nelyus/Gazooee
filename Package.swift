import PackageDescription

let package = Package(
    name: "Gazooee",
    targets: [
        Target(
            name: "Gazooee",
            dependencies: [.Target(name: "GazooeeConfig")]
        ),
        Target(
            name: "GazooeeConfig"
        )
    ]
)
