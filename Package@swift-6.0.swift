// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let htmlTheme: Self = "HTMLTheme"
    static let htmlComponents: Self = "HTMLComponents"
    static let htmlMarkdown: Self = "HTMLMarkdown"
    static let htmlEmail: Self = "HTMLEmail"
    static let htmlWebsite: Self = "HTMLWebsite"
    static let htmlKit: Self = "HTMLKit"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
    static var htmlTheme: Self { .target(name: .htmlTheme) }
    static var htmlComponents: Self { .target(name: .htmlComponents) }
    static var htmlMarkdown: Self { .target(name: .htmlMarkdown) }
    static var htmlEmail: Self { .target(name: .htmlEmail) }
    static var htmlWebsite: Self { .target(name: .htmlWebsite) }
}

extension Target.Dependency {
    static var htmlTypesFoundation: Self { .product(name: "HTML Standard", package: "swift-html-standard") }
    static var pointFreeHtmlTestSupport: Self { .product(name: "PointFreeHTMLTestSupport", package: "pointfree-html") }
    static var htmlCssPointFreeHTML: Self { .product(name: "HTMLCSSPointFreeHTML", package: "swift-html-css-pointfree") }
    static var stringBuilder: Self { .product(name: "StringBuilder", package: "swift-builders") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var swiftMarkdown: Self { .product(name: "Markdown", package: "swift-markdown") }
    static var markdownBuilder: Self { .product(name: "MarkdownBuilder", package: "swift-builders") }
    static var orderedCollections: Self { .product(name: "OrderedCollections", package: "swift-collections") }
    static var translating: Self { .product(name: "Translating", package: "swift-translating") }
    static var builders: Self { .product(name: "Builders", package: "swift-builders") }
    static var svg: Self { .product(name: "SVG", package: "swift-svg") }
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
        // Individual targets
        .library(name: .html, targets: [.html]),
        .library(name: .htmlTheme, targets: [.htmlTheme]),
        .library(name: .htmlComponents, targets: [.htmlComponents]),
        .library(name: .htmlMarkdown, targets: [.htmlMarkdown]),
        .library(name: .htmlEmail, targets: [.htmlEmail]),
        .library(name: .htmlWebsite, targets: [.htmlWebsite]),
        
        // Convenience product with common features
        .library(name: .htmlKit, targets: [.html, .htmlTheme, .htmlComponents])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html-css-pointfree", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-html-standard", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-svg", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/pointfree-html", from: "2.0.0"),
        .package(url: "https://github.com/coenttb/swift-builders", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-translating", from: "0.0.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.2"),
        .package(url: "https://github.com/swiftlang/swift-markdown", from: "0.4.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.2")
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlCssPointFreeHTML,
                .htmlTypesFoundation,
                .stringBuilder,
                .dependencies,
                .orderedCollections,
                .builders,
                .svg
            ]
        ),
        .target(
            name: .htmlTheme,
            dependencies: [
                .html,
                .dependencies
            ]
        ),
        .target(
            name: .htmlWebsite,
            dependencies: [
                .html,
                .htmlComponents,
                .htmlMarkdown,
                .htmlTheme,
                .dependencies,
                .translating
            ]
        ),
        .target(
            name: .htmlComponents,
            dependencies: [
                .html,
                .htmlTheme,
                .dependencies,
                .orderedCollections
            ]
        ),
        .target(
            name: .htmlMarkdown,
            dependencies: [
                .html,
                .htmlTheme,
                .swiftMarkdown,
                .markdownBuilder,
                .dependencies,
                .orderedCollections
            ]
        ),
        .target(
            name: .htmlEmail,
            dependencies: [
                .html,
                .htmlTheme,
                .htmlComponents,
                .htmlMarkdown,
                .dependencies,
                .orderedCollections,
                .translating
            ]
        ),
        .testTarget(
            name: .html.tests,
            dependencies: [
                .html,
                .pointFreeHtmlTestSupport
            ]
        ),
        .testTarget(
            name: .htmlTheme.tests,
            dependencies: [
                .htmlTheme,
                .pointFreeHtmlTestSupport
            ]
        ),
        .testTarget(
            name: .htmlComponents.tests,
            dependencies: [
                .htmlComponents,
                .pointFreeHtmlTestSupport
            ]
        ),
        .testTarget(
            name: .htmlMarkdown.tests,
            dependencies: [
                .htmlMarkdown,
                .pointFreeHtmlTestSupport
            ]
        ),
        .testTarget(
            name: .htmlEmail.tests,
            dependencies: [
                .htmlEmail,
                .pointFreeHtmlTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("StrictUnsafe"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
//    .unsafeFlags(["-warnings-as-errors"]),
]

for index in package.targets.indices {
    package.targets[index].swiftSettings = (package.targets[index].swiftSettings ?? []) + swiftSettings
}
