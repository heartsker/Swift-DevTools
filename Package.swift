// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-DevTools",
    platforms: [.iOS("16.0")],
    products: [
        .library(
            name: "Swift-DevTools",
            targets: ["Swift-DevTools"])
    ],
    dependencies: [
        // Base package
    ],
    targets: [
        .target(
            name: "Swift-DevTools",
            dependencies: []),
        .testTarget(
            name: "Swift-DevToolsTests",
            dependencies: ["Swift-DevTools"])
    ]
)
