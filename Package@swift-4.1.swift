// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftCompatibleAtomics",
  products: [
    .library(name: "SwiftCompatibleAtomics", type: .static, targets: ["SwiftCompatibleAtomics"]),
    .library(name: "CAtomicsPrimitives", type: .static, targets: ["CAtomicsPrimitives"]),
  ],
  targets: [
    .target(name: "SwiftCompatibleAtomics", dependencies: ["CAtomicsPrimitives"]),
    .testTarget(name: "SwiftCompatibleAtomicsTests", dependencies: ["SwiftCompatibleAtomics"]),
    .target(name: "CAtomicsPrimitives", dependencies: []),
    .testTarget(name: "CAtomicsPrimitivesTests", dependencies: ["CAtomicsPrimitives"]),
  ],
  swiftLanguageVersions: [3, 4, 5]
)
