// swift-tools-version:5.7

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
        .package(url: "https://github.com/techprimate/TPPDF", from: "2.4.1"),
        //dev .package(url: "https://github.com/Quick/Quick", from: "7.0.0"),
        //dev .package(url: "https://github.com/Quick/Nimble",  from: "12.0.0")
        //dev .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.50.4"),
    ],
    targets: [
        .target(name: "TPPDFAsync", dependencies: [
            "TPPDF"
        ]),
        //dev .testTarget(name: "TPPDFAsyncTests", dependencies: [
        //dev     "TPPDFAsync",
        //dev     "Quick",
        //dev     "Nimble"
        //dev ]),
    ]
)
