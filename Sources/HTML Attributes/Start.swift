///
/// Start.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents the HTML `start` attribute for ordered lists.
///
/// The `start` attribute specifies the starting value of an ordered list.
/// Always an Arabic numeral (1, 2, 3, etc.), even when the numbering
/// type is letters or Roman numerals.
///
/// ## Examples
///
/// ```html
/// <ol start="4">
///   <li>This will be item #4</li>
///   <li>This will be item #5</li>
///   <li>This will be item #6</li>
/// </ol>
/// ```
///
/// ```html
/// <!-- For a list with type="A", starting from "D" -->
/// <ol type="A" start="4">
///   <li>This will be item D</li>
///   <li>This will be item E</li>
///   <li>This will be item F</li>
/// </ol>
/// ```
public struct Start: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "start"
    
    /// The attribute value
    private let value: Int
    
    /// Initialize with an integer value
    public init(_ value: Int) {
        self.value = value
    }
}

extension Start: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = value
    }
}

extension Start: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return String(self.value)
    }
}