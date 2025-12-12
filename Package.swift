// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.16.0-rc.5")
let checksum = "1b61e3cfdac7f1d03237a88140ab60c89a62031528273bd244c80a9ae6db7e56"

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
