///
/// <rb> Ruby Base.swift
/// swift-html
///
/// Represents the HTML Ruby Base element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML Ruby Base element (`<rb>`), which is used to delimit the base text component 
/// of a ruby annotation, i.e., the text that is being annotated.
///
/// The `RubyBase` element should wrap each separate atomic segment of the base text.
/// While this element is deprecated in modern HTML specifications, it is included for completeness.
///
/// ## Example
///
/// ```swift
/// ruby {
///     rb { "漢" }
///     rb { "字" }
///     rp { "(" }
///     rt { "kan" }
///     rt { "ji" }
///     rp { ")" }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<rb>` elements to explicitly separate each segment of ruby base text
/// - Include one `<rt>` element for each base segment/`<rb>` element to annotate
/// - Note that this element is deprecated; consider using plain text within the `<ruby>` element instead
/// - Only use within a `<ruby>` element
///
public struct RubyBase: Element {
    /// The HTML tag name
    public static var tag: String { "rb" }
    
    /// Creates a new RubyBase element with the specified attributes.
    ///
    /// - Parameters:, typically the base text to be annotated
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating RubyBase elements with a more HTML-like syntax.
public typealias rb = RubyBase
