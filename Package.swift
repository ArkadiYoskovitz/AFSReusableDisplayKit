// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

///Users/arkadiyoskovitz/AFSReusableDisplayKit/Package.swift: Source files for target AFSReusableDisplayKit should be located under 'Sources/AFSReusableDisplayKit', or a custom sources path can be set with the 'path' property in Package.swift

let pkg = Package(name: "AFSReusableDisplayKit")
pkg.swiftLanguageVersions = [.v5]
pkg.platforms = [ .iOS(.v10) ]
pkg.products = [
    .library(name: "AFSReusableDisplayKit", targets: ["AFSReusableDisplayKit"])
]
pkg.dependencies = [
    //.package(name: "GAFoundationKit", url: "https://github.com/shay-somech/GAFoundationKit-iOS.git", from: "1.5.2")
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
]
pkg.targets = [
    .target(name: "AFSReusableDisplayKit", path: "AFSReusableDisplayKit/Code"),
    .testTarget(name: "AFSReusableDisplayKitTests", dependencies: ["AFSReusableDisplayKit"]),
]
