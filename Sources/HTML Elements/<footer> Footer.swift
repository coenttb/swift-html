///
/// <footer> Footer.swift
/// swift-html
///
/// Represents the HTML footer element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML footer element (`<footer>`), which represents a footer for its nearest 
/// ancestor sectioning content or sectioning root element.
///
/// A `<footer>` typically contains information about the author of the section, copyright data, 
/// or links to related documents.
///
/// ## Example
///
/// ```swift
/// footer {
///     p {
///         "© 2023 Example Company. All Rights Reserved."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Enclose information about the author in an `<address>` element within the footer
/// - When the nearest ancestor sectioning element is the body, the footer applies to the whole page
/// - A footer element must not be a descendant of an `<address>`, `<header>`, or another `<footer>` element
///
/// ## Accessibility
///
/// - The footer element has an implicit ARIA role of `contentinfo` (when at the page level) 
///   or `generic` (when nested within article, aside, main, nav, or section)
/// - For legacy browser support, consider adding `role="contentinfo"` explicitly
public struct Footer: Element {
    /// The HTML tag name
    public static var tag: String { "footer" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Footer element.
    ///
    /// - Parameter content: The content of the footer element
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Footer elements with a more HTML-like syntax.
public typealias footer = Footer
