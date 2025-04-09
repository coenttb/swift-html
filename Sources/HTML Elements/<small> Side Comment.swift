//
//  <small> Side Comment.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML `<small>` element, which renders side-comments and small print like copyright and legal text.
///
/// The `Small` element is used for side-comments and small print, such as copyright and legal text, independent
/// of its styled presentation. By default, browsers typically render text within this element one font-size smaller.
///
/// ## Example
///
/// ```swift
/// p {
///     "This is the first sentence."
///     small {
///         "This whole sentence is in small letters."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use for side comments, disclaimers, legal text, and copyright notices
/// - Don't use solely for styling text in a smaller font size (use CSS for that purpose)
/// - Consider whether semantic meaning or presentation is your primary goal
///
/// ## Notes
///
/// Although the `<small>` element may appear to violate the principle of separation between structure and
/// presentation (like `<b>` and `<i>`), it is valid in HTML when used for its semantic purpose rather than
/// just visual styling.
///
public struct Small<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "small" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Small element with the specified content.
    ///
    /// - Parameter content: The content of the element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Small elements with a more HTML-like syntax.
public typealias small = Small