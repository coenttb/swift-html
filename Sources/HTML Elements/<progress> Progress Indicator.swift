///
/// <progress> Progress Indicator.swift
/// swift-html
///
/// Represents the HTML progress element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML progress element (`<progress>`), which displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
///
/// The `ProgressIndicator` struct provides a type-safe way to create HTML progress elements with various attributes.
///
/// ## Example
///
/// ```swift
/// progress(max: 100, value: 70) {
///     "70%"
/// }
/// ```
///
/// ## Accessibility
///
/// - Always provide an accessible label using a `<label>` element or ARIA attributes (aria-label, aria-labelledby)
/// - Text placed between the element's tags is not an accessible label; it's only recommended as a fallback for older browsers
/// - When describing loading progress of a page section, use `aria-describedby` to point to the status, and set `aria-busy="true"` on the section being updated
///
/// ## Best Practices
///
/// - Unlike the `<meter>` element, the minimum value is always 0
/// - If there is no value attribute, the progress bar is indeterminate, indicating an ongoing activity with no indication of expected duration
/// - To change a progress bar to indeterminate after giving it a value, the value attribute must be removed
///
public struct ProgressIndicator: Element {
    /// The HTML tag name
    public static var tag: String { "progress" }
    
    /// This attribute describes how much work the task indicated by the progress element requires.
    /// The max attribute, if present, must have a value greater than 0 and be a valid floating point number.
    /// The default value is `1`.
    public var max: Max?
    
    /// This attribute specifies how much of the task that has been completed.
    /// It must be a valid floating point number between 0 and max, or between 0 and 1 if max is omitted.
    /// If there is no value attribute, the progress bar is indeterminate; this indicates that an activity
    /// is ongoing with no indication of how long it is expected to take.
    public var value: Value<Float>?
    
    /// Creates a new ProgressIndicator element with the specified attributes.
    ///
    /// - Parameters:
    ///   - max: The maximum value, describing how much work the task requires. Default is 1.
    ///   - value: The current progress value. If nil, the progress bar is indeterminate., typically a text fallback for browsers that don't support the progress element.
    public init(
        max: Max? = nil,
        value: Value<Float>? = nil
    ) {
        self.max = max
        self.value = value
        
    }
}

/// Lowercase typealias for creating ProgressIndicator elements with a more HTML-like syntax.
public typealias progress = ProgressIndicator
