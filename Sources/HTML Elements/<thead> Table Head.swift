///
/// <thead> Table Head.swift
/// swift-html
///
/// Represents the HTML table head element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table head element (`<thead>`), which encapsulates a set of table rows
/// that comprise the head of a table with information about the table's columns.
///
/// The `TableHead` struct provides a type-safe way to create HTML table head elements that 
/// define a semantic section for column headers in a table. This is important for both 
/// accessibility and proper table rendering.
///
/// ## Example
///
/// ```swift
/// table {
///     thead {
///         tr {
///             th(scope: .col) { "Name" }
///             th(scope: .col) { "Age" }
///             th(scope: .col) { "Location" }
///         }
///     }
///     tbody {
///         tr {
///             td { "John" }
///             td { "25" }
///             td { "New York" }
///         }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always use `<thead>` in tables with a clear header section to improve semantics and accessibility
/// - Place after any `<caption>` and `<colgroup>` elements, but before `<tbody>`, `<tfoot>`, and `<tr>`
/// - Include `<th>` elements with appropriate `scope` attributes within your header rows
/// - For multi-page tables (when printing), the table head content repeats on each page
/// - Use CSS for styling rather than deprecated presentational attributes
/// - For complex tables, consider using multiple header rows within a single `<thead>` element
///
public struct TableHead: Element {
    /// The HTML tag name
    public static var tag: String { "thead" }
    
    /// Creates a new TableHead element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating TableHead elements with a more HTML-like syntax.
public typealias thead = TableHead
