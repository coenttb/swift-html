///
/// <rt> Ruby Text.swift
/// swift-html
///
/// Represents the HTML Ruby Text element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML Ruby Text element (`<rt>`), which specifies the ruby text component of a ruby annotation, 
/// providing pronunciation, translation, or transliteration information for East Asian characters.
///
/// The `RubyText` struct must always be contained within a `Ruby` element.
///
/// ## Example
///
/// ```swift
/// ruby {
///     "漢"
///     rp { "(" }
///     rt { "Kan" }
///     rp { ")" }
///     "字"
///     rp { "(" }
///     rt { "ji" }
///     rp { ")" }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always place `<rt>` elements inside a `<ruby>` container
/// - Keep ruby text concise, typically providing only pronunciation or meaning
/// - Use with `<rp>` elements to provide fallback parentheses for browsers that don't support ruby annotations
/// - For complex text layout, consider using with `<rb>` and `<rtc>` elements
///
public struct RubyText<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "rt" }

    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new RubyText element with the specified attributes.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this element
    ///   - class: The CSS classes for this element
    ///   - content: The content of the element, typically the pronunciation or meaning of the base text
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating RubyText elements with a more HTML-like syntax.
public typealias rt = RubyText
