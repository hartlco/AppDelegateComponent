// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AppDelegateComponent",
    platforms: [.iOS("13.0")],
    products: [
        .library(name: "AppDelegateComponent", targets: ["AppDelegateComponent"])
    ],
    targets: [
        .target(
            name: "AppDelegateComponent",
            path: "AppDelegateComponent/Classes"
        )
    ]
)
