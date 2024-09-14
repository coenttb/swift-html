//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import Foundation
import CSS

extension Font {
    public enum Property: Sendable {
        case family([String]?)
        case size(Font.Size?)
        case weight(Font.Weight?)
        case style(Font.Style?)
        case variant(Font.Variant?)
        case lineHeight(CSS.LineHeight?)
        case stretch(CSS.Font.Stretch?)
        
        public static func size(_ length: Length?) -> Self {
            return .size(.length(length))
        }
        
        public static func lineHeight(_ length: Length?) -> Self {
            return .lineHeight(.length(length))
        }
    }
}
