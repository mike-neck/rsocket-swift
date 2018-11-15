// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rsocket-swift",
    products: [
        .library(name: "rsocket-swift", targets: ["rsocket-swift"]),
    ],
    dependencies: [
         .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "rsocket-swift", dependencies: ["NIOOpenSSL"]),
        .testTarget(name: "rsocket-swiftTests", dependencies: ["rsocket-swift"]),
    ]
)
