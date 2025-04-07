///
/// <col> Table Column.swift
/// swift-html
///
/// Represents the HTML table column element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table column element (`<col>`), which defines properties for one or more columns 
/// in a table.
///
/// The `TableColumn` struct provides a type-safe way to create HTML column elements. The `<col>` 
/// element is used within a `<colgroup>` element to define properties like styling for specific 
/// columns in a table.
///
/// ## Example
///
/// ```swift
/// table {
///   caption {
///     "Superheros and sidekicks"
///   }
///   colgroup {
///     col()
///     col(span: 2, class: "batman")
///     col(span: 2, class: "flash")
///   }
///   // Table rows would follow here
/// }
/// ```
///
/// ## Usage Notes
///
/// - The `<col>` element is a void element (has no content)
/// - Must be used as a child of a `<colgroup>` element that has no span attribute
/// - Primarily used to apply styles to entire columns in a table
/// - Limited CSS properties have an effect: background, border, visibility, and width
///
/// ## Best Practices
///
/// - Use the span attribute to efficiently apply properties to multiple columns
/// - Use semantic class names that describe the column's purpose
/// - For complex tables, consider adding column spans to improve readability
///
/// - Note: When rendered, this generates an HTML `<col>` element with no closing tag.
public struct TableColumn: Element {
    /// The HTML tag name
    public static var tag: String { "col" }
    
    /// The number of consecutive columns this column element spans
    public var span: HTML_Attributes.Span?
    
    /// Creates a new TableColumn element with optional span and width attributes.
    ///
    /// The TableColumn element is a void element (has no content) that defines styling
    /// and behavior for one or more columns in a table.
    ///
    /// - Parameters:
    ///   - span: The number of consecutive columns this `<col>` element spans
    public init(
        span: HTML_Attributes.Span? = nil
    ) {
        self.span = span
    }
}

/// Lowercase typealias for creating TableColumn elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `col` identifier when creating
/// HTML column elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// col(span: 2)
/// ```
public typealias col = TableColumn
