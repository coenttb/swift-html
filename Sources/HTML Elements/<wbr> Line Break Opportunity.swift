///
/// <wbr> Line Break Opportunity.swift
/// swift-html
///
/// Represents the HTML word break opportunity element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents an HTML word break opportunity element (`<wbr>`), which indicates a position within text 
/// where the browser may optionally break a line, though its line-breaking rules would not otherwise 
/// create a break at that location.
///
/// The `LineBreakOpportunity` struct provides a type-safe way to create HTML word break opportunity elements.
///
/// ## Example
///
/// ```swift
/// // Breaking a long word for better responsive layout
/// p {
///     "FernstraßenbauprivatfinanzierungsgesetzÖf".forEach { char in
///         "\(char)"
///         if "aeioußÖ".contains(char) {
///             wbr {}
///         }
///     }
/// }
/// ```
///
/// For URLs:
///
/// ```swift
/// p {
///     "http://this"; wbr {}
///     ".is"; wbr {}
///     ".a"; wbr {}
///     ".really"; wbr {}
///     ".long"; wbr {}
///     ".example"; wbr {}
///     ".com"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<wbr>` to suggest where long words or URLs can break if needed for responsive layouts
/// - Unlike `&shy;` (soft hyphen), `<wbr>` does not introduce a hyphen at the line break point
/// - For URLs, add break opportunities before punctuation to avoid leaving punctuation marks at the end of the line
/// - In RTL (right-to-left) text, `<wbr>` behaves like a Unicode zero-width space and has no effect on bidirectional ordering
///
/// ## Difference from `<br>`
///
/// Unlike the `<br>` element which forces a line break, `<wbr>` only suggests where a break *may* occur if needed.
/// The browser will only break at the `<wbr>` position if it would otherwise overflow its container.
///
public struct LineBreakOpportunity: Element {
    /// The HTML tag name
    public static var tag: String { "wbr" }
    
    /// Creates a new LineBreakOpportunity element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating LineBreakOpportunity elements with a more HTML-like syntax.
public typealias wbr = LineBreakOpportunity
