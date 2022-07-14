// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PackageDeliveryKit",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "PackageDeliveryKit",
      targets: ["PackageDeliveryKit"]),
    .library(
      name: "PackageDeliveryUI",
      targets: ["PackageDeliveryUI"]
    ),
    .library(
      name: "Utilities",
      targets: ["Utilities"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/airbnb/lottie-ios.git",
      from: "3.4.0"
    )
  ],
  targets: [
    .target(
      name: "PackageDeliveryKit",
      dependencies: [.target(name: "Utilities")]),
    .testTarget(
      name: "PackageDeliveryKitTests",
      dependencies: ["PackageDeliveryKit"]),
    .target(
      name: "PackageDeliveryUI",
      dependencies: [
        .product(name: "Lottie", package: "lottie-ios")
      ]),
    .target(name: "Utilities")
  ]
)
