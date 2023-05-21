// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TPPDFAsync",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "TPPDFAsync", targets: ["TPPDFAsync"]),
    ],
    dependencies: [
        .package(url: "https://github.com/techprimate/TPPDF", .upToNextMajor(from: "2.4.1")),
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/Quick/Nimble",  .upToNextMajor(from: "8.0.7")),
    ],
    targets: [
        .target(name: "TPPDFAsync", dependencies: [
            "TPPDF"
        ], path: "Sources"),
        .testTarget(name: "TPPDFAsyncTests", dependencies: [
            "TPPDFAsync",
            "Quick",
            "Nimble"
        ]),
    ]
)
