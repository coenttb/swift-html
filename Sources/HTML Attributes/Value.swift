///
/// Value.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import Foundation

/// An attribute that specifies the value of an HTML element, primarily used with form controls.
///
/// The `value` attribute has different meanings depending on the element it's used with. For form controls,
/// it generally specifies the initial or current value of the element. This value is sent to the server
/// when the form is submitted unless it's overridden by user input or JavaScript.
///
/// ## Usage Notes
///
/// - Format and meaning vary depending on the element and its type attribute
/// - For most input types, specifies the initial or current value
/// - For button-like inputs, defines the text displayed on the button
/// - For checkboxes and radio buttons, specifies the value sent when selected
/// - For menu items and options, defines the value submitted with the form
///
/// ## Element-Specific Behavior
///
/// ### For `<input>` Elements
/// - **text, email, password, tel, url**: The text value
/// - **number, range**: A numerical value
/// - **date, datetime-local, month, time, week**: Date/time in the correct format (e.g., "2023-01-15" for date)
/// - **checkbox, radio**: The value sent when the control is selected (not displayed to user)
/// - **button, reset, submit**: The text displayed on the button
/// - **hidden**: The value sent with form submission (not visible)
/// - **color**: A color in hexadecimal format (e.g., "#ff0000")
///
/// ### For `<button>` Elements
/// - Not used; content between tags defines button text
///
/// ### For `<option>` Elements
/// - The value sent to the server when selected
/// - If omitted, the text content of the option is used
///
/// ### For `<li>` in `<ol>`
/// - Defines the numbering value of the list item
///
/// ### For `<meter>` and `<progress>`
/// - The current numeric value of the element
///
/// ## Examples
///
/// Text input with initial value:
/// ```html
/// <input type="text" name="username" value="JohnDoe">
/// ```
///
/// Submit button with custom text:
/// ```html
/// <input type="submit" value="Send Message">
/// ```
///
/// Checkbox with a value:
/// ```html
/// <input type="checkbox" name="interests" value="music"> Music
/// ```
///
/// Select with options:
/// ```html
/// <select name="country">
///   <option value="us">United States</option>
///   <option value="ca">Canada</option>
///   <option value="mx">Mexico</option>
/// </select>
/// ```
public struct Value: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "value"
    
    /// The value
    private let value: String
    
    /// Initialize with a string value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a numeric value (converted to string)
    public init(_ value: Int) {
        self.value = String(value)
    }
    
    /// Initialize with a floating-point value (converted to string)
    public init(_ value: Double) {
        self.value = String(value)
    }
    
    /// Initialize with a boolean value (converted to string)
    public init(_ value: Bool) {
        self.value = value ? "true" : "false"
    }
}


extension Value: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Value: ExpressibleByStringInterpolation {}

extension Value: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension Value: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.value = String(value)
    }
}

extension Value: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        self.value = value ? "true" : "false"
    }
}

extension Value: CustomStringConvertible {
    /// Returns the string representation of the value
    public var description: String {
        return self.value
    }
}
