// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SailorShore",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.47.0"),
        .package(url: "https://github.com/SailorWebFramework/Sailor", branch: "feature-fin"),
    ],
    targets: [
        .executableTarget(
            name: "SailorShore",
            dependencies: [
                "Sailor",
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
            ],
            path: "Sources"
        ),
    ]
)
