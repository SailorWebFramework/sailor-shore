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
        .package(path: "../Navigator"),
        .package(path: "../Fleet-Tailwind"),
    ],
    targets: [
        .executableTarget(
            name: "SailorShore",
            dependencies: [
                "Sailor",
                "Navigator",
                .product(name: "Tailwind", package: "Fleet-Tailwind"),
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
            ],
            path: "Sources"
        ),
    ]
)
