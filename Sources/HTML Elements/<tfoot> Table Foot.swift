///
/// <tfoot> Table Foot.swift
/// swift-html
///
/// Represents the HTML table foot element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table foot element (`<tfoot>`), which encapsulates a set of table rows
/// that comprise the foot of a table, typically containing summary information about the table's columns.
///
/// The `TableFoot` struct provides a type-safe way to create HTML table foot elements that 
/// define a semantic section for footer rows in a table. This is important for both 
/// accessibility and proper table rendering, especially for large tables or when printing.
///
/// ## Example
///
/// ```swift
/// table {
///     thead {
///         tr {
///             th(scope: .col) { "Item" }
///             th(scope: .col) { "Price" }
///             th(scope: .col) { "Quantity" }
///             th(scope: .col) { "Total" }
///         }
///     }
///     tbody {
///         tr {
///             td { "Widget" }
///             td { "$10.00" }
///             td { "5" }
///             td { "$50.00" }
///         }
///         tr {
///             td { "Gadget" }
///             td { "$20.00" }
///             td { "3" }
///             td { "$60.00" }
///         }
///     }
///     tfoot {
///         tr {
///             th(colspan: 3, scope: .row) { "Total" }
///             td { "$110.00" }
///         }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<tfoot>` for table summaries, totals, or other concluding information
/// - Place after any `<caption>`, `<colgroup>`, `<thead>`, `<tbody>` elements
/// - For multi-page tables (when printing), the table foot content typically repeats on each page
/// - Use CSS for styling rather than deprecated presentational attributes
/// - Use `colspan` attributes when a footer cell needs to span multiple columns
/// - Consider accessibility by using `<th>` elements with appropriate `scope` attributes for footer headers
///
public struct TableFoot<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "tfoot" }
    
    /// The element's content, typically one or more `<tr>` elements containing summary information
    public let content: () -> HTML
    
    /// Creates a new TableFoot element.
    ///
    /// - Parameter content: The content of the element, typically one or more `<tr>` elements
    ///                      containing summary data or totals for the table columns
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating TableFoot elements with a more HTML-like syntax.
public typealias tfoot = TableFoot