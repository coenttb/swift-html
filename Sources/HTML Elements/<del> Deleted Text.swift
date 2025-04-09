///
/// <del> Deleted Text.swift
/// swift-html
///
/// Represents the HTML del element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<del>` element, which marks text that has been deleted from a document.
///
/// The `Del` struct provides a type-safe way to create HTML elements that represent deleted text, 
/// which can be used when rendering "track changes" or source code diff information.
///
/// ## Example
///
/// ```swift
/// del {
///     "This text has been deleted"
/// }
/// 
/// del(cite: "https://example.com/meeting-notes.html", 
///     datetime: "2025-04-05T14:30:00") {
///     "Feature removed based on meeting decision"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use the `<del>` element to indicate text that has been removed from the document
/// - Pair with the `<ins>` element to show both deleted and inserted text for "track changes" style markup
/// - Consider accessibility implications - screen readers may not announce deleted text by default
///
/// ## Accessibility
///
/// The presence of the `del` element is not announced by most screen reading technology in its default configuration.
/// For critical content, consider using CSS with `::before` and `::after` pseudo-elements to make deletions more apparent.
///
public struct Del: Element {
    /// The HTML tag name
    public static var tag: String { "del" }
    
    /// A URI for a resource that explains the change (for example, meeting minutes).
    public var cite: HTML_Attributes.Cite?
    
    /// The time and date of the change as a valid date string with an optional time.
    public var datetime: HTML_Attributes.DateTime?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Del element to mark deleted text.
    ///
    /// - Parameters:
    ///   - cite: A URI for a resource that explains the change
    ///   - datetime: The time and date of the change
    ///   - content: The content to be marked as deleted
    public init(
        cite: HTML_Attributes.Cite? = nil,
        datetime: HTML_Attributes.DateTime? = nil,
        
    ) {
        self.cite = cite
        self.datetime = datetime
        
    }
}

/// Lowercase typealias for creating Del elements with a more HTML-like syntax.
public typealias del = Del
