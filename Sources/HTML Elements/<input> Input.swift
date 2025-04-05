/// Represents an HTML input element, which is used to create interactive controls
/// for web-based forms to accept data from the user.
///
/// The `Input` struct provides a type-safe way to create various types of HTML input elements,
/// such as text fields, checkboxes, radio buttons, and more. Each input type has specific
/// attributes and behaviors defined by its variant.
///
/// Example usage:
/// ```swift
/// Input(
///     name: "username",
///     disabled: nil,
///     form: nil,
///     type: .text(Input.Text(value: "John"))
/// )
/// ```
///
/// - SeeAlso: `Input.Variant` for the available input types
///
/// - Note: When rendered, this generates an HTML `<input>` element with the appropriate
///   attributes based on the input type.

import Foundation
import HTML_Attributes

public struct Input {
    /// Name of the form control. Submitted with the form as part of a name/value pair.
    public var name: String?
    
    /// Whether the form control is disabled.
    /// When set, the input element is disabled and cannot be interacted with or submitted.
    public var disabled: Disabled?
    
    /// Associates the control with a form element.
    /// When specified, this overrides the form's `id` attribute if the input is outside the form.
    public var form: HTML_Attributes.Form.ID? = nil
    
    /// Type of form control.
    /// Determines the appearance and behavior of the input element.
    /// See `Input.Variant` for all available input types.
    public var type: Input.Variant
    
    /// Creates a new Input element with the specified attributes.
    ///
    /// - Parameters:
    ///   - name: The name attribute for the input element
    ///   - disabled: Whether the input is disabled (optional)
    ///   - form: The ID of the form this input belongs to (optional)
    ///   - type: The type of input element to create
    public init(
        name: String?,
        disabled: Disabled?,
        form: HTML_Attributes.Form.ID? = nil,
        type: Input.Variant
    ) {
        self.name = name
        self.disabled = disabled
        self.form = form
        self.type = type
    }
}

/// Lowercase typealias for creating Input elements with a more HTML-like syntax.
/// Example: `input(name: "username", disabled: nil, type: .text(...))`
public typealias input = Input



