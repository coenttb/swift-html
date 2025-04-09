///
/// Label.swift
/// swift-html
///
/// Represents the HTML label element for form controls.
///
/// Created by Claude on 04/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML label element, which provides a caption for an item in a user interface.
///
/// The `Label` struct provides a way to create accessible form labels that are programmatically
/// associated with form controls. Labels can be associated with controls either explicitly
/// (using the `for` attribute) or implicitly (by nesting the control within the label).
///
/// ## Benefits of Using Labels
///
/// - Screen readers will read the label when focus is on the associated form control
/// - Clicking/tapping the label will focus and activate the associated control
/// - Increases the hit area for focusing/activating the control
///
/// ## Example
///
/// ```swift
/// // Explicit association using 'for' attribute
/// label(for: "username") {
///     "Username:"
/// } +
/// input(name: "username", id: "username", type: .text(...))
///
/// // Implicit association by nesting the control
/// label {
///     "Remember me"
///     input(name: "remember", type: .checkbox(...))
/// }
/// ```
///
/// ## Accessibility Considerations
///
/// - Don't place interactive elements such as anchors or buttons inside a label
/// - Avoid placing heading elements inside labels
/// - Multiple labels can be associated with the same form control
/// - Form controls that can be associated with labels include: `<button>`, `<input>` (except `type="hidden"`),
///   `<meter>`, `<output>`, `<progress>`, `<select>`, and `<textarea>`
///
/// - Note: When rendered, this generates an HTML `<label>` element that improves form accessibility.
public struct Label: Element {
    public static var tag: String { "label" }
    
    /// Associates the label with a form control using its ID.
    ///
    /// When specified, this attribute creates an explicit relationship between
    /// the label and a form control. The value should match the ID of the form control.
    /// A label can only be associated with one form control, but a form control
    /// can have multiple associated labels.
    public var `for`: For?
    
    /// Creates a new Label element with optional explicit association.
    ///
    /// - Parameters:
    ///   - htmlFor: ID of the form control this label is associated with (optional)
    public init(
        for: For? = nil
    ) {
        self.for = `for`
        
    }
}

/// Lowercase typealias for creating Label elements with a more HTML-like syntax.
///
/// Example: `label(for: "name") { "Your name:" }`
public typealias label = Label
