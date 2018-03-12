// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Aria",
    products: [
        .library(name: "AriaKit", targets: ["AriaKit"]),
        .executable(name: "Aria", targets: ["Aria"])
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.2.0"),
        .package(url: "https://github.com/thoughtbot/Runes.git", from: "4.0.0"),
        .package(url: "https://github.com/thoughtbot/Curry.git", from: "4.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMinor(from: "0.8.0")),

        // Test dependencies
        .package(url: "https://github.com/Quick/Quick", from: "1.2.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "7.0.3")
    ],
    targets: [
        .target(
            name: "Aria",
            dependencies: [
                "AriaKit",
                "Kitura",
                "Runes",
                "Curry",
                "CryptoSwift"
            ],
            path: "Sources/Aria"
        ),
        .target(
            name: "AriaKit",
            dependencies: [
                "Runes",
                "Curry",
            ],
            path: "Sources/AriaKit"
        ),
       .testTarget(
           name: "AriaKitTests",
           dependencies: [
               "AriaKit",
               "Nimble",
               "Quick"
           ],
           path: "Tests/AriaKit"
       )
    ]
)
