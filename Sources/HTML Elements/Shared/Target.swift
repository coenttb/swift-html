///
/// Target.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes
import PointFreeHTML

/// An attribute that specifies where to display the response after form submission.
///
/// The `target` attribute defines a name or keyword for the browsing context (tab, window, or iframe)
/// where the form response should be displayed. This works similarly to the target attribute on links.
///
/// ## Reserved Target Values
///
/// The following keywords have special meanings:
///
/// - `_self` (default): Load into the same browsing context as the current one
/// - `_blank`: Load into a new unnamed browsing context (new tab or window)
/// - `_parent`: Load into the parent browsing context of the current one
/// - `_top`: Load into the top-level browsing context
/// - `_unfencedTop`: Load into the top-level context from a fenced frame
///
/// ## Target Behavior
///
/// ### _self
/// - Default behavior
/// - Replaces the current page with the form response
/// - Suitable for most forms
///
/// ### _blank
/// - Opens the response in a new tab or window
/// - Preserves the current page
/// - In modern browsers, behaves like using `rel="noopener"` (doesn't set window.opener)
/// - Useful for forms that shouldn't navigate away from the current page
///
/// ### _parent
/// - Loads the response in the parent frame
/// - If there's no parent frame, behaves like `_self`
/// - Useful in nested frame structures
///
/// ### _top
/// - Loads the response in the highest-level frame (the entire window)
/// - Useful for breaking out of nested frames
/// - If there's no parent frame, behaves like `_self`
///
/// ### _unfencedTop
/// - Specialized for fenced frames
/// - Only available inside fenced frames
/// - Loads the response into the top-level frame, traversing beyond the fenced frame's boundaries
///
/// ## Custom Target Names
///
/// You can also specify a custom name to:
///
/// - Target a specific `<iframe>` by matching its `name` attribute
/// - Create a consistent named browsing context for multiple forms
///
/// ## Usage Notes
///
/// - Can be overridden by `formtarget` attributes on submit buttons
/// - Consider user experience when deciding where to display form responses
/// - For security, be cautious when using `_blank` with untrusted content
///
/// ## Examples
///
/// ```swift
/// // Form that replaces the current page (default)
/// HTML.form.action("/submit").method(.post)
///
/// // Form that opens response in a new tab
/// HTML.form.action("/search").method(.get).target(.blank)
///
/// // Form that targets a specific iframe
/// HTML.form.action("/update").method(.post).target("results-frame")
///
/// // Form with different targets for different buttons
/// HTML.form.action("/process") {
///     // Form fields...
///     input().type(.submit).value("Update in Same Window")
///     input().type(.submit).value("Open in New Tab").formtarget("_blank")
/// }
/// ```
public struct FormTarget: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "target"
    
    /// The target value
    private let value: String
    
    /// Initialize with a target value
    public init(_ value: String) {
        self.value = value
    }

    /// Opens the response in the current browsing context (default)
    public static let `self`: Self = "_self"
    
    /// Opens the response in a new browsing context (usually a new tab)
    public static let blank: Self = "_blank"
    
    /// Opens the response in the parent browsing context; if no parent exists, behaves as `self`
    public static let parent: Self = "_parent"
    
    /// Opens the response in the topmost browsing context; if no ancestors exist, behaves as `self`
    public static let top: Self = "_top"
    
    /// Allows embedded fenced frames to navigate the top-level frame
    public static let unfencedTop: Self = "_unfencedTop"
    
    /// Creates a target for a specific named browsing context (e.g., an iframe's name)
    public static func named(_ name: String) -> FormTarget {
        return FormTarget(name)
    }
}

extension FormTarget: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension FormTarget: CustomStringConvertible {
    /// Returns the string representation of the target value
    public var description: String {
        return self.value
    }
}

extension HTML {
    /// Add a target attribute to a form to specify where to display the response
    @discardableResult
    public func target(
        form value: FormTarget?
    ) -> _HTMLAttributes<Self> {
        self.attribute(FormTarget.attribute, value?.description)
    }
    
    /// Create a form that opens the response in a new tab
    public static func newTabForm(
        action: String,
        method: Method = .post,
        @HTMLBuilder content: () -> some HTML
    ) -> some HTML {
        form { content() }
            .action(action)
            .method(method)
            .target(form: .blank)
    }
    
    /// Create a form that targets a specific iframe
    public static func iframeTargetForm(
        action: String,
        targetFrame: String,
        method: Method = .post,
        @HTMLBuilder content: () -> some HTML
    ) -> some HTML {
        form { content() }
            .action(action)
            .method(method)
            .target(form: FormTarget.named(targetFrame))
    }
}
