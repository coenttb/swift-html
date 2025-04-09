///
/// <strike> Strike.swift
/// swift-html
///
/// Represents the HTML strike element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<strike>` element, which places a strikethrough (horizontal line) over text.
///
/// > **Deprecated**: This element is deprecated in HTML 4 and XHTML 1, and obsoleted in the HTML Living Standard.
/// > - If semantically representing deleted content, use `<del>` instead.
/// > - In all other cases, use `<s>` element.
///
/// ## Example
///
/// ```swift
/// strike {
///     "Today's Special: Salmon"
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using this element in new code as it is deprecated.
/// - Use `<s>` for content that is no longer relevant or accurate.
/// - Use `<del>` for content that has been deleted from a document.
/// - Consider using CSS `text-decoration: line-through` for styling purposes instead.
///
public struct Strike: Element {
    /// The HTML tag name
    public static var tag: String { "strike" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Strike element.
    ///
    /// - Parameter content: The content of the element
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Strike elements with a more HTML-like syntax.
public typealias strike = Strike

