// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Arcane",
    products: [ .library(name: "Arcane", targets: ["Arcane"]) ],
    targets: [
        .target( name: "Arcane", dependencies: []),
        .testTarget(name: "ArcaneTests", dependencies: ["Arcane"])
    ]
)
