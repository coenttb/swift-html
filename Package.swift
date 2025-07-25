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
    static var htmlTypesFoundation: Self { .product(name: "HTMLTypesFoundation", package: "swift-html-types") }
    static var pointFreeHtmlTestSupport: Self { .product(name: "PointFreeHTMLTestSupport", package: "pointfree-html") }
    static var htmlCssPointFreeHTML: Self { .product(name: "HTML+CSS+PointFreeHTML", package: "swift-html-css-pointfree") }
}

let package = Package(
    name: "swift-html",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17)
    ],
    products: [
        .library(name: .html, targets: [.html])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html-css-pointfree", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-html-types", branch: "main"),
        .package(url: "https://github.com/coenttb/pointfree-html", branch: "main"),
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlCssPointFreeHTML,
                .htmlTypesFoundation
            ]
        ),
        .testTarget(
            name: .html.tests,
            dependencies: [
                .html,
                .pointFreeHtmlTestSupport
            ]
        )
    ]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
