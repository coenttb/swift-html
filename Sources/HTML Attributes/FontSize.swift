///
/// FontSize.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Deprecated attribute that specifies the font size as either a numeric or relative value.
///
/// Numeric values range from 1 to 7 with 1 being the smallest and 3 the default.
/// It can be defined using a relative value, like +2 or -3, which sets it relative to 3, the default value.
///
/// ## Usage Notes
///
/// - This attribute is deprecated, use CSS font-size property instead
/// - Accepts values from 1-7 or relative values like +2 or -3
///
/// ## Examples
///
/// ```html
/// <font size="5">Larger text</font>
/// <font size="+2">Relatively larger text</font>
/// ```
public struct FontSize: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "size"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a numeric value (1-7)
    public init(numericValue: Int) {
        precondition(numericValue >= 1 && numericValue <= 7, "Font size must be between 1 and 7")
        self.value = String(numericValue)
    }
    
    /// Initialize with a relative value
    public init(relativeValue: Int) {
        if relativeValue > 0 {
            self.value = "+\(relativeValue)"
        } else {
            self.value = "\(relativeValue)"
        }
    }
}

extension FontSize: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension FontSize: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(numericValue: value)
    }
}

extension FontSize: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}