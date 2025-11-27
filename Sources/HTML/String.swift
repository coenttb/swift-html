////
////  File.swift
////  coenttb-html
////
////  Created by Coen ten Thije Boonkkamp on 21/07/2025.
////
//
//import INCITS_4_1986
//
//extension String {
//    public init(
//        _ html: some HTML.View,
//        stripHTML: Bool
//    ) throws {
//
//        let htmlString: String = try .init(html)
//
//        guard stripHTML == true
//        else {
//            self = htmlString
//            return
//        }
//        var text = htmlString
//
//        // Remove script and style content entirely using native Swift Regex
//        text = text.replacing(/<script[^>]*>[\s\S]*?<\/script>/, with: "")
//        text = text.replacing(/<style[^>]*>[\s\S]*?<\/style>/, with: "")
//
//        // Convert common HTML entities
//        let entities = [
//            "&amp;": "&",
//            "&lt;": "<",
//            "&gt;": ">",
//            "&quot;": "\"",
//            "&apos;": "'",
//            "&nbsp;": " ",
//            "&#39;": "'",
//            "&hellip;": "...",
//        ]
//
//        for (entity, replacement) in entities {
//            text = text.replacingOccurrences(of: entity, with: replacement)
//        }
//
//        // Convert block-level elements to newlines
//        let blockElements = ["div", "p", "br", "h[1-6]", "li", "tr", "td", "th"]
//        for element in blockElements {
//            let pattern = "</?\\(element)[^>]*>"
//            text = text.replacing(try! Regex(pattern), with: "\n")
//        }
//
//        // Remove all remaining HTML tags
//        text = text.replacing(/<[^>]+>/, with: "")
//
//        // Clean up whitespace
//        text = text.replacing(/[ \t]+/, with: " ")
//        text = text.replacing(/\n[ \t]*\n/, with: "\n\n")
//        text = text.replacing(/\n{3,}/, with: "\n\n")
//
//        // Trim whitespace
//        self = String(text.trimming(where: \.isWhitespace))
//    }
//}
