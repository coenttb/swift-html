///
/// Media.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 08/04/2025.
///

import Foundation

/// Defines which media the style or link should be applied to.
///
/// The value is a media query, which defaults to "all" if the attribute is missing.
///
/// ## Examples
///
/// ```html
/// <style media="screen and (min-width: 900px)">
///   /* CSS rules for screens with width of at least 900px */
/// </style>
/// ```
public struct Media: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "media"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
}

extension Media: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Media: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}