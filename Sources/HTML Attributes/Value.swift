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
public struct Value<Element: Sendable & Equatable>: Attribute {
    /// The name of the HTML attribute
    public static var attribute: String { "value" }
    
    /// The value
    private let value: Element
    
    public init(value: Element) {
        self.value = value
    }
}



extension Value: ExpressibleByStringLiteral where Element: ExpressibleByStringLiteral {
    public typealias StringLiteralType = Element.StringLiteralType
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = Element(stringLiteral: value)
    }
}

extension Value: ExpressibleByExtendedGraphemeClusterLiteral where Element: ExpressibleByExtendedGraphemeClusterLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = Element.ExtendedGraphemeClusterLiteralType
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.value = Element(extendedGraphemeClusterLiteral: value)
    }
}

extension Value: ExpressibleByUnicodeScalarLiteral where Element: ExpressibleByUnicodeScalarLiteral {
    public typealias UnicodeScalarLiteralType = Element.UnicodeScalarLiteralType
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.value = Element(unicodeScalarLiteral: value)
    }
}

extension Value: ExpressibleByIntegerLiteral where Element: ExpressibleByIntegerLiteral {
    public typealias IntLiteralType = Element.IntegerLiteralType
    
    public init(integerLiteral value: IntLiteralType) {
        self.value = Element(integerLiteral: value)
    }
}

extension Value: ExpressibleByFloatLiteral where Element: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Element.FloatLiteralType
    
    public init(floatLiteral value: FloatLiteralType) {
        self.value = Element(floatLiteral: value)
    }
}
