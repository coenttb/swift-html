//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2025.
//

import Foundation
import HTML_Rendering

extension String.StringInterpolation {
    public mutating func appendInterpolation(html value: some HTML.View) {
        let bytes = ContiguousArray(value)
        let htmlString: String = String(decoding: bytes, as: UTF8.self)

        // Escape characters that would break template literals
        let escapedString =
            htmlString
            .replacingOccurrences(of: "\\", with: "\\\\")  // Escape backslashes first (must be first!)
            .replacingOccurrences(of: "`", with: "\\`")  // Escape backticks
            .replacingOccurrences(of: "${", with: "\\${")  // Escape template literal expressions
            .replacingOccurrences(of: "\u{2028}", with: "\\u2028")  // Escape line separator
            .replacingOccurrences(of: "\u{2029}", with: "\\u2029")  // Escape paragraph separator

        // Wrap in backticks to create a template literal
        appendLiteral("`\(escapedString)`")
    }
}

extension String.StringInterpolation {
    public mutating func appendInterpolation(json value: some Codable) {
        let json = try! JSONEncoder().encode(value).base64EncodedString()
        appendLiteral(#"`\#(json)`"#)
    }
}
