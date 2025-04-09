///
/// <noembed> Embed Fallback.swift
/// swift-html
///
/// Represents the HTML noembed element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<noembed>` element, which provides fallback content for browsers that do not support the `<embed>` element.
///
/// The `EmbedFallback` struct provides a way to create HTML fallback content for embedded media.
///
/// > Important: This element is deprecated in HTML and should not be used in new projects.
/// > Use `<object>` instead, with fallback content between the opening and closing tags.
///
/// ## Example
///
/// ```swift
/// noembed {
///     "Alternative content for browsers that don't support embed"
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using this element in new code as it is deprecated
/// - Use `<object>` with fallback content instead
/// - Provide descriptive alternative content that explains what would be shown
///
public struct EmbedFallback: Element {
    /// The HTML tag name
    public static var tag: String { "noembed" }
    
    /// Creates a new EmbedFallback element with the specified content.
    @available(*, deprecated, message: "The <noembed> element is deprecated in HTML standards. Use <object> with fallback content instead.")
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating EmbedFallback elements with a more HTML-like syntax.
public typealias noembed = EmbedFallback
