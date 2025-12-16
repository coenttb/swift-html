// swift-tools-version:6.2

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let htmlTheme: Self = "HTMLTheme"
    static let htmlComponents: Self = "HTMLComponents"
    static let htmlKit: Self = "HTMLKit"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
    static var htmlTheme: Self { .target(name: .htmlTheme) }
    static var htmlComponents: Self { .target(name: .htmlComponents) }
}

extension Target.Dependency {
    static var htmlStandard: Self { .product(name: "HTML Standard", package: "swift-html-standard") }
    static var htmlRendering: Self { .product(name: "HTML Rendering", package: "swift-html-rendering") }
    static var htmlRenderableTestSupport: Self { .product(name: "HTML Rendering TestSupport", package: "swift-html-rendering") }
    static var css: Self { .product(name: "CSS", package: "swift-css") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
    static var orderedCollections: Self { .product(name: "OrderedCollections", package: "swift-collections") }
    static var translating: Self { .product(name: "Translating", package: "swift-translating") }
    static var standards: Self { .product(name: "Standards", package: "swift-standards") }
    static var incits4_1986: Self { .product(name: "INCITS 4 1986", package: "swift-incits-4-1986") }
    static var rfc4648: Self { .product(name: "RFC 4648", package: "swift-rfc-4648") }
    static var iso9899: Self { .product(name: "ISO 9899", package: "swift-iso-9899") }
    static var whatwgFormURLEncoded: Self { .product(name: "WHATWG Form URL Encoded", package: "swift-whatwg-url") }
}

let package = Package(
    name: "swift-html",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .macCatalyst(.v26)
    ],
    products: [
        // Individual targets
        .library(name: .html, targets: [.html]),
        .library(name: .htmlTheme, targets: [.htmlTheme]),
        .library(name: .htmlComponents, targets: [.htmlComponents]),
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
        .package(url: "https://github.com/coenttb/swift-html-rendering", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-css", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-svg", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-translating", from: "0.0.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.2"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.2"),
        .package(url: "https://github.com/swift-standards/swift-html-standard", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.14.1"),
        .package(url: "https://github.com/swift-standards/swift-incits-4-1986", from: "0.0.1"),
        .package(url: "https://github.com/swift-standards/swift-rfc-4648", from: "0.0.1"),
        .package(url: "https://github.com/swift-standards/swift-iso-9899", from: "0.0.1"),
        .package(url: "https://github.com/swift-standards/swift-whatwg-url", from: "0.0.1")
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlRendering,
                .css,
                .htmlStandard,
                .dependencies,
                .orderedCollections,
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
    var foundation: Self { self + " Foundation" }
}

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings = existing + [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
    ]
}
