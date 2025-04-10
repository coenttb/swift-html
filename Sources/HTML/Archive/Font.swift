//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import Foundation
import HTML_CSS_PointFreeHTML

extension CSSPropertyTypes.Font {
    public enum Property: Sendable {
        case family([String]?)
        case size(CSSPropertyTypes.Font.Size?)
        case weight(CSSPropertyTypes.Font.Weight?)
        case style(CSSPropertyTypes.Font.Style?)
        case variant(CSSPropertyTypes.Font.Variant?)
        case lineHeight(CSSPropertyTypes.LineHeight?)
        case stretch(CSSPropertyTypes.Font.Stretch?)
        
        public static func size(_ length: Length) -> Self {
            return .size(.length(length))
        }
        
        public static func lineHeight(_ length: Length) -> Self {
            return .lineHeight(.length(length))
        }
    }
}
