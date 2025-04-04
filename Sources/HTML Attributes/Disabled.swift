///
/// Disabled.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// A Boolean attribute that indicates whether a form control is disabled.
///
/// When the `disabled` attribute is present, the element becomes non-interactive, 
/// non-focusable, and is not submitted with the form. Browsers typically display 
/// disabled elements with a greyed-out appearance to indicate their inactive state.
///
/// ## Usage Notes
///
/// - Supported on `<button>`, `<fieldset>`, `<input>`, `<optgroup>`, `<option>`, `<select>`, and `<textarea>`
/// - Disabled elements do not participate in constraint validation
/// - When applied to a `<fieldset>`, all form controls inside it become disabled, except those within the `<legend>`
/// - When applied to an `<optgroup>`, all options within the group become disabled, but the select itself remains interactive
/// - Disabled elements cannot be focused by the user or tabbed to
/// - Disabled controls are not submitted with the form data
///
/// ## Disabled vs. Readonly
///
/// - Readonly elements remain focusable and can be tabbed to
/// - Readonly elements are still submitted with the form
/// - Disabled elements cannot receive focus and are not submitted
///
/// ## Accessibility Concerns
///
/// - Disabled elements are not focusable and do not participate in the tab order
/// - Screen readers may not announce disabled elements by default
/// - Consider using `aria-disabled="true"` instead of `disabled` when you want to maintain focusability
///   but indicate that an element is not currently active
///
/// ## Examples
///
/// Disabled button:
/// ```html
/// <button type="submit" disabled>Submit</button>
/// ```
///
/// Disabled input:
/// ```html
/// <input type="text" disabled>
/// ```
///
/// Disabled fieldset (disables all form controls within):
/// ```html
/// <fieldset disabled>
///   <legend>Personal Information</legend>
///   <input type="text" name="name">
///   <input type="email" name="email">
/// </fieldset>
/// ```
public struct Disabled: Attribute, ExpressibleByBooleanLiteral {
    fileprivate let value: Bool
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self.value = value
    }
    
    /// Initialize with a boolean value
    public init(_ value: Bool) {
        self.value = value
    }
    
    /// The name of the HTML attribute
    public static let attribute: String = "disabled"
}
