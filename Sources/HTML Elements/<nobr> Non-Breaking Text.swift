//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
/// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the compatibility table at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time."
public struct NoBr<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "nobr" }
    
    public let content: () -> HTML
    
    @available(*, deprecated, message: "Although this element is widely supported, it was never standard HTML, so you shouldn't use it. Instead, use the CSS property `white-space.`")
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias nobr = NoBr


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/nobr
 */
// <nobr>: The Non-Breaking Text element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <nobr>
// HTML
// element prevents the text it contains from automatically wrapping across multiple lines, potentially resulting in the user having to scroll horizontally to see the entire width of the text.
// Warning:
// Although this element is widely supported, it was
// never
// standard HTML, so you shouldn't use it. Instead, use the CSS property
// white-space
// like this:
// html
// <span style="white-space: nowrap;">Long line with no breaks</span>
// Specifications
// Specification
// HTML
// #
// nobr
// Browser compatibility
// See also
// white-space
// overflow