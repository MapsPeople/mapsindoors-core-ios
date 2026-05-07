// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.16.5-rc.1")
let checksum = "1c7e14141f73eb9a3178eefaeec5023929ed3021e66609d069387e3beee41141"

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
