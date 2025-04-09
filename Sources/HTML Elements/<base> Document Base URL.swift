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