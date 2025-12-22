// swift-tools-version:6.2

import PackageDescription

extension String {
    static let html: Self = "HTML"
}

extension Target.Dependency {
    static var html: Self { .target(name: .html) }
}

extension Target.Dependency {
    static var htmlRendering: Self { .product(name: "HTML Rendering", package: "swift-html-rendering") }
    static var htmlRenderableTestSupport: Self { .product(name: "HTML Rendering TestSupport", package: "swift-html-rendering") }
    static var markdownHtmlRendering: Self { .product(name: "Markdown HTML Rendering", package: "swift-markdown-html-rendering") }
    static var css: Self { .product(name: "CSS", package: "swift-css") }
    static var cssTheming: Self { .product(name: "CSS Theming", package: "swift-css") }
    static var translating: Self { .product(name: "Translating", package: "swift-translating") }
    static var standards: Self { .product(name: "Standards", package: "swift-standards") }
    static var layout: Self { .product(name: "Layout", package: "swift-standards") }
    static var colorStandard: Self { .product(name: "Color Standard", package: "swift-color-standard") }
    static var cssStandard: Self { .product(name: "CSS Standard", package: "swift-css-standard") }
    static var rfc4648: Self { .product(name: "RFC 4648", package: "swift-rfc-4648") }
    static var whatwgFormURLEncoded: Self { .product(name: "WHATWG Form URL Encoded", package: "swift-whatwg-url") }
    static var standardsTestSupport: Self { .product(name: "StandardsTestSupport", package: "swift-standards") }
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
        .library(name: .html, targets: [.html]),
    ],
    traits: [
        .trait(
            name: "Translating",
            description: "Include TranslatedString integration for internationalization support"
        )
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html-rendering", from: "0.1.14"),
        .package(url: "https://github.com/coenttb/swift-markdown-html-rendering", from: "0.1.2"),
        .package(url: "https://github.com/coenttb/swift-css", from: "0.6.0"),
        .package(url: "https://github.com/coenttb/swift-svg", from: "0.3.0"),
        .package(url: "https://github.com/coenttb/swift-translating", from: "0.3.0"),
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.20.0"),
        .package(url: "https://github.com/swift-standards/swift-rfc-4648", from: "0.6.0"),
        .package(url: "https://github.com/swift-standards/swift-whatwg-url", from: "0.2.5"),
        .package(url: "https://github.com/swift-standards/swift-color-standard", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-css-standard", from: "0.1.7")
    ],
    targets: [
        .target(
            name: .html,
            dependencies: [
                .htmlRendering,
                .css,
                .cssTheming,
                .cssStandard,
                .markdownHtmlRendering,
                .standards,
                .colorStandard,
                .rfc4648,
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
        .testTarget(
            name: .html.tests,
            dependencies: [
                .html,
                .htmlRenderableTestSupport,
                .standardsTestSupport,
                .layout,
                .product(
                    name: "Translating",
                    package: "swift-translating",
                    condition: .when(traits: ["Translating"])
                )
            ],
            swiftSettings: [
                .define("TRANSLATING", .when(traits: ["Translating"]))
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
