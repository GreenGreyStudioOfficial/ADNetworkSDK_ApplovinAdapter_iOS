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
    dependencies: [
        .appLovin
    ],
    targets: [
        .target(
            name: "ADNetworkSDK_ApplovinAdapter",
            dependencies: [
                .AppLovinSDK
            ]
        )
    ]
)

extension Package.Dependency {
    static let  appLovin: Package.Dependency =
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", from: Version("11.5.0"))
}

extension Target.Dependency {
    static let AppLovinSDK: Target.Dependency = .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package")
}
