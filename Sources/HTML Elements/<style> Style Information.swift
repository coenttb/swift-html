///
/// <style> Style Information.swift
/// swift-html
///
/// Represents the HTML style element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML style element (`<style>`), which contains style information for a document or part of a document.
///
/// The `Style` struct provides a type-safe way to embed CSS styling directly within an HTML document.
///
/// ## Example
///
/// ```swift
/// style {
///     """
///     p {
///         color: #26b72b;
///     }
///     code {
///         font-weight: bold;
///     }
///     """
/// }
/// ```
///
/// ## Best Practices
///
/// - The `<style>` element should be included inside the `<head>` of the document.
/// - In general, it's better to put styles in external stylesheets and apply them using `<link>` elements.
/// - When using multiple `<style>` and `<link>` elements, they are applied in the order they appear in the document.
/// - You can use the `media` attribute to apply styles conditionally based on media queries.
///
public struct Style: Element {
    /// The HTML tag name
    public static var tag: String { "style" }
    
    /// Defines which media the style should be applied to. Its value is a media query, which defaults to "all" if the attribute is missing.
    public var media: HTML_Attributes.Media?
    
    /// Explicitly indicates that certain operations should be blocked on the fetching of critical subresources.
    public var blocking: HTML_Attributes.Blocking?
    
    /// A cryptographic nonce (number used once) used to allow inline styles in a style-src Content-Security-Policy.
    public var nonce: HTML_Attributes.Nonce?
    
    /// Specifies alternative style sheet sets.
    public var title: HTML_Attributes.Title?
    
    /// Creates a new Style element with the specified attributes.
    ///
    /// - Parameters:
    ///   - media: Defines which media the style should be applied to
    ///   - blocking: Indicates operations to be blocked on fetching critical subresources
    ///   - nonce: A cryptographic nonce for Content-Security-Policy
    ///   - title: Specifies alternative style sheet sets
    public init(
        media: HTML_Attributes.Media? = nil,
        blocking: HTML_Attributes.Blocking? = nil,
        nonce: HTML_Attributes.Nonce? = nil,
        title: HTML_Attributes.Title? = nil
    ) {
        self.media = media
        self.blocking = blocking
        self.nonce = nonce
        self.title = title
    }
}

/// Lowercase typealias for creating Style elements with a more HTML-like syntax.
public typealias style = Style
