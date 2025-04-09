///
/// <caption> Table Caption.swift
/// swift-html
///
/// Represents the HTML table caption element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table caption element (`<caption>`), which specifies the title or caption
/// of a table, providing the table with an accessible description.
///
/// The `Caption` struct provides a type-safe way to create HTML table caption elements.
/// The caption element must be the first child of its parent table element.
///
/// ## Example
///
/// ```swift
/// table {
///     caption {
///         "Monthly Sales Data"
///     }
///     // table rows and cells...
/// }
/// ```
///
/// ## Accessibility Benefits
///
/// - Provides a clear, concise description of the table's content
/// - Helps users who are scanning the page quickly understand the table's purpose
/// - Especially beneficial for screen reader users, allowing them to determine the table's
///   relevance without reading through multiple cells
///
/// ## Positioning
///
/// By default, most browsers display the caption at the top of the table, but this can be
/// controlled with the CSS `caption-side` property.
///
/// ## Usage Notes
///
/// - If included, the `<caption>` element must be the first child of its parent `<table>` element
/// - When a `<table>` is nested within a `<figure>` as the figure's only content, it should be captioned 
///   via a `<figcaption>` for the `<figure>` instead of as a `<caption>` nested within the `<table>`
/// - Any `background-color` applied to a table will not be applied to its caption. Add a 
///   `background-color` to the `<caption>` element as well if you want the same color to be behind both

public struct Caption: Element {
    /// The HTML tag name
    public static var tag: String { "caption" }
    
    /// Creates a new Caption element with the specified content.
    public init(){}
}

/// Lowercase typealias for creating Caption elements with a more HTML-like syntax.
public typealias caption = Caption
