///
/// <base> Document Base URL.swift
/// swift-html
///
/// Represents the HTML base element for specifying the document's base URL.
///
/// Created by Claude on 04/06/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML base element (`<base>`), which specifies the base URL to use for all
/// relative URLs in a document.
///
/// The `Base` struct provides a type-safe way to define the base URL for an HTML document.
/// Only one `<base>` element should be used in a document, and it must appear in the document's
/// `<head>` section.
///
/// ## Example
///
/// ```swift
/// base(configuration: .both(href: "https://example.com/", target: .blank))
/// ```
///
/// ## Usage Notes
///
/// - The base element must have either an `href` attribute, a `target` attribute, or both
/// - If multiple base elements are present in a document, only the first `href` and first `target` are used
/// - The base element must appear before other elements with URL attributes (like `<link href="...">`)
/// - In-page anchors (e.g., `#section-id`) are resolved relative to the base URL
///
/// - Note: When rendered, this generates an HTML `<base>` element with the specified attributes.
///   It is a void element and does not have a closing tag.
public struct Base: Element {
    public static var tag: String { "base" }
    
    /// The configuration for the base element, which must include an href, a target, or both.
    public var configuration: Configuration
    
    /// The possible configurations for a base element.
    ///
    /// According to the HTML specification, a base element must have either an href attribute,
    /// a target attribute, or both.
    public enum Configuration {
        /// A base element with only an href attribute.
        case href(HTML_Attributes.Href)
        
        /// A base element with only a target attribute.
        case target(HTML_Attributes.Target)
        
        /// A base element with both href and target attributes.
        case both(href: HTML_Attributes.Href, target: HTML_Attributes.Target)
    }
    
    /// The base URL to be used throughout the document for relative URLs, if specified.
    ///
    /// This attribute specifies the base URL that will be used for all relative
    /// URL references in the document. Both absolute and relative URLs are allowed,
    /// but `data:` and `javascript:` URLs are not permitted.
    ///
    /// - Note: If multiple base elements exist, only the first href is used.
    public var href: HTML_Attributes.Href? {
        switch configuration {
        case .href(let href):
            return href
        case .both(let href, _):
            return href
        case .target:
            return nil
        }
    }
    
    /// The default browsing context for navigations from elements without explicit targets, if specified.
    ///
    /// This attribute specifies the default browsing context (window, tab, or frame)
    /// to display the results of navigation from elements like `<a>`, `<area>`, or `<form>`
    /// that don't have explicit target attributes.
    ///
    /// Special values:
    /// - `_self` (default): Show in current browsing context
    /// - `_blank`: Show in new, unnamed browsing context
    /// - `_parent`: Show in parent browsing context
    /// - `_top`: Show in topmost browsing context
    ///
    /// - Note: If multiple base elements exist, only the first target is used.
    public var target: HTML_Attributes.Target? {
        switch configuration {
        case .target(let target):
            return target
        case .both(_, let target):
            return target
        case .href:
            return nil
        }
    }
    
    /// Creates a new Base element with the specified configuration.
    ///
    /// - Parameter configuration: The configuration for the base element, which must include
    ///   an href, a target, or both.
    public init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    /// Creates a new Base element with an href attribute.
    ///
    /// - Parameter href: The base URL to be used for all relative URLs in the document.
    public init(href: HTML_Attributes.Href) {
        self.configuration = .href(href)
    }
    
    /// Creates a new Base element with a target attribute.
    ///
    /// - Parameter target: The default browsing context for navigation.
    public init(target: HTML_Attributes.Target) {
        self.configuration = .target(target)
    }
    
    /// Creates a new Base element with both href and target attributes.
    ///
    /// - Parameters:
    ///   - href: The base URL to be used for all relative URLs in the document.
    ///   - target: The default browsing context for navigation.
    public init(href: HTML_Attributes.Href, target: HTML_Attributes.Target) {
        self.configuration = .both(href: href, target: target)
    }
}

/// Lowercase typealias for creating Base elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `base` identifier when creating
/// HTML base elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// base(href: "https://example.com/")
/// ```
public typealias base = Base


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base
 */
// <base>: The Document Base URL element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <base>
// HTML
// element specifies the base URL to use for all
// relative
// URLs in a document. There can be only one
// <base>
// element in a document.
// A document's used base URL can be accessed by scripts with
// Node.baseURI
// . If the document has no
// <base>
// elements, then
// baseURI
// defaults to
// location.href
// .
// Attributes
// This element's attributes include the
// global attributes
// .
// Warning:
// A
// <base>
// element must have an
// href
// attribute, a
// target
// attribute, or both.
// If at least one of these attributes are specified, the
// <base>
// element
// must
// come before other elements with attribute values that are URLs, such as a
// <link>
// 's
// href
// attribute.
// href
// The base URL to be used throughout the document for relative URLs.
// Absolute and relative URLs are allowed.
// data:
// and
// javascript:
// URLs are not allowed.
// target
// A
// keyword
// or
// author-defined name
// of the default
// browsing context
// to show the results of navigation from
// <a>
// ,
// <area>
// , or
// <form>
// elements without explicit
// target
// attributes. The following keywords have special meanings:
// _self
// (default): Show the result in the current browsing context.
// _blank
// : Show the result in a new, unnamed browsing context.
// _parent
// : Show the result in the parent browsing context of the current one, if the current page is inside a frame. If there is no parent, acts the same as
// _self
// .
// _top
// : Show the result in the topmost browsing context (the browsing context that is an ancestor of the current one and has no parent). If there is no parent, acts the same as
// _self
// .
// Usage notes
// Multiple <base> elements
// If multiple
// <base>
// elements are used, only the first
// href
// and first
// target
// are obeyed â all others are ignored.
// In-page anchors
// Links pointing to a fragment in the document â e.g.,
// <a href="#some-id">
// â are resolved with the
// <base>
// , triggering an HTTP request to the base URL with the fragment attached.
// For example, given
// <base href="https://example.com/">
// and this link:
// <a href="#anchor">To anchor</a>
// . The link points to
// https://example.com/#anchor
// .
// target may not contain ASCII newline, tab, or <
// If the
// target
// attribute contains an ASCII newline, tab, or the
// <
// character, the value is reset to
// _blank
// .
// This is to prevent dangling markup injection attacks, a script-less attack in which an unclosed
// target
// attribute is injected into the page so that any text that follows is captured until the browser reaches a character that closes the attribute.
// Open Graph
// Open Graph
// tags do not acknowledge
// <base>
// , and should always have full absolute URLs. For example:
// html
// <meta property="og:image" content="https://example.com/thumbnail.jpg" />
// Examples
// html
// <base href="https://www.example.com/" />
// <base target="_blank" />
// <base target="_top" href="https://example.com/" />
// Technical summary
// Content categories
// Metadata content.
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// A
// <head>
// that doesn't contain another
// <base>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLBaseElement
// Specifications
// Specification
// HTML
// #
// the-base-element
// Browser compatibility