// swift-tools-version:6.2

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let htmlTheme: Self = "HTMLTheme"
    static let htmlComponents: Self = "HTMLComponents"
    static let htmlWebsite: Self = "HTMLWebsite"
    static let htmlKit: Self = "HTMLKit"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
    static var htmlTheme: Self { .target(name: .htmlTheme) }
    static var htmlComponents: Self { .target(name: .htmlComponents) }
    static var htmlWebsite: Self { .target(name: .htmlWebsite) }
}

extension Target.Dependency {
    static var htmlTypesFoundation: Self { .product(name: "HTML Standard", package: "swift-html-standard") }
    static var htmlRendering: Self { .product(name: "HTML Rendering", package: "swift-html-rendering") }
    static var htmlRenderableTestSupport: Self { .product(name: "HTML Renderable TestSupport", package: "swift-html-rendering") }
    static var cssRendering: Self { .product(name: "CSS Rendering", package: "swift-css-rendering") }
    static var stringBuilder: Self { .product(name: "StringBuilder", package: "swift-builders") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
    static var orderedCollections: Self { .product(name: "OrderedCollections", package: "swift-collections") }
    static var translating: Self { .product(name: "Translating", package: "swift-translating") }
    static var builders: Self { .product(name: "Builders", package: "swift-builders") }
    static var standards: Self { .product(name: "Standards", package: "swift-standards") }
    static var incits4_1986: Self { .product(name: "INCITS 4 1986", package: "swift-incits-4-1986") }
    static var rfc4648: Self { .product(name: "RFC 4648", package: "swift-rfc-4648") }
    static var iso9899: Self { .product(name: "ISO 9899", package: "swift-iso-9899") }
    static var whatwgFormURLEncoded: Self { .product(name: "WHATWG Form URL Encoded", package: "swift-whatwg-url") }
}

let package = Package(
    name: "swift-html",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .macCatalyst(.v18)
    ],
    products: [
        // Individual targets
        .library(name: .html, targets: [.html]),
        .library(name: .htmlTheme, targets: [.htmlTheme]),
        .library(name: .htmlComponents, targets: [.htmlComponents]),
        .library(name: .htmlWebsite, targets: [.htmlWebsite]),
        // Convenience product with common features
        .library(name: .htmlKit, targets: [.html, .htmlTheme, .htmlComponents])
    ],
    traits: [
        .trait(
            name: "Translating",
            description: "Include TranslatedString integration for internationalization support"
        )
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html-rendering.git", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-css-rendering.git", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-html-standard", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-svg", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-builders", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-translating", from: "0.0.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.2"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.2"),
        .package(url: "https://github.com/coenttb/swift-standards", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-incits-4-1986", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-rfc-4648", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-iso-9899", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/swift-whatwg-url", from: "0.0.1")
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlRendering,
                .cssRendering,
                .htmlTypesFoundation,
                .stringBuilder,
                .dependencies,
                .orderedCollections,
                .builders,
                .standards,
                .incits4_1986,
                .rfc4648,
                .iso9899,
                .whatwgFormURLEncoded,
                .product(name: "SVG", package: "swift-svg"),
                .product(
                    name: "Translating",
                    package: "swift-translating",
                    condition: .when(traits: ["Translating"])
                )
            ],
            swiftSettings: [
                .define("TRANSLATING", .when(traits: ["Translating"]))
            ]
        ),
        .target(
            name: .htmlTheme,
            dependencies: [
                .html,
                .dependencies,
                .standards,
                .incits4_1986
            ]
        ),
        .target(
            name: .htmlWebsite,
            dependencies: [
                .html,
                .htmlComponents,
                .htmlTheme,
                .dependencies,
                .standards,
                .incits4_1986,
                .product(
                    name: "Translating",
                    package: "swift-translating",
                    condition: .when(traits: ["Translating"])
                )
            ],
            swiftSettings: [
                .define("TRANSLATING", .when(traits: ["Translating"]))
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
        .testTarget(
            name: .html.tests,
            dependencies: [
                .html,
                .htmlRenderableTestSupport,
                .dependenciesTestSupport,
                .product(
                    name: "Translating",
                    package: "swift-translating",
                    condition: .when(traits: ["Translating"])
                )
            ],
            swiftSettings: [
                .define("TRANSLATING", .when(traits: ["Translating"]))
            ]
        ),
        .testTarget(
            name: .htmlTheme.tests,
            dependencies: [
                .htmlTheme,
                .htmlRenderableTestSupport
            ]
        ),
        .testTarget(
            name: .htmlComponents.tests,
            dependencies: [
                .htmlComponents,
                .htmlRenderableTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
