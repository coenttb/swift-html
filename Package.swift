// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let css: Self = "CSS"
    static let htmlPointFree: Self = "HTML PointFree"
    static let web: Self = "HTML Web"
    static let webPointFree: Self = "HTML Web PointFree"
}

extension Target.Dependency {
   
  static var css: Self { .target(name: .css) }
  static var html: Self { .target(name: .html) }
  static var htmlPointFree: Self { .target(name: .htmlPointFree) }
  static var web: Self { .target(name: .web) }
  static var webPointFree: Self { .target(name: .webPointFree) }
}

extension Target.Dependency {
  static var markdown: Self { .product(name: "Markdown", package: "swift-markdown") }
  static var concurrencyExtras: Self { .product(name: "ConcurrencyExtras", package: "swift-concurrency-extras") }
  static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
  static var orderedCollections: Self { .product(name: "OrderedCollections", package: "swift-collections") }
}

extension [Target.Dependency] {
  static var shared: Self {
    [
        .dependencies
    ]
  }
}

extension [Package.Dependency] {
    static let `default`: Self = [
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.2"),
        .package(url: "https://github.com/apple/swift-markdown", from: "0.4.0"),
        .package(url: "https://github.com/pointfreeco/swift-concurrency-extras.git", from: "1.1.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.3.5"),
    ]
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
                targets.filter{ $0.library }.map(\.name).map { target in
                    Product.library(
                        name: "\(target)",
                        targets: ["\(target)"]
                    )
                }
            ].flatMap { $0 },
            dependencies: .default,
            targets: [
                targets.map { target in
                    Target.target(
                        name: "\(target.name)",
                        dependencies: .shared + [] + target.dependencies,
                        resources: target.name == .web ? [.process("Resources")] : []
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
                .markdown,
                .css
            ]
        ),
        .init(
            name: .htmlPointFree,
            library: true,
            dependencies: [
                .html,
                .dependencies,
                .concurrencyExtras,
                .markdown,
                .css
            ]
        ),
        .init(
            name: .web,
            library: true,
            dependencies: [
                .html,
                .css
            ]
        ),
        .init(
            name: .webPointFree,
            library: true,
            dependencies: [
                .html,
                .css,
                .web,
                .htmlPointFree
            ]
        )
    ]
)
