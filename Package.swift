// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.6.4-beta.1")
let checksum = "f08c710dae1d2cb7381c9512cf52bd11680d2491a49d35a56fc24251fe14867e"

let package = Package(
    name: "MapsIndoorsCore",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "MapsIndoorsCore", targets: ["MapsIndoorsCoreWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MapsPeople/mapsindoors-ios.git", exact: mapsindoorsVersion),
    ],
    targets: [
        .binaryTarget(
            name: "MapsIndoorsCore",
            url: "https://github.com/MapsPeople/MapsIndoors-SDK-iOS/releases/download/\(mapsindoorsVersion)/MapsIndoorsCore.xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "MapsIndoorsCoreWrapper",
            dependencies: [
                "MapsIndoorsCore",
                .product(name: "MapsIndoors", package: "mapsindoors-ios"),
            ]
        ),
    ]
)
