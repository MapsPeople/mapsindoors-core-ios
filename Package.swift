// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.16.2-rc.4")
let checksum = "8b315b3cd389ec846b5c0ed5320bf896540a90900daba93e77f348bd62e26f33"

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
