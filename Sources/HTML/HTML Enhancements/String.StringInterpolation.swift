//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2025.
//

import HTML_Rendering

extension String.StringInterpolation {
    public mutating func appendInterpolation(html value: some HTML.View) {
        let bytes = ContiguousArray(value)
        let htmlString: String = String(decoding: bytes, as: UTF8.self)

        // Escape characters that would break template literals
        let escapedString =
            htmlString
            .replacing("\\", with: "\\\\")  // Escape backslashes first (must be first!)
            .replacing("`", with: "\\`")  // Escape backticks
            .replacing("${", with: "\\${")  // Escape template literal expressions
            .replacing("\u{2028}", with: "\\u2028")  // Escape line separator
            .replacing("\u{2029}", with: "\\u2029")  // Escape paragraph separator

        // Wrap in backticks to create a template literal
        appendLiteral("`\(escapedString)`")
    }
}
