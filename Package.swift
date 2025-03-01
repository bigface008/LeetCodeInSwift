// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeetCodeInSwift",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "Utils", targets: ["Utils"]),
        .executable(name: "p0873", targets: ["p0873"]),
        .executable(name: "p2296", targets: ["p2296"]),
        .executable(name: "p2460", targets: ["p2460"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMinor(from: "1.1.0")  // or `.upToNextMajor
        )
    ],
    targets: [
        .target(
            name: "Utils",
            dependencies: [],
            path: "Sources/Utils"
        ),
        .executableTarget(
            name: "p0873",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0873"
        ),
        .executableTarget(
            name: "p2296",
            dependencies: ["Utils"],
            path: "Sources/p2296"
        ),
        .executableTarget(
            name: "p2460",
            dependencies: ["Utils"],
            path: "Sources/p2460"
        ),
    ]
)
