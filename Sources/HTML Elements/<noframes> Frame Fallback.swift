//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct FrameFallback<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "noframes" }
    
    public let content: () -> HTML
    
    @available(*, deprecated)
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias noframes = FrameFallback


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noframes
 */
// <noframes>: The Frame Fallback element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <noframes>
// HTML
// element provides content to be presented in browsers that don't support (or have disabled support for) the
// <frame>
// element. Although most commonly-used browsers support frames, there are exceptions, including certain special-use browsers including some mobile browsers, as well as text-mode browsers.
// A
// <noframes>
// element can contain any HTML elements that are allowed within the body of an HTML document, except for the
// <frameset>
// and
// <frame>
// elements, since using frames when they aren't supported doesn't make sense.
// <noframes>
// can be used to present a message explaining that the user's browser doesn't support frames, but ideally should be used to present an alternate form of the site that doesn't use frames but still offers the same or similar functionality.
// Note:
// This element is obsolete and shouldn't be used, since the
// <frame>
// and
// <frameset>
// elements are also obsolete. When frames are needed at all, they should be presented using the
// <iframe>
// element.
// Attributes
// Like all other HTML elements, this element supports the
// global attributes
// . It has no other attributes available.
// Example
// In this example, we see a frameset with two frames. In addition,
// <noframes>
// is used to present an explanatory message if the
// user agent
// doesn't support frames.
// html
// <!doctype html>
// <html lang="en-US">
//  <head>
//  <!-- Document metadata goes here -->
//  </head>
//  <frameset rows="45%, 55%">
//  <frame src="https://developer.mozilla.org/en/HTML/Element/frameset" />
//  <frame src="https://developer.mozilla.org/en/HTML/Element/frame" />
//  <noframes>
//  <p>
//  It seems your browser does not support frames or is configured to not
//  allow them.
//  </p>
//  </noframes>
//  </frameset>
// </html>
// Specifications
// Specification
// HTML
// #
// noframes
// Browser compatibility
// See also
// <frameset>
// <frame>