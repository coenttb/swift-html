// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let htmlCSS: Self = "HTML+CSS"
    static let htmlAttributes: Self = "HTML Attributes"
    static let htmlElements: Self = "HTML Elements"
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
        .library(name: .htmlCSS, targets: [.htmlCSS]),
        .library(name: .htmlAttributes, targets: [.htmlAttributes]),
        .library(name: .htmlElements, targets: [.htmlElements]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-css.git", branch: "mdn-types-properties"),
        .package(url: "https://github.com/coenttb/pointfree-html.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.3"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", branch: "1.9.0"),
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .product(name: "CSS", package: "swift-css"),
                .product(name: "PointFreeHTML", package: "pointfree-html"),
            ]
        ),
        .target(
            name: .htmlCSS,
            dependencies: [
                .product(name: "CSS", package: "swift-css"),
                .product(name: "PointFreeHTML", package: "pointfree-html"),
            ]
        ),
        .testTarget(
            name: .htmlCSS.tests,
            dependencies: [
                "HTML+CSS",
                .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "DependenciesTestSupport", package: "swift-dependencies"),
                .product(name: "CSS", package: "swift-css"),
                .product(name: "PointFreeHTML", package: "pointfree-html"),
            ]
        ),
        .target(
            name: .htmlAttributes,
            dependencies: [
                .product(name: "PointFreeHTML", package: "pointfree-html"),
            ]
        ),
        .testTarget(
            name: .htmlAttributes.tests,
            dependencies: [
                "HTML Attributes",
                .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "DependenciesTestSupport", package: "swift-dependencies"),
                .product(name: "PointFreeHTML", package: "pointfree-html"),
            ]
        ),
        .target(
            name: .htmlElements,
            dependencies: [
                .product(name: "PointFreeHTML", package: "pointfree-html"),
                "HTML Attributes",
            ]
        ),
        .testTarget(
            name: .htmlElements.tests,
            dependencies: [
                "HTML Elements",
                "HTML Attributes",
                .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "DependenciesTestSupport", package: "swift-dependencies"),
                .product(name: "PointFreeHTML", package: "pointfree-html"),
            ]
        ),
    ]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
