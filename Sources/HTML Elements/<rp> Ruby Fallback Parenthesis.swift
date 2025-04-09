///
/// <rp> Ruby Fallback Parenthesis.swift
/// swift-html
///
/// Represents the HTML Ruby Fallback Parenthesis element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML Ruby Fallback Parenthesis element (`<rp>`), which provides fallback parentheses
/// for browsers that do not support display of ruby annotations.
///
/// The `RubyParenthesis` element should be used to enclose opening and closing parentheses around
/// `<rt>` elements that contain annotation text.
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
/// - Always place `<rp>` elements immediately before or after `<rt>` elements
/// - Use one `<rp>` for opening parenthesis and one for closing parenthesis
/// - Include both opening and closing parentheses for better fallback appearance
/// - Only use within a `<ruby>` element
///
public struct RubyParenthesis: Element {
    /// The HTML tag name
    public static var tag: String { "rp" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new RubyParenthesis element with the specified attributes.
    ///
    /// - Parameters:
    ///   - content: The content of the element, typically "(" or ")" for fallback display
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating RubyParenthesis elements with a more HTML-like syntax.
public typealias rp = RubyParenthesis
