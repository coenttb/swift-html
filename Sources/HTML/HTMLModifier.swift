//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/08/2025.
//

import CSS
import CSS_Standard

public struct HTMLModifier {
    let style: (inout HTML.AnyView) -> Void

    public init(_ style: @escaping (inout HTML.AnyView) -> Void) {
        self.style = style
    }

    public func callAsFunction(_ html: inout HTML.AnyView) {
        style(&html)
    }
}
