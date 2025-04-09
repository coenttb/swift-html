///
/// ListType.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents the HTML `type` attribute for ordered lists.
///
/// The `type` attribute specifies the numbering type for an ordered list.
///
/// ## Examples
///
/// ```html
/// <ol type="i">
///   <li>First item</li>
///   <li>Second item</li>
///   <li>Third item</li>
/// </ol>
/// ```
public struct ListType: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "type"
    
    /// Enumeration of valid list types
    public enum Value: String {
        /// Lowercase letters (a, b, c, ...)
        case lowerAlpha = "a"
        
        /// Uppercase letters (A, B, C, ...)
        case upperAlpha = "A"
        
        /// Lowercase Roman numerals (i, ii, iii, ...)
        case lowerRoman = "i"
        
        /// Uppercase Roman numerals (I, II, III, ...)
        case upperRoman = "I"
        
        /// Numbers (1, 2, 3, ...) - default
        case decimal = "1"
    }
    
    /// The attribute value
    private let value: Value
    
    /// Initialize with a Value
    public init(_ value: Value) {
        self.value = value
    }
    
    /// Initialize with a string literal
    public init(_ value: String) {
        switch value {
        case "a":
            self.value = .lowerAlpha
        case "A":
            self.value = .upperAlpha
        case "i":
            self.value = .lowerRoman
        case "I":
            self.value = .upperRoman
        case "1":
            self.value = .decimal
        default:
            self.value = .decimal
        }
    }
}

extension ListType: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension ListType: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return value.rawValue
    }
}