///
/// <colgroup> Table Column Group.swift
/// swift-html
///
/// Represents the HTML table column group element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table column group element (`<colgroup>`), which defines a group of columns 
/// within a table.
///
/// The `TableColumnGroup` struct provides a type-safe way to create HTML column group elements. 
/// The `<colgroup>` element is used to apply properties to entire groups of columns in a table.
///
/// ## Example
///
/// ```swift
/// // With span attribute (no col elements inside):
/// table {
///   caption {
///     "Personal weekly activities"
///   }
///   colgroup(span: 5, class: "weekdays") 
///   colgroup(span: 2, class: "weekend")
///   // Table rows would follow here
/// }
///
/// // With col elements inside (no span attribute):
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
/// - The `<colgroup>` element should appear within a `<table>`, after any `<caption>` element,
///   but before any `<thead>`, `<tbody>`, `<tfoot>`, and `<tr>` elements
/// - If a `span` attribute is present, the `<colgroup>` cannot contain any `<col>` elements
/// - If no `span` attribute is present, the `<colgroup>` can contain zero or more `<col>` elements
/// - Limited CSS properties have an effect: background, border, visibility, and width
///
/// ## Best Practices
///
/// - Use column groups to apply consistent styling to multiple columns at once
/// - For complex tables, use meaningful class names for your column groups
/// - Consider using `<colgroup>` with `<col>` elements for more granular control 
///   of individual columns
///
/// - Note: When rendered, this generates an HTML `<colgroup>` element containing column definitions.
public struct TableColumnGroup: Element {
    /// The HTML tag name
    public static var tag: String { "colgroup" }
    
    /// The number of consecutive columns this column group spans
    /// Note: Cannot be used if the column group contains col elements
    public var span: HTML_Attributes.Span?
    
    /// The content of the column group, typically col elements
    public let content: () -> HTML
    
    /// Creates a new TableColumnGroup element with an optional span attribute and content.
    ///
    /// - Parameters:
    ///   - span: The number of consecutive columns this column group spans
    ///   - content: The content of the column group, typically col elements
    ///
    /// - Note: Either use the span attribute OR include col elements as content, not both.
    ///   According to the HTML specification, if the span attribute is present, 
    ///   the colgroup element cannot contain any col elements.
    public init(
        span: HTML_Attributes.Span? = nil,
         = { fatalError("Content not provided for TableColumnGroup") }
    ) {
        self.span = span
        
    }
}

/// Lowercase typealias for creating TableColumnGroup elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `colgroup` identifier when creating
/// HTML column group elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// colgroup(span: 5, class: "weekdays")
/// ```
/// Or:
/// ```swift
/// colgroup {
///   col()
///   col(span: 2)
/// }
/// ```
public typealias colgroup = TableColumnGroup
