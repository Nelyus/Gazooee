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
        ),
        Target(
            name: "GazooeeSampleApp",
            dependencies: [
                .Target(name: "Gazooee"),
                .Target(name: "GazooeeConfig"),
                .Target(name: "GazooeeSampleLib"),
            ]
        ),
        Target(
            name: "GazooeeSampleLib",
            dependencies: [
                .Target(name: "Gazooee"),
            ]
        )
    ]
)
