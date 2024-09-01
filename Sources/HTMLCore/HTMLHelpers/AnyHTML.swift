//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/08/2024.
//

import Foundation

public struct AnyHTML: HTML {
    let base: any HTML
    public init(_ base: any HTML) {
        self.base = base
    }
    public static func _render(_ html: AnyHTML, into printer: inout HTMLPrinter) {
        func render<T: HTML>(_ html: T) {
            T._render(html, into: &printer)
        }
        render(html.base)
    }
    public var body: Never { fatalError() }
}
