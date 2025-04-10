// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
}

let package = Package(
    name: "swift-html",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17),
      ],
    products: [
        .library(name: .html, targets: [.html]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html-css-pointfree.git", branch: "main"),
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .product(name: "HTML+CSS+PointFreeHTML", package: "swift-html-css-pointfree"),
            ]
        )
    ]
)
