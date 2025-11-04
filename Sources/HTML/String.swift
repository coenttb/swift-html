//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 21/07/2025.
//

import Foundation

extension String {
  public init(
    _ html: some HTML,
    encoding: String.Encoding = .utf8,
    stripHTML: Bool = false
  ) throws {

    let htmlString: String = try .init(html, encoding: encoding)

    guard stripHTML == true
    else {
      self = htmlString
      return
    }
    var text = htmlString

    // Remove script and style content entirely
    text = text.replacingOccurrences(
      of: "<script[^>]*>[\\s\\S]*?</script>",
      with: "",
      options: .regularExpression
    )
    text = text.replacingOccurrences(
      of: "<style[^>]*>[\\s\\S]*?</style>",
      with: "",
      options: .regularExpression
    )

    // Convert common HTML entities
    let entities = [
      "&amp;": "&",
      "&lt;": "<",
      "&gt;": ">",
      "&quot;": "\"",
      "&apos;": "'",
      "&nbsp;": " ",
      "&#39;": "'",
      "&hellip;": "..."
    ]

    for (entity, replacement) in entities {
      text = text.replacingOccurrences(of: entity, with: replacement)
    }

    // Convert block-level elements to newlines
    let blockElements = ["div", "p", "br", "h[1-6]", "li", "tr", "td", "th"]
    for element in blockElements {
      text = text.replacingOccurrences(
        of: "</?\(element)[^>]*>",
        with: "\n",
        options: .regularExpression
      )
    }

    // Remove all remaining HTML tags
    text = text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)

    // Clean up whitespace
    text = text.replacingOccurrences(of: "[ \t]+", with: " ", options: .regularExpression)
    text = text.replacingOccurrences(of: "\n[ \t]*\n", with: "\n\n", options: .regularExpression)
    text = text.replacingOccurrences(of: "\n{3,}", with: "\n\n", options: .regularExpression)

    self = text.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
