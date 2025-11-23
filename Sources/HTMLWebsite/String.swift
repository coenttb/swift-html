//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 03/09/2024.
//

import INCITS_4_1986

extension String {
    public static func sanitizeForJavaScript(_ input: String, preserveCase: Bool = true) -> String {
        // Filter to alphanumeric and underscore characters only
        let sanitized = input.unicodeScalars.filter { scalar in
            scalar.value < 128 && (
                INCITS_4_1986.CharacterClassification.isAlphanumeric(UInt8(scalar.value)) ||
                scalar == "_"
            )
        }
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
