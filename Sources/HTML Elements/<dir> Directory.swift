///
/// <dir> Directory.swift
/// swift-html
///
/// Represents the HTML <dir> element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML directory element (`<dir>`), which is deprecated.
///
/// The `Directory` element was historically used as a container for a directory of files and/or folders.
/// This element is deprecated and has been removed from HTML standards. Use `<ul>` instead.
///
/// ## Example
///
/// ```swift
/// dir {
///     li { "File 1" }
///     li { "File 2" }
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using this element as it is deprecated
/// - Use `<ul>` for lists, including lists of files
/// - If needed for legacy compatibility, ensure proper accessibility
///
public struct Directory<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dir" }
    
    /// Boolean attribute that hints the list should be rendered in a compact style
    public var compact: HTML_Attributes.Compact?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Directory element with the specified attributes.
    ///
    /// - Parameters:
    ///   - compact: Boolean attribute that hints the list should be rendered in a compact style
    ///   - content: The content of the element
    public init(
        compact: HTML_Attributes.Compact? = nil,
        content: @escaping () -> HTML
    ) {
        self.compact = compact
        self.content = content
    }
}

/// Lowercase typealias for creating Directory elements with a more HTML-like syntax.
public typealias dir = Directory
