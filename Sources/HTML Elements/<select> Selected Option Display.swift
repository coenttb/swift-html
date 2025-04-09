///
/// <select> Selected Option Display.swift
/// swift-html
///
/// Represents the HTML select element.
///
/// Created by Claude on 4/9/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<select>` element, which creates a dropdown list of options.
///
/// The `Select` element provides a way to create a form control that allows users to choose
/// one or multiple options from a dropdown list.
///
/// ## Example
///
/// ```swift
/// select {
///     option("value1") {
///         "Option 1"
///     }
///     option("value2") {
///         "Option 2"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always provide a descriptive label using the `<label>` element
/// - Use the `multiple` attribute when allowing multiple selections
/// - Include a default selected option when appropriate
/// - Keep the dropdown list reasonably sized for usability
/// - Consider using `<optgroup>` to organize long lists of options
///
public struct Select: Element {
    /// The HTML tag name
    public static var tag: String { "select" }
    
    /// Specifies that multiple options can be selected
    public var multiple: HTML_Attributes.Multiple?
    
    /// Specifies the name of the control
    public var name: HTML_Attributes.Name?
    
    /// Specifies that the control is required
    public var required: HTML_Attributes.Required?
    
    /// Specifies the number of visible options
    public var size: HTML_Attributes.Size?
    
    /// Specifies that the select should be disabled
    public var disabled: HTML_Attributes.Disabled?
    
    /// Specifies a form to which the select belongs
    public var form: HTML_Attributes.Form?
    
    /// Automatically focuses the select when the page loads
    public var autofocus: HTML_Attributes.Autofocus?
    
    /// Creates a new Select element with the specified attributes.
    ///
    /// - Parameters:
    ///   - multiple: Whether multiple options can be selected
    ///   - name: The name of the control
    ///   - required: Whether the control is required
    ///   - size: The number of visible options
    ///   - disabled: Whether the select should be disabled
    ///   - form: A form to which the select belongs
    ///   - autofocus: Whether the select should be focused when the page loads (typically option elements)
    public init(
        multiple: HTML_Attributes.Multiple? = nil,
        name: HTML_Attributes.Name? = nil,
        required: HTML_Attributes.Required? = nil,
        size: HTML_Attributes.Size? = nil,
        disabled: HTML_Attributes.Disabled? = nil,
        form: HTML_Attributes.Form? = nil,
        autofocus: HTML_Attributes.Autofocus? = nil
    ) {
        self.multiple = multiple
        self.name = name
        self.required = required
        self.size = size
        self.disabled = disabled
        self.form = form
        self.autofocus = autofocus
    }
}

/// Lowercase typealias for creating Select elements with a more HTML-like syntax.
public typealias select = Select
