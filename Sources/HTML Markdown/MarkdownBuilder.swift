//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/08/2024.
//

import Foundation

extension HTMLMarkdown {
    public init(
        @MarkdownBuilder _ markdown: () -> String,
        previewOnly: Bool = false
    ) {
        self = .init(markdown(), previewOnly: previewOnly)
    }
}


@resultBuilder
public enum MarkdownBuilder {
    public static func buildArray(_ components: [[String]]) -> [String] {
        return components.flatMap { $0 }
    }

    public static func buildBlock() -> [String] {
        return []
    }

    public static func buildBlock(_ components: String...) -> [String] {
        return components
    }

    public static func buildBlock(_ components: [String]...) -> [String] {
        return components.flatMap { $0 }
    }

    public static func buildEither(first component: [String]) -> [String] {
        return component
    }

    public static func buildEither(second component: [String]) -> [String] {
        return component
    }

    public static func buildExpression(_ expression: String) -> [String] {
        return [expression]
    }

    public static func buildExpression(_ expression: [String]) -> [String] {
        return expression
    }

    public static func buildOptional(_ component: [String]?) -> [String] {
        return component ?? []
    }

    public static func buildFinalResult(_ component: [String]) -> String {
        return component.joined(separator: "\n\n")
    }
}
