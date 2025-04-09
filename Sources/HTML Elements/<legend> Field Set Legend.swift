///
/// <legend> Field Set Legend.swift
/// swift-html
///
/// Represents the HTML legend element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML legend element (`<legend>`), which represents a caption for the content of its parent `<fieldset>`.
///
/// The `Legend` struct provides a type-safe way to create HTML legend elements.
///
/// ## Example
///
/// ```swift
/// fieldset {
///     legend {
///         "Choose your favorite monster"
///     }
///     // form controls
/// }
/// ```
///
/// ## Best Practices
///
/// - Always use a legend element as the first child of a fieldset element
/// - Use legend to provide a descriptive caption for grouped form controls
/// - Keep legend text concise and informative
/// - Consider accessibility by using clear, descriptive text
///
public struct Legend: Element {
    /// The HTML tag name
    public static var tag: String { "legend" }
    
    /// Creates a new Legend element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Legend elements with a more HTML-like syntax.
public typealias legend = Legend
