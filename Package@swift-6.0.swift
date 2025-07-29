// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
}

extension Target.Dependency {
    static var htmlTypesFoundation: Self { .product(name: "HTMLTypesFoundation", package: "swift-html-types") }
    static var pointFreeHtmlTestSupport: Self { .product(name: "PointFreeHTMLTestSupport", package: "pointfree-html") }
    static var htmlCssPointFreeHTML: Self { .product(name: "HTMLCSSPointFreeHTML", package: "swift-html-css-pointfree") }
    static var stringBuilder: Self { .product(name: "StringBuilder", package: "swift-builders") }
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
        .library(name: .html, targets: [.html])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html-css-pointfree", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-html-types", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/pointfree-html", from: "2.0.0"),
        .package(url: "https://github.com/coenttb/swift-builders", from: "0.0.1")
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlCssPointFreeHTML,
                .htmlTypesFoundation,
                .stringBuilder
            ]
        ),
        .testTarget(
            name: .html.tests,
            dependencies: [
                .html,
                .pointFreeHtmlTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
