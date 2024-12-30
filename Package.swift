// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KKProgressToolbar",
    platforms: [
        .iOS(.v15),
        .tvOS(.v13),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "KKProgressToolbar",
            targets: ["KKProgressToolbar"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/aporat/GTProgressBar.git", from: "1.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0")

    ],
    targets: [
        .target(
            name: "KKProgressToolbar",
            dependencies: ["GTProgressBar", "SnapKit"],
            path: "KKProgressToolbar"
        ),
        .testTarget(
            name: "KKProgressToolbarTests",
            dependencies: ["KKProgressToolbar"]
        )
    ]
)
