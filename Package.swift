// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let css: Self = "CSS"
    static let html: Self = "HTML"
    static let markdown: Self = "HTML Markdown"
}

extension Target.Dependency {
    static var css: Self { .target(name: .css) }
    static var html: Self { .target(name: .html) }
    static var markdown: Self { .target(name: .markdown) }
}

extension Target.Dependency {
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var orderedCollections: Self { .product(name: "OrderedCollections", package: "swift-collections") }
    static var swiftMarkdown: Self { .product(name: "Markdown", package: "swift-markdown") }
}

extension [Target.Dependency] {
    static var shared: Self {
        [
            .dependencies
        ]
    }
}

extension [Package.Dependency] {
    static var `default`: Self {
        [
            .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.2"),
            .package(url: "https://github.com/swiftlang/swift-markdown.git", from: "0.4.0"),
            .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.3.5"),
        ]
    }
}

struct CustomTarget {
    let name: String
    var library: Bool = true
    var dependencies: [Target.Dependency] = []
}

extension Package {
    static func html(
        targets: [CustomTarget]
    ) -> Package {
        return Package(
            name: "swift-html",
            platforms: [.macOS(.v14), .iOS(.v17)],
            products: [
                [
                    .library(
                        name: .html,
                        targets: targets.filter{ $0.library }.map(\.name).map { target in
                            "\(target)"
                        }
                    ),
                    .library(name: "CSS", targets: ["CSS"])
                ]
            ].flatMap { $0
            },
            dependencies: .default,
            targets: [
                targets.map { target in
                    Target.target(
                        name: "\(target.name)",
                        dependencies: .shared + [] + target.dependencies
                    )
                },
                targets.map { target in
                    Target.testTarget(
                        name: "\(target.name) Tests",
                        dependencies: [.init(stringLiteral: target.name)]
                    )
                }
            ].flatMap { $0 }
        )
    }
}

let package = Package.html(
    targets: [
        .init(
            name: .css,
            library: true,
            dependencies: [
            ]
        ),
        .init(
            name: .html,
            library: true,
            dependencies: [
                .dependencies,
                .orderedCollections,
                .css,
            ]
        ),
        .init(
            name: .markdown,
            library: true,
            dependencies: [
                .dependencies,
                .orderedCollections,
                .css,
                .html,
                .swiftMarkdown
            ]
        ),
    ]
)
