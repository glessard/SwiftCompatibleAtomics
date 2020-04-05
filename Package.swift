// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CompatibleAtomics",
  products: [
    .library(name: "CompatibleAtomics", targets: ["CompatibleAtomics"]),
  ],
  dependencies: [
    .package(url: "https://github.com/glessard/swift-atomics", from: "6.2.0")
  ],
  targets: [
    .target(name: "CompatibleAtomics", dependencies: ["CAtomics"]),
    .testTarget(name: "CompatibleAtomicsTests", dependencies: ["CompatibleAtomics"]),
  ],
  swiftLanguageVersions: [.v3, .v4, .v4_2, .version("5")]
)
