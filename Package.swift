// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeetCodeInSwift",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "Utils", targets: ["Utils"]),
        .executable(name: "p0059", targets: ["p0059"]),
        .executable(name: "p0104", targets: ["p0104"]),
        .executable(name: "p0212", targets: ["p0212"]),
        .executable(name: "p0230", targets: ["p0230"]),
        .executable(name: "p0239", targets: ["p0239"]),
        .executable(name: "p0359", targets: ["p0359"]),
        .executable(name: "p0443", targets: ["p0443"]),
        .executable(name: "p0547", targets: ["p0547"]),
        .executable(name: "p0873", targets: ["p0873"]),
        .executable(name: "p1129", targets: ["p1129"]),
        .executable(name: "p1854", targets: ["p1854"]),
        .executable(name: "p2012", targets: ["p2012"]),
        .executable(name: "p2156", targets: ["p2156"]),
        .executable(name: "p2161", targets: ["p2161"]),
        .executable(name: "p2206", targets: ["p2206"]),
        .executable(name: "p2226", targets: ["p2226"]),
        .executable(name: "p2269", targets: ["p2269"]),
        .executable(name: "p2272", targets: ["p2272"]),
        .executable(name: "p2296", targets: ["p2296"]),
        .executable(name: "p2460", targets: ["p2460"]),
        .executable(name: "p2529", targets: ["p2529"]),
        .executable(name: "p2560", targets: ["p2560"]),
        .executable(name: "p2594", targets: ["p2594"]),
        .executable(name: "p3305", targets: ["p3305"]),
        .executable(name: "p3306", targets: ["p3306"]),
        .executable(name: "p3110", targets: ["p3110"]),
        .executable(name: "p3340", targets: ["p3340"]),
        .executable(name: "p3355", targets: ["p3355"]),
        .executable(name: "p3356", targets: ["p3356"]),
        .executable(name: "nextdoor_p1", targets: ["nextdoor_p1"]),
        .executable(name: "uber_p1", targets: ["uber_p1"]),
        .executable(name: "envoy", targets: ["envoy"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMinor(from: "1.1.0")  // or `.upToNextMajor
        ),
        .package(
            url: "https://github.com/apple/swift-algorithms",
            from: "1.2.0"
        )
    ],
    targets: [
        .target(
            name: "Utils",
            dependencies: [],
            path: "Sources/Utils"
        ),
        .executableTarget(
            name: "p0059",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0059"
        ),
        .executableTarget(
            name: "p0104",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0104"
        ),
        .executableTarget(
            name: "p0212",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0212"
        ),
        .executableTarget(
            name: "p0230",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0230"
        ),
        .executableTarget(
            name: "p0239",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0239"
        ),
        .executableTarget(
            name: "p0443",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0443"
        ),
        .executableTarget(
            name: "p0359",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0359"
        ),
        .executableTarget(
            name: "p0547",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p0547"
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
            name: "p1129",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p1129"
        ),
        .executableTarget(
            name: "p1854",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p1854"
        ),
        .executableTarget(
            name: "p2012",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2012"
        ),
        .executableTarget(
            name: "p2156",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2156"
        ),
        .executableTarget(
            name: "p2161",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2161"
        ),
        .executableTarget(
            name: "p2206",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2206"
        ),
        .executableTarget(
            name: "p2226",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2226"
        ),
        .executableTarget(
            name: "p2269",
            dependencies: ["Utils"],
            path: "Sources/p2269"
        ),
        .executableTarget(
            name: "p2272",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            path: "Sources/p2272"
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
        .executableTarget(
            name: "p2529",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2529"
        ),
        .executableTarget(
            name: "p2560",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2560"
        ),
        .executableTarget(
            name: "p2594",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p2594"
        ),
        .executableTarget(
            name: "p3305",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p3305"
        ),
        .executableTarget(
            name: "p3306",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p3306"
        ),
        .executableTarget(
            name: "p3110",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p3110"
        ),
        .executableTarget(
            name: "p3340",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p3340"
        ),
        .executableTarget(
            name: "p3355",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p3355"
        ),
        .executableTarget(
            name: "p3356",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/p3356"
        ),
        .executableTarget(
            name: "nextdoor_p1",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/companies/nextdoor"
        ),
        .executableTarget(
            name: "uber_p1",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/companies/uber/p1"
        ),
        .executableTarget(
            name: "envoy",
            dependencies: [
                "Utils",
                .product(name: "Collections", package: "swift-collections"),
            ],
            path: "Sources/companies/envoy"
        ),
    ]
)
