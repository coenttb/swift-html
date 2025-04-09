///
/// <head> Document Metadata (Header).swift
/// swift-html
///
/// Represents the HTML head element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML head element (`<head>`), which contains machine-readable information (metadata) about the document.
///
/// The `Head` struct provides a type-safe way to create HTML head elements that contain metadata like the document title,
/// scripts, and style sheets. There can be only one `<head>` element in an HTML document.
///
/// ## Example
///
/// ```swift
/// head {
///     title { "Document title" }
///     meta(charset: "UTF-8")
///     meta(name: "viewport", content: "width=device-width")
/// }
/// ```
///
/// ## Best Practices
///
/// - Always include a `<title>` element within the head
/// - Use appropriate meta tags for character encoding and viewport settings
/// - Include relevant stylesheets and scripts
/// - The head element primarily holds information for machine processing, not human-readability
///
/// ## Elements commonly used inside `<head>`
/// - `<title>`: Sets the document title
/// - `<base>`: Specifies the base URL for relative URLs
/// - `<link>`: Links to external resources like stylesheets
/// - `<style>`: Contains document styling information
/// - `<meta>`: Provides metadata about the document
/// - `<script>`: Contains JavaScript code or links to external scripts
/// - `<noscript>`: Provides fallback content for browsers with JavaScript disabled
/// - `<template>`: Holds client-side template content
///
public struct Head: Element {
    /// The HTML tag name
    public static var tag: String { "head" }
    
    /// Creates a new Head element with the specified content.
    public init(){}
}

/// Lowercase typealias for creating Head elements with a more HTML-like syntax.
public typealias head = Head
