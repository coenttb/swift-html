///
/// <dl> Description List.swift
/// swift-html
///
/// Represents the HTML Description List element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents an HTML Description List (`<dl>`) element, which encloses a list of groups of terms
/// and descriptions.
///
/// The `<dl>` element contains term (`<dt>`) elements followed by description (`<dd>`) elements.
/// Common uses for this element are to implement a glossary or to display metadata (a list of key-value pairs).
///
/// ## Example
///
/// ```swift
/// dl {
///     dt { "Beast of Bodmin" }
///     dd { "A large feline inhabiting Bodmin Moor." }
///     dt { "Morgawr" }
///     dd { "A sea serpent." }
/// }
/// ```
///
/// ## Usage Patterns
///
/// - **Single term and description**: A single `<dt>` followed by a single `<dd>`
/// - **Multiple terms, single description**: Multiple `<dt>` elements followed by a single `<dd>`
/// - **Single term, multiple descriptions**: A single `<dt>` followed by multiple `<dd>` elements
/// - **Metadata display**: Key-value pairs where terms act as keys and descriptions as values
///
/// ## Accessibility Considerations
///
/// - Screen readers expose `<dl>` content differently, including total count, terms/definitions context, and navigation methods
/// - VoiceOver in iOS 14+ announces `<dl>` content as a list when navigating with the virtual cursor
/// - Be careful applying ARIA "term" and "definition" roles to `<dl>` constructs as screen readers may adjust how they are announced
///
/// ## Best Practices
///
/// - Do not use this element merely to create indentation on a page
/// - Use for meaningful relationships between terms and their descriptions
/// - Consider using for metadata display where a clear key-value relationship exists
/// - In HTML5, each term-description group can also be wrapped in a `<div>` for styling or microdata purposes
public struct DescriptionList: Element {
    /// The HTML tag name
    public static var tag: String { "dl" }
    
    /// Creates a new Description List element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Description List elements with a more HTML-like syntax.
public typealias dl = DescriptionList
