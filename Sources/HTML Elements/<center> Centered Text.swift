///
/// <center> Centered Text.swift
/// swift-html
///
/// Represents the HTML center element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML center element (`<center>`), which centers text horizontally.
///
/// The `Center` struct provides a type-safe way to create centered text elements.
/// 
/// > **Deprecation Notice**: The `<center>` element is deprecated in HTML5.
/// > Use CSS `text-align: center` with `<div>` or `<p>` elements instead.
///
/// ## Example
///
/// ```swift
/// center {
///     "This text will be centered."
///     p {
///         "So will this paragraph."
///     }
/// }
/// ```
///
/// ## CSS Alternative (Recommended)
///
/// ```html
/// <div style="text-align:center">
///   This text will be centered.
///   <p>So will this paragraph.</p>
/// </div>
/// ```
///
/// ## Best Practices
///
/// - Avoid using this element in new code as it is deprecated
/// - Instead, use CSS `text-align: center` with `<div>` or `<p>` elements
/// - For centering blocks, use CSS properties like `margin-left` and `margin-right` set to `auto`
///
public struct Center: Element {
    /// The HTML tag name
    public static var tag: String { "center" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Center element.
    ///
    /// - Parameter content: The content to be centered
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Center elements with a more HTML-like syntax.
public typealias center = Center
