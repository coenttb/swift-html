//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 07/10/2024.
//

import Foundation

@resultBuilder
public enum StringBuilder {
    public static func buildPartialBlock(first: String) -> String {
        first
    }
    public static func buildPartialBlock(accumulated: String, next: String) -> String {
        accumulated + "\n" + next
    }
    public static func buildEither(first component: String) -> String {
        component
    }
    public static func buildEither(second component: String) -> String {
        component
    }
    public static func buildOptional(_ component: String?) -> String {
        component ?? ""
    }
    public static func buildArray(_ components: [String]) -> String {
        components.joined(separator: "\n")
    }
}
