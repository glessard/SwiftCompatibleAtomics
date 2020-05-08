// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftCompatibleAtomics",
  products: [
    .library(name: "SwiftCompatibleAtomics", type: .static, targets: ["SwiftCompatibleAtomics"]),
    .library(name: "CAtomicPrimitives", type: .static, targets: ["CAtomicPrimitives"]),
  ],
  targets: [
    .target(name: "SwiftCompatibleAtomics", dependencies: ["CAtomicPrimitives"]),
    .testTarget(name: "SwiftCompatibleAtomicsTests", dependencies: ["SwiftCompatibleAtomics"]),
    .target(name: "CAtomicPrimitives", dependencies: []),
    .testTarget(name: "CAtomicPrimitivesTests", dependencies: ["CAtomicPrimitives"]),
  ],
  swiftLanguageVersions: [.v3, .v4, .v4_2, .version("5")]
)
