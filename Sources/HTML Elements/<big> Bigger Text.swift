///
/// <big> Bigger Text.swift
/// swift-html
///
/// Represents the HTML <big> element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<big>` element, which renders text at a font size one level larger than surrounding text.
///
/// The `Big` struct provides a type-safe way to create HTML big elements. Note that this element is deprecated
/// in HTML standards and CSS `font-size: larger` is recommended instead.
///
/// ## Example
///
/// ```swift
/// big {
///     "This text will appear bigger"
/// }
/// ```
///
/// ## Best Practices
///
/// - Consider using CSS `font-size` property instead as `<big>` is deprecated
/// - For modern development, prefer using semantic elements with appropriate CSS styling
///
public struct Big<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "big" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Big element.
    ///
    /// - Parameter content: The content of the element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Big elements with a more HTML-like syntax.
public typealias big = Big
