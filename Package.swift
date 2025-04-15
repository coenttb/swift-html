// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
}

extension Target.Dependency {
    static var inlineSnapshotTesting: Self { .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
    static var htmlTestSupport: Self { .product(name: "HTMLTestSupport", package: "swift-html-css-pointfree") }
    static var htmlCssPointFreeHTML: Self { .product(name: "HTML+CSS+PointFreeHTML", package: "swift-html-css-pointfree") }
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
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.3"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", branch: "1.9.0"),
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlCssPointFreeHTML
            ]
        ),
        .testTarget(
            name: .html.tests,
            dependencies: [
                .html,
                .htmlTestSupport
            ]
        )
    ]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
