//
//  Loading.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Foundation

/// Represents the CSS `loading` attribute that specifies how the browser should load an image.
///
/// The `loading` attribute affects when and how resources like images and iframes
/// are loaded relative to their visibility in the viewport. This can significantly
/// impact page performance and data usage.
///
/// ```
///    Loading behavior:
///
///    eager (default):            lazy:
///    +--------------+            +--------------+
///    | Image loads  |            | Placeholder  |
///    | immediately  |            | until near   |
///    | when page    |            | viewport     |
///    | is rendered  |            |              |
///    +--------------+            +--------------+
///                                      |
///                                      v
///                                +--------------+
///                                | Image loads  |
///                                | when user    |
///                                | scrolls near |
///                                | viewport     |
///                                +--------------+
/// ```
///
/// Example usage:
/// ```swift
/// let lazyLoading = Loading.lazy
/// // HTML attribute: loading="lazy"
///
/// let eagerLoading = Loading.eager
/// // HTML attribute: loading="eager"
/// ```
///
/// - Note: This is primarily used as an HTML attribute rather than a CSS property,
///   but it's included in this library for completeness when working with HTML elements.
///
/// - SeeAlso: [MDN Web Docs: loading attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-loading)
public enum Loading: String, CaseIterable, Sendable, Equatable {
    /// Defers loading of the resource until it reaches a calculated distance from the viewport.
    /// Useful for conserving bandwidth and improving initial page load time.
    case lazy
    
    /// Loads the resource immediately, regardless of where it's located on the page (default browser behavior).
    case eager
}
