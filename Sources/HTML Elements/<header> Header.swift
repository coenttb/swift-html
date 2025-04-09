///
/// <header> Header.swift
/// swift-html
///
/// Represents the HTML header element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML header element (`<header>`), which represents introductory content, typically 
/// a group of introductory or navigational aids.
///
/// A header typically contains heading elements but may also include a logo, search form, author name, 
/// and other elements.
///
/// ## Example
///
/// ```swift
/// header {
///     h1 { "Main Page Title" }
///     img(src: "logo.png", alt: "Company Logo")
/// }
/// ```
///
/// ## Accessibility
///
/// - The `<header>` element defines a `banner` landmark when its context is the `<body>` element.
/// - It is not considered a banner landmark when it is a descendant of an `<article>`, `<aside>`, 
///   `<main>`, `<nav>`, or `<section>` element.
///
/// ## Best Practices
///
/// - Use `<header>` for introductory content at the beginning of a section or page
/// - A page can have multiple `<header>` elements for different sections
/// - Do not nest a `<header>` inside an `<address>`, `<footer>` or another `<header>` element
/// - The `<header>` element should not contain another `<header>` or a `<footer>` element
///
public struct Header: Element {
    /// The HTML tag name
    public static var tag: String { "header" }
    
    /// Creates a new Header element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Header elements with a more HTML-like syntax.
public typealias header = Header
