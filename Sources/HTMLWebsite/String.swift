//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 03/09/2024.
//

import Foundation

extension String {
  public static func sanitizeForJavaScript(_ input: String, preserveCase: Bool = true) -> String {
    let validChars = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "_"))
    let sanitized = input.unicodeScalars.filter { validChars.contains($0) }
    var sanitizedString = String(String.UnicodeScalarView(sanitized))

    if !preserveCase {
      sanitizedString = sanitizedString.lowercased().capitalized
    }
    if sanitizedString.isEmpty || sanitizedString.first?.isLetter == false {
      sanitizedString = "js_" + sanitizedString
    }

    return sanitizedString
  }
}
