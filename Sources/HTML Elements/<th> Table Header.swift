///
/// <th> Table Header.swift
/// swift-html
///
/// Represents the HTML table header element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table header element (`<th>`), which defines a cell as the header of a group of table cells.
///
/// The `TableHeader` struct provides a type-safe way to create HTML table header elements with various attributes
/// that help define the scope and relationship of the header cell to other cells in the table.
///
/// ## Example
///
/// ```swift
/// table {
///     tr {
///         th(scope: .col) {
///             "Name"
///         }
///         th(scope: .col) {
///             "Age"
///         }
///     }
///     tr {
///         th(scope: .row) {
///             "John"
///         }
///         td {
///             "25"
///         }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always use the `scope` attribute to explicitly define whether a header applies to a row or column
/// - For complex tables with multi-row or multi-column headers, use the `headers` attribute to associate headers
/// - Use `colspan` and `rowspan` attributes when a header spans multiple columns or rows
/// - Use semantic table structure with `<thead>`, `<tbody>`, and `<tfoot>` elements for better accessibility
/// - Avoid deprecated presentational attributes; use CSS for styling instead
///
public struct TableHeader: Element {
    /// The HTML tag name
    public static var tag: String { "th" }
    
    /// A short, abbreviated description of the header cell's content
    public var abbr: String?
    
    /// Number of columns this header cell spans
    public var colspan: Int?
    
    /// Space-separated list of IDs of other header cells that provide headers for this cell
    public var headers: String?
    
    /// Number of rows this header cell spans
    public var rowspan: Int?
    
    /// Defines which cells this header relates to (row, col, rowgroup, colgroup)
    public var scope: Scope?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new TableHeader element with the specified attributes.
    ///
    /// - Parameters:
    ///   - abbr: A short description of the cell's content, useful for screen readers
    ///   - colspan: Number of columns this cell spans (default is 1)
    ///   - headers: IDs of related header cells
    ///   - rowspan: Number of rows this cell spans (default is 1)
    ///   - scope: Defines which cells this header relates to
    ///   - content: The content of the element
    public init(
        abbr: String? = nil,
        colspan: Int? = nil,
        headers: String? = nil,
        rowspan: Int? = nil,
        scope: Scope? = nil,
        
    ) {
        self.abbr = abbr
        self.colspan = colspan
        self.headers = headers
        self.rowspan = rowspan
        self.scope = scope
        
    }
}

/// Lowercase typealias for creating TableHeader elements with a more HTML-like syntax.
public typealias th = TableHeader


