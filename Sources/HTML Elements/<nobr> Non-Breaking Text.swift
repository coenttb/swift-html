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
