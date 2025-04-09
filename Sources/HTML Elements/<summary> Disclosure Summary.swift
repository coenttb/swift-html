///
/// <summary> Disclosure Summary.swift
/// swift-html
///
/// Represents the HTML summary element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML summary element (`<summary>`), which specifies a summary, caption,
/// or legend for a `<details>` element's disclosure box.
///
/// The `DisclosureSummary` struct provides a type-safe way to create HTML summary elements.
/// Clicking the `<summary>` element toggles the state of the parent `<details>` element open and closed.
///
/// ## Example
///
/// ```swift
/// details {
///     summary {
///         "Overview"
///     }
///     p {
///         "This is the content that will be shown or hidden."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - A `<summary>` element may only be used as the first child of a `<details>` element.
/// - The content can be any heading content, plain text, or HTML that can be used within a paragraph.
/// - The `<summary>` element has a default role of "button" which strips all roles from child elements,
///   so avoid using semantic heading elements inside a summary for accessibility reasons.
/// - If a `<details>` element doesn't have a `<summary>` child, browsers will use a default string
///   (typically "Details") as the label.
///
/// ## Accessibility Considerations
///
/// - The content of the `<details>` element provides the accessible description for the `<summary>`.
/// - While you can include HTML elements inside a `<summary>`, be aware that the default role of "button"
///   will strip roles from child elements, which may impact screen reader users.
///
public struct DisclosureSummary: Element {
    /// The HTML tag name
    public static var tag: String { "summary" }
    
    /// Creates a new DisclosureSummary element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating DisclosureSummary elements with a more HTML-like syntax.
public typealias summary = DisclosureSummary
