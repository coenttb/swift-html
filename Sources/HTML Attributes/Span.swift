///
/// Span.swift
/// swift-html
///
/// Created by Claude on 07/04/2025.
///

import Foundation

/// An attribute that specifies the number of columns a `<col>` or `<colgroup>` element should span.
///
/// The `span` attribute defines the number of consecutive columns the element spans.
/// This attribute is primarily used with `<col>` and `<colgroup>` elements to define 
/// properties for a group of columns in a table.
///
/// ## Usage Notes
///
/// - Used with `<col>` and `<colgroup>` elements in tables
/// - Value must be a positive integer greater than 0
/// - Default value is 1 if not specified
/// - In `<colgroup>`, the `span` attribute specifies how many columns the group contains
/// - In `<col>`, the `span` attribute specifies how many consecutive columns should share the same properties
///
/// ## Best Practices
///
/// - Use `span` to efficiently apply styles to multiple table columns
/// - For complex layouts, consider using individual `<col>` elements for more precise control
/// - Verify the total columns spanned matches the actual table structure
///
/// ## Examples
///
/// A single column with specific properties:
/// ```html
/// <col span="1" style="background-color: #ddd;" />
/// ```
///
/// Three consecutive columns with the same properties:
/// ```html
/// <col span="3" style="background-color: yellow;" />
/// ```
///
/// Column group containing two columns:
/// ```html
/// <colgroup span="2" style="background-color: pink;">
/// ```
public struct Span: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "span"
    
    /// The span value
    private let value: Int
    
    /// Initialize with a span value, which must be a positive integer
    public init(_ value: Int) {
        precondition(value > 0, "Span value must be a positive integer")
        self.value = value
    }
}

extension Span: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self = .init(value)
    }
}

extension Span: CustomStringConvertible {
    /// Returns the string representation of the span value
    public var description: String {
        return self.value.description
    }
}
