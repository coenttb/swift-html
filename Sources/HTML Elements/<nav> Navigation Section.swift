///
/// <nav> Navigation Section.swift
/// swift-html
///
/// Represents the HTML navigation section element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML navigation section element (`<nav>`), which defines a section of a page that contains navigation links.
///
/// The `NavigationSection` struct provides a type-safe way to create HTML navigation sections for menus, tables of contents, indexes, and other navigation elements.
///
/// ## Example
///
/// ```swift
/// nav {
///     ul {
///         li { a(href: "/home") { "Home" } }
///         li { a(href: "/about") { "About" } }
///         li { a(href: "/contact") { "Contact" } }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use the `<nav>` element only for major blocks of navigation links
/// - A document may have several `<nav>` elements (e.g., one for site navigation and one for in-page navigation)
/// - Not all groups of links need to be in a `<nav>` element (e.g., footer links often don't need to be in a `<nav>`)
/// - For accessibility, consider using `aria-labelledby` to label navigation sections when a page has multiple navigation blocks
/// - Screen readers may use this element to determine whether to omit the initial rendering of navigation-only content
///
public struct NavigationSection: Element {
    /// The HTML tag name
    public static var tag: String { "nav" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new NavigationSection element.
    ///
    /// - Parameter content: The content of the navigation section
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating NavigationSection elements with a more HTML-like syntax.
public typealias nav = NavigationSection
