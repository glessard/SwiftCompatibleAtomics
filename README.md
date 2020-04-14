# SwiftCompatibleAtomics [![Build Status](https://travis-ci.org/glessard/deferred.svg?branch=master)](https://travis-ci.org/glessard/deferred)

This is a source-compatible version of [Karoy Lorentey](https://github.com/lorentey)'s pitched `Atomics` submodule for the Swift standard library. His pitch is [here](https://gist.github.com/lorentey/cf8703b5974ebe8f85cfb92a6628880d), his implementation is [here](https://github.com/apple/swift/pull/30553), the discussion is [here](https://forums.swift.org/t/low-level-atomic-operations/34683).

This package uses Clang's C11 atomics support, and works with Swift 4.1 and up. It cannot make some of the guarantees that the official implementation can make, but code that is legal with `import Atomics` should also be legal with `import SwiftCompatibleAtomics`. This gives many Swift users the chance to try out the pitched functionality without having to build a custom toolchain.

While the major version is less than 1, the intention is to keep pace with the pitched implementation of `Atomics`, incrementing the minor version when a source-breaking change occurs in the `Atomics` pitch.

If and when the pitch is accepted and its implementation merged, the corresponding compatible implementation will become `1.0.0`.

In the meantime, use by adding the following dependency to your project's `Package.swift`:
```
.package(url: "https://github.com/glessard/SwiftCompatibleAtomics", from: "0.5.0")
```
or, if you prefer to avoid source breaking changes:
```
.package(url: "https://github.com/glessard/SwiftCompatibleAtomics", .upToNextMinor(from: "0.5.0"))
```

### Version History

* 0.1.0

	Initial version

* 0.2.0

	Fixed a source compatibility issue

* 0.3.0

	Renamed 'UnsafeAtomic' to 'UnsafePointerToAtomic', matching pitched implementation as of April 7th

* 0.4.0
	
	Implemented the solution in two protocol layers, matching pitched implementation as of April 10th

	This version fixes the compilation issue with downloadable Swift 5.1 toolchains.

* 0.5.0

	API tweaks, layout improvements for 'AtomicInteger'
