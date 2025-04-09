//
// <nobr> Non-Breaking Text.swift
// swift-html
//
// Represents the HTML nobr element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML `<nobr>` element, which prevents the text it contains from automatically wrapping across multiple lines.
///
/// ## Deprecation Notice
///
/// This element is deprecated and was never standard HTML. It's recommended to use the CSS property `white-space: nowrap` instead.
///
/// ## Example
///
/// ```swift
/// nobr {
///     "Long line with no breaks"
/// }
/// ```
///
/// ## Best Practice
///
/// Instead of using this element, use CSS:
/// ```html
/// <span style="white-space: nowrap;">Long line with no breaks</span>
/// ```
///
public struct NoBr: Element {
    /// The HTML tag name
    public static var tag: String { "nobr" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new NoBr element with the specified content.
    ///
    /// - Parameter content: The content of the element
    @available(*, deprecated, message: "Although this element is widely supported, it was never standard HTML. Use CSS property `white-space: nowrap` instead.")
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating NoBr elements with a more HTML-like syntax.
public typealias nobr = NoBr

