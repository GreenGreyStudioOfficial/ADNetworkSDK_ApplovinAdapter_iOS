// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADNetworkSDK_ApplovinAdapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ADNetworkSDK_ApplovinAdapter",
            targets: ["ADNetworkSDK_ApplovinAdapter"]
        )
    ],
    targets: [
        .target(
            name: "ADNetworkSDK_ApplovinAdapter"
        )
    ]
)
