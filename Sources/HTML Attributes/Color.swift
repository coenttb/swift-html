///
/// Color.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Deprecated attribute that sets the text color using either a named color or a color specified in the hexadecimal #RRGGBB format.
///
/// ## Usage Notes
///
/// - This attribute is deprecated, use CSS color properties instead
/// - Can accept named colors or hexadecimal values
///
/// ## Examples
///
/// ```html
/// <font color="#FF0000">Red text</font>
/// <font color="blue">Blue text</font>
/// ```
public struct Color: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "color"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
}

extension Color: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Color: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}