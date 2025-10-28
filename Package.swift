// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FunctionCalling-FirebaseAI",
    platforms: [
        .macOS(.v13),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FunctionCalling-FirebaseAI",
            targets: ["FunctionCalling-FirebaseAI"])
    ],
    dependencies: [
        .package(url: "https://github.com/fumito-ito/FunctionCalling", from: "0.5.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "12.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FunctionCalling-FirebaseAI",
            dependencies: [
                .product(name: "FunctionCalling", package: "FunctionCalling"),
                .product(name: "FirebaseAI", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "FunctionCalling-FirebaseAITests",
            dependencies: ["FunctionCalling-FirebaseAI"])
    ]
)
