// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.12.3")
let checksum = "5b65c9aa2643a14dcebddc217463b0d80428d4519dfb70dbe4a13980bd376ffb"

let package = Package(
    name: "MapsIndoorsCore",
    platforms: [.iOS(.v15)],
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
