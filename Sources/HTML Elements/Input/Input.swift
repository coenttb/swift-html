///
/// Type.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML
import HTML_Attributes

public struct Input {
    /// Name of the form control. Submitted with the form as part of a name/value pair
    public var name: String
    
    /// Whether the form control is disabled
    public var disabled: Bool
    
    /// Associates the control with a form element
    public var form: Form.ID? = nil
    
    /// Type of form control
    public var type: Input.Variant
}


/// An attribute that specifies the type of input control.
///
/// The `type` attribute is one of the most important attributes for `<input>` elements. It determines what 
/// kind of input control is displayed and how the element behaves. Without it, browsers default to a text input.
///
/// ## Available Input Types
///
/// The HTML specification defines many types of input controls, each with specific behaviors and validation rules:
///
/// ### Text Input Types
/// - `text`: A basic single-line text field (default)
/// - `password`: A text field that masks input
/// - `email`: For email addresses with validation
/// - `tel`: For telephone numbers with appropriate keyboard on mobile devices
/// - `url`: For web addresses with validation
/// - `search`: A text field optimized for search queries
///
/// ### Numeric Input Types
/// - `number`: For numeric input with increment/decrement controls
/// - `range`: A slider control for numeric input within a range
///
/// ### Date and Time Input Types
/// - `date`: For selecting a date (year, month, day)
/// - `datetime-local`: For date and time without timezone
/// - `month`: For selecting a month and year
/// - `time`: For selecting a time value
/// - `week`: For selecting a week and year
///
/// ### Special Input Types
/// - `checkbox`: A toggle state control
/// - `radio`: One option from a group of mutually exclusive options
/// - `color`: A color picker
/// - `file`: For uploading files
/// - `hidden`: Not displayed but included in form submission
///
/// ### Button Input Types
/// - `button`: A push button with no default behavior
/// - `submit`: Submits the form
/// - `reset`: Resets the form to initial values
/// - `image`: A graphical submit button
///
/// ## Usage Notes
///
/// - Each input type has specific attributes that apply only to that type
/// - Browsers provide built-in validation for certain types (email, url, number, etc.)
/// - Mobile browsers may show specialized keyboards based on the input type
/// - Some input types like date and color aren't supported in all browsers
///
/// ## Examples
///
/// ```swift
/// // Basic text input
/// HTML.input.type(.text).placeholder("Enter your name")
///
/// // Email input with validation
/// HTML.input.type(.email).required
///
/// // Password input
/// HTML.input.type(.password).attribute("autocomplete", "current-password")
///
/// // Numeric input with range constraints
/// HTML.input.type(.number).min("0").max("100").step("5")
///
/// // Date picker
/// HTML.input.type(.date).attribute("name", "birthdate")
///
/// // Checkbox
/// HTML.input.type(.checkbox).attribute("name", "subscribe").attribute("value", "yes")
///
/// // File upload for images
/// HTML.input.type(.file).accept(.image)
/// ```
public struct InputType: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "type"
    
    /// The input type value
    private let value: String
    
    /// Initialize with a type value
    public init(_ value: String) {
        self.value = value
    }
}

extension InputType: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension InputType: CustomStringConvertible {
    /// Returns the string representation of the input type value
    public var description: String {
        return self.value
    }
}


extension HTML {
    /// Add a type attribute to specify the type of input control
    @discardableResult
    public func type(
        input value: InputType?
    ) -> _HTMLAttributes<Self> {
        self.attribute(InputType.attribute, value?.description)
    }

}
