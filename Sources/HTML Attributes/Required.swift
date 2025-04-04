///
/// Required.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// A Boolean attribute that indicates a form control must be filled out before form submission.
///
/// When the `required` attribute is present, it indicates that the user must specify a value
/// for the input before the owning form can be submitted. Elements with this attribute match
/// the `:required` CSS pseudo-class.
///
/// ## Usage Notes
///
/// ### Supported Elements
/// 
/// The required attribute is valid on:
/// - Text-based `<input>` types: text, search, url, tel, email, password
/// - Time-based `<input>` types: date, month, week, time, datetime-local
/// - Other `<input>` types: number, checkbox, radio, file
/// - `<select>` and `<textarea>` elements
///
/// It is NOT valid on:
/// - `<input>` types with default values: range, color
/// - Hidden inputs: `<input type="hidden">`
/// - Button inputs: submit, reset, button, image
///
/// ### Element-Specific Behavior
///
/// - For radio buttons with the same name, if one has `required`, then one in the group must be selected
/// - For checkboxes with the same name, only those with the `required` attribute are required
/// - Has no effect on elements with the `readonly` attribute
///
/// ## Accessibility Considerations
///
/// - Always provide a visible indication near the control to show it's required
/// - Use the `:required` CSS pseudo-class to style required controls
/// - Consider adding `aria-required="true"` for maximum compatibility
/// - Ensure error messages for empty required fields are clear and accessible
///
/// ## Examples
///
/// Required text input:
/// ```html
/// <input type="text" required>
/// ```
///
/// Required select:
/// ```html
/// <select required>
///   <option value="">Please select an option</option>
///   <option value="1">Option 1</option>
/// </select>
/// ```
///
/// Required checkbox:
/// ```html
/// <input type="checkbox" required> I agree to the terms
/// ```
public struct Required: Attribute, ExpressibleByBooleanLiteral {
    fileprivate let value: Bool
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self.value = value
    }
    
    /// The name of the HTML attribute
    public static let attribute: String = "required"
}
