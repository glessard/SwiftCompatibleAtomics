# SwiftCompatibleAtomics

This is a source-compatible version of Karoy Lorentey's pitched `Atomics` submodule for the Swift standard library. His pitch is [here](https://gist.github.com/lorentey/cf8703b5974ebe8f85cfb92a6628880d), his implementation is [here](https://github.com/apple/swift/pull/30553), the discussion is [here](https://forums.swift.org/t/low-level-atomic-operations/34683).

This package uses Clang's C11 atomics support, and works with Swift 4.1 and up. It cannot make some of the guarantees that the official pitch makes, but code that is legal with `import Atomics` should also be legal with `import SwiftCompatibleAtomics`. This gives many Swift users the chance to try out the pitched functionality without having to build a custom toolchain.
