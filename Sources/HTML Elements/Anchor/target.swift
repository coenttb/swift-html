///
/// target.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes
import PointFreeHTML

/// An attribute that specifies where to display the linked URL.
///
/// The `target` attribute defines a name for the browsing context (a tab, window, or `<iframe>`)
/// where the linked content should be displayed. It is commonly used with `<a>`, `<area>`,
/// `<base>`, and `<form>` elements.
///
/// ## Reserved Target Values
///
/// The following keywords have special meanings:
///
/// - `_self`: Opens the link in the current browsing context (default behavior)
/// - `_blank`: Opens the link in a new browsing context, typically a new tab
/// - `_parent`: Opens the link in the parent browsing context; if no parent exists, behaves as `_self`
/// - `_top`: Opens the link in the topmost browsing context; if no ancestors exist, behaves as `_self`
/// - `_unfencedTop`: Allows embedded fenced frames to navigate the top-level frame
///
/// ## Security Considerations
///
/// When using `target="_blank"`, it's recommended to also include `rel="noopener"` to prevent
/// the new page from accessing the `window.opener` property, which can be a security risk.
/// Modern browsers automatically set `rel="noopener"` for `target="_blank"`, but explicitly
/// setting it ensures consistent behavior across all browsers.
///
/// ## Custom Target Names
///
/// In addition to the reserved keywords, you can specify a custom name to:
///
/// - Target a specific `<iframe>` by matching its `name` attribute
/// - Reuse the same named browsing context for multiple links
///
/// ## Usage Notes
///
/// - If the target attribute is not specified, the default is `_self`
/// - When using `_blank`, consider including `rel="noopener noreferrer"` for security
/// - Custom target names must not start with an underscore (_) to avoid conflicts with reserved keywords
/// - In web applications with multiple frames, using named targets can create a more integrated experience
///
/// ## Examples
///
/// ```swift
/// // Open link in a new tab
/// HTML.a.href("https://example.com").target(.blank).text("Visit Example.com")
///
/// // Open link in a specific iframe
/// HTML.a.href("page.html").target("content-frame").text("Load in Frame")
///
/// // Open link in parent frame
/// HTML.a.href("page.html").target(.parent).text("Load in Parent")
///
/// // Open link in top-level frame
/// HTML.a.href("page.html").target(.top).text("Load in Top Frame")
/// ```
public struct Target: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "target"
    
    /// The target value
    private let value: String
    
    /// Initialize with a target value
    public init(_ value: String) {
        self.value = value
    }
    
    
    /// Opens the link in the current browsing context (default)
    public static let `self`: Self = "_self"
    
    /// Opens the link in a new browsing context (usually a new tab)
    public static let blank: Self = "_blank"
    
    /// Opens the link in the parent browsing context; if no parent exists, behaves as `self`
    public static let parent: Self = "_parent"
    
    /// Opens the link in the topmost browsing context; if no ancestors exist, behaves as `self`
    public static let top: Self = "_top"
    
    /// Allows embedded fenced frames to navigate the top-level frame
    public static let unfencedTop: Self = "_unfencedTop"
    
    /// Creates a target for a specific named browsing context (e.g., an iframe's name)
    public static func named(_ name: String) -> Target {
        return Target(name)
    }
}

extension Target: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Target: CustomStringConvertible {
    /// Returns the string representation of the target value
    public var description: String {
        return self.value
    }
}

extension HTML {
    /// Add a target attribute to specify where to display the linked URL
    @discardableResult
    public func target(
        anchor value: Target?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Target.attribute, value?.description)
    }
    
    /// Open the link in a new tab or window
    @discardableResult
    @HTMLBuilder
    public func openInNewTab(
        withOpener: Bool = false
    ) -> some HTML {
        let result = self.target(anchor: .blank)
        
        if withOpener {
            result
        } else {
            result.rel(.noopener)
        }
    }
    
    /// Open the link in the parent browsing context
    @discardableResult
    public func openInParent() -> _HTMLAttributes<Self> {
        self.target(anchor: .parent)
    }
    
    /// Open the link in the top-level browsing context
    @discardableResult
    public func openInTop() -> _HTMLAttributes<Self> {
        self.target(anchor: .top)
    }
    
    /// Target a specific iframe by name
    @discardableResult
    public func targetFrame(
        _ frameName: String
    ) -> _HTMLAttributes<Self> {
        self.target(anchor: Target.named(frameName))
    }
}
