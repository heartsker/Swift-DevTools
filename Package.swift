// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-DevTools",
    platforms: [.iOS("16.0")],
    products: [
        .library(
            name: "DevTools",
            targets: ["DevTools"])
    ],
    dependencies: [
        // Base package
    ],
    targets: [
        .target(
            name: "DevTools",
            dependencies: []),
        .testTarget(
            name: "DevToolsTests",
            dependencies: ["DevTools"])
    ]
)
