///
/// <html> HTML Document Root element.swift
/// swift-html
///
/// Represents the HTML document root element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents the HTML root element (`<html>`), which serves as the top-level element of an HTML document.
///
/// The `HtmlRoot` struct provides a type-safe way to create HTML documents with proper structure.
///
/// ## Example
///
/// ```swift
/// html {
///     head {
///         title { "Page Title" }
///     }
///     body {
///         h1 { "Hello World" }
///         p { "Welcome to my website" }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always specify the `lang` attribute to improve accessibility
/// - Include both `<head>` and `<body>` elements as children
/// - The `<html>` element should be the root of your document, preceded only by the DOCTYPE declaration
///
public struct HtmlRoot<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "html" }
   
    /// The XML namespace of the document (required for XHTML)
    public var xmlns: Xmlns?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new HTML root element with the specified attributes.
    ///
    /// - Parameters:
    ///   - xmlns: The XML namespace (required for XHTML, optional for HTML)
    ///   - content: The content of the element, typically head and body elements
    public init(
        xmlns: String? = nil,
        content: @escaping () -> HTML
    ) {
        self.xmlns = xmlns
        self.content = content
    }
}

/// Lowercase typealias for creating HtmlRoot elements with a more HTML-like syntax.
public typealias html = HtmlRoot
