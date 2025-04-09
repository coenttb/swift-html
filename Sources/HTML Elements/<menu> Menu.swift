//
// <menu> Menu.swift
// swift-html
//
// Represents the HTML menu element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

/// Represents an HTML `<menu>` element, which is a semantic alternative to `<ul>` for representing a list of commands/tools.
///
/// The `Menu` struct provides a type-safe way to create HTML menu elements that represent toolbars or interactive lists
/// of commands that the user can perform or activate.
///
/// ## Example
///
/// ```swift
/// menu {
///     li {
///         button { "Copy" }
///     }
///     li {
///         button { "Cut" }
///     }
///     li {
///         button { "Paste" }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<menu>` when displaying a toolbar containing commands
/// - While semantically different, browsers currently treat `<menu>` the same as `<ul>`
/// - Include `<li>` elements as direct children of `<menu>`
/// - For styling, you may want to apply `list-style-type: none` and adjust the display property
///
public struct Menu: Element {
    /// The HTML tag name
    public static var tag: String { "menu" }
    
    /// Creates a new Menu element with the specified content.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Menu elements with a more HTML-like syntax.
public typealias menu = Menu
