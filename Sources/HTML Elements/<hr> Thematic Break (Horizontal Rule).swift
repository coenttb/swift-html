///
/// <hr> Thematic Break (Horizontal Rule).swift
/// swift-html
///
/// Represents the HTML horizontal rule element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML horizontal rule element (`<hr>`), which defines a thematic break between paragraph-level elements.
///
/// The `ThematicBreak` struct provides a type-safe way to create HTML thematic breaks.
///
/// The `<hr>` element is often displayed as a horizontal line but is semantically defined
/// as a thematic break - for example, a change of scene in a story or a shift of topic within a section.
///
/// ## Example
///
/// ```swift
/// hr() // Creates a horizontal rule
/// ```
///
/// ## Best Practices
///
/// - Use the `<hr>` element to represent a thematic change in content, not just for visual decoration
/// - Use CSS for styling rather than deprecated HTML attributes
/// - For purely decorative horizontal lines, consider using CSS on other elements instead
///
public struct ThematicBreak: Element {
    /// The HTML tag name
    public static var tag: String { "hr" }
    
    /// Creates a new ThematicBreak element.
    public init() {}
}

/// Lowercase typealias for creating ThematicBreak elements with a more HTML-like syntax.
public typealias hr = ThematicBreak