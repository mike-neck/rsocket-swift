// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rsocket-swift",
    products: [
        .library(name: "RSocket", targets: ["RSocket"]),
    ],
    dependencies: [
         .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "RSocket", dependencies: ["NIOOpenSSL"]),
        .testTarget(name: "RSocketTests", dependencies: ["RSocket"]),
    ]
)
