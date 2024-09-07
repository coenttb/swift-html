//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/09/2024.
//

import Foundation
import HTMLCore

public enum ListStyle: Equatable {
    case type(ListStyleType)
    case image(String)  // URL or data URI
    case position(ListStylePosition)
    case shorthand(type: ListStyleType?, position: ListStylePosition?, image: String?)
}

public enum ListStyleType: String, Equatable {
    // Unordered list types
    case disc, circle, square
    
    // Ordered list types
    case decimal, decimalLeadingZero = "decimal-leading-zero"
    case lowerAlpha = "lower-alpha", upperAlpha = "upper-alpha"
    case lowerRoman = "lower-roman", upperRoman = "upper-roman"
    
    // Other types
    case none
    case armenian, georgian
    case lowerLatin = "lower-latin", upperLatin = "upper-latin"
    case lowerGreek = "lower-greek"
    
    // Symbols
    case hiragana, hiraganaIroha = "hiragana-iroha"
    case katakana, katakanaIroha = "katakana-iroha"
    
    // CSS3 additions
    case cjkIdeographic = "cjk-ideographic"
    case hebrew
    
    // CSS Counter Styles
    case ethiopicNumeric = "ethiopic-numeric"
}

public enum ListStylePosition: String {
    case inside, outside
}

extension ListStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .type(let type):
            return "list-style-type: \(type.rawValue)"
        case .image(let url):
            return "list-style-image: url('\(url)')"
        case .position(let position):
            return "list-style-position: \(position.rawValue)"
        case .shorthand(let type, let position, let image):
            var parts: [String] = []
            if let type = type {
                parts.append(type.rawValue)
            }
            if let position = position {
                parts.append(position.rawValue)
            }
            if let image = image {
                parts.append("url('\(image)')")
            }
            return "list-style: \(parts.joined(separator: " "))"
        }
    }
}

extension ListStyle {
    // Convenient static properties
        public static let none = ListStyle.type(.none)
        public static let reset = none
        public static let disc = ListStyle.type(.disc)
        public static let circle = ListStyle.type(.circle)
        public static let square = ListStyle.type(.square)
        public static let decimal = ListStyle.type(.decimal)
        public static let lowerAlpha = ListStyle.type(.lowerAlpha)
        public static let upperAlpha = ListStyle.type(.upperAlpha)
        public static let lowerRoman = ListStyle.type(.lowerRoman)
        public static let upperRoman = ListStyle.type(.upperRoman)
        
        public static let inside = ListStyle.position(.inside)
        public static let outside = ListStyle.position(.outside)
        
        // Convenient static functions
        public static func custom(_ type: ListStyleType, position: ListStylePosition? = nil, image: String? = nil) -> ListStyle {
            .shorthand(type: type, position: position, image: image)
        }
        
        public static func image(_ url: String, position: ListStylePosition? = nil) -> ListStyle {
            .shorthand(type: nil, position: position, image: url)
        }
}
