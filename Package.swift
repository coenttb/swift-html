// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let htmlCSS: Self = "HTML+CSS"
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
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-css.git", branch: "mdn-types-properties"),
        .package(url: "https://github.com/coenttb/pointfree-html.git", branch: "main"),
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
        )
    ]
)
