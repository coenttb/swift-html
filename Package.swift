// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let htmlAttributes: Self = "HTML Attributes"
    static let htmlElements: Self = "HTML Elements"
}

extension Target.Dependency {
    static var htmlAttributes: Self { .target(name: .htmlAttributes) }
    static var htmlElements: Self { .target(name: .htmlElements) }
}

extension Target.Dependency {
    static var inlineSnapshotTesting: Self { .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
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
        .library(name: "HTML Domain Model", targets: [.htmlAttributes, .htmlElements]),
        .library(name: .htmlAttributes, targets: [.htmlAttributes]),
        .library(name: .htmlElements, targets: [.htmlElements]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.3"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", branch: "1.9.0"),
    ],
    targets: [
        .target(
            name: .htmlAttributes,
            dependencies: []
        ),
        .testTarget(
            name: .htmlAttributes.tests,
            dependencies: [
                .htmlAttributes,
                .inlineSnapshotTesting,
                .dependenciesTestSupport,
            ]
        ),
        .target(
            name: .htmlElements,
            dependencies: [
                .htmlAttributes,
            ]
        ),
        .testTarget(
            name: .htmlElements.tests,
            dependencies: [
                .htmlElements,
                .inlineSnapshotTesting,
                .dependenciesTestSupport,
            ]
        ),
    ]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
