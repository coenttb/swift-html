///
/// Face.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Deprecated attribute that contains a comma-separated list of one or more font names.
///
/// The document text is rendered in the first font face that the client's browser supports.
/// If no font listed is installed on the local system, the browser typically defaults to
/// the proportional or fixed-width font for that system.
///
/// ## Usage Notes
///
/// - This attribute is deprecated, use CSS font-family property instead
/// - Accepts a comma-separated list of font names
///
/// ## Examples
///
/// ```html
/// <font face="Arial, Helvetica, sans-serif">Text with specified fonts</font>
/// ```
public struct Face: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "face"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
}

extension Face: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Face: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}