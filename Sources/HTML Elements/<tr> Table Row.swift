//
// <tr> Table Row.swift
// swift-html
//
// Represents the HTML <tr> element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML table row element (`<tr>`), which defines a row of cells in a table.
///
/// The `TableRow` struct provides a type-safe way to create HTML `<tr>` elements.
/// The row's cells are established using `<td>` (data cell) and `<th>` (header cell) elements.
///
/// ## Example
///
/// ```swift
/// table {
///     tr {
///         th(scope: .col) { "Name" }
///         th(scope: .col) { "Age" }
///         th(scope: .col) { "Location" }
///     }
///     tr {
///         td { "John Doe" }
///         td { "32" }
///         td { "New York" }
///     }
///     tr {
///         td { "Jane Smith" }
///         td { "28" }
///         td { "London" }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - The `<tr>` element is valid as a child of a `<thead>`, `<tbody>`, or `<tfoot>` element
/// - If placed directly inside a `<table>`, browsers will implicitly create a `<tbody>` parent
/// - Use `<th>` elements for header cells and `<td>` elements for data cells
/// - Use CSS selectors like `:nth-of-type`, `:first-of-type`, and `:last-of-type` to style rows
/// - Avoid deprecated attributes like `align`, `bgcolor`, `char`, `charoff`, and `valign`; use CSS instead
///
public struct TableRow<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "tr" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new TableRow element.
    ///
    /// - Parameter content: The content of the element, typically a sequence of `<td>` and/or `<th>` elements
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating TableRow elements with a more HTML-like syntax.
public typealias tr = TableRow