// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let html: Self = "HTML"
    static let htmlCore: Self = "PointFreeHtml"
}

extension Target.Dependency {
    static var htmlCore: Self { .target(name: .htmlCore) }
    static var html: Self { .target(name: .html) }
}

extension Target.Dependency {
    static var css: Self { .product(name: "CSS", package: "swift-css") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var orderedCollections: Self { .product(name: "OrderedCollections", package: "swift-collections") }
    static var percent: Self { .product(name: "Percent", package: "swift-percent") }
}

extension [Package.Dependency] {
    static var `default`: Self {
        [
            .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.2"),
            .package(url: "https://github.com/coenttb/swift-css.git", branch: "main"),
            .package(url: "https://github.com/coenttb/swift-percent.git", branch: "main"),
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
            platforms: [
                .iOS(.v17),
                .macOS(.v14),
                .tvOS(.v17),
                .watchOS(.v10),
              ],
            products: [
                [
                    .library(name: .html, targets: [.html]),
                    .library(name: .htmlCore, targets: [.htmlCore]),
                ]
            ].flatMap { $0
            },
            dependencies: .default,
            targets: [
                targets.map { target in
                    Target.target(
                        name: "\(target.name)",
                        dependencies: [] + target.dependencies
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
            name: .html,
            library: true,
            dependencies: [
                .htmlCore,
                .css
            ]
        ),
        .init(
            name: .htmlCore,
            library: true,
            dependencies: [
                .dependencies,
                .orderedCollections,
            ]
        ),
    ]
)
