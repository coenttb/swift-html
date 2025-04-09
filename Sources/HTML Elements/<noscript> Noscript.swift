///
/// <noscript> Noscript.swift
/// swift-html
///
/// Represents the HTML noscript element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents an HTML `<noscript>` element, which defines content to be inserted if a script type on the page 
/// is unsupported or if scripting is currently turned off in the browser.
///
/// The `Noscript` element can be used to provide alternative content when JavaScript is unavailable.
///
/// ## Example
///
/// ```swift
/// noscript {
///     a(href: "https://www.mozilla.org/") {
///         "External Link"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<noscript>` to provide meaningful alternative content for users who have JavaScript disabled
/// - When inside the `<head>` element, `<noscript>` can only contain `<link>`, `<style>`, and `<meta>` elements
/// - When outside the `<head>` element, `<noscript>` can contain any content that would be valid in its parent element
/// - A `<noscript>` element cannot contain another `<noscript>` element
///
public struct Noscript: Element {
    /// The HTML tag name
    public static var tag: String { "noscript" }
    
    /// Creates a new Noscript element with the specified content.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Noscript elements with a more HTML-like syntax.
public typealias noscript = Noscript
