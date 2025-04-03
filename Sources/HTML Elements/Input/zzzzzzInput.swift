/////
///// Input.swift
///// swift-html
/////
///// Created by Coen ten Thije Boonkkamp on 03/04/2025.
/////
//
//import Foundation
//import PointFreeHTML
//
///// Extensions and attributes for HTML input elements.
/////
///// The `<input>` element is one of the most versatile and powerful HTML elements, used to create
///// interactive controls for web-based forms. This file provides Swift extensions and attributes
///// for working with common input attributes and creating input elements with various configurations.
/////
///// ## Input Elements
/////
///// Input elements can have many different appearances and behaviors based on their type attribute.
///// Some of the most commonly used types include:
/////
///// - Text inputs (text, email, password, search, tel, url)
///// - Numeric inputs (number, range)
///// - Date/time inputs (date, time, datetime-local, month, week)
///// - Selection inputs (checkbox, radio, color, file)
///// - Hidden inputs
///// - Button inputs (button, submit, reset, image)
/////
///// ## Common Attributes
/////
///// Many attributes can be applied to input elements to control their behavior and appearance:
/////
///// - `name`: Specifies the name for the input, used when submitting form data
///// - `value`: The initial value of the input
///// - `placeholder`: Hint text displayed when the input is empty
///// - `required`: Indicates the input must have a value before form submission
///// - `disabled`: Disables the input, preventing user interaction
///// - `readonly`: Makes the input value read-only, but still submittable
///// - `autofocus`: Gives focus to the input when the page loads
///// - `autocomplete`: Controls browser autocomplete behavior
/////
///// ## Usage Examples
/////
///// ```swift
///// // Basic text input
///// input().type(.text).name("username").placeholder("Enter username")
/////
///// // Required email input
///// input().type(.email).name("email").required
/////
///// // Password input with autocomplete off
///// input().type(.password).name("password").autocomplete("off")
/////
///// // Checkbox
///// input().type(.checkbox).name("subscribe").value("yes").id("subscribe")
/////
///// // Radio buttons
///// input().type(.radio).name("gender").value("male").id("male")
///// input().type(.radio).name("gender").value("female").id("female")
/////
///// // File upload
///// input().type(.file).name("document").accept(.pdf, .docx)
/////
///// // Number input with range constraints
///// input().type(.number).name("quantity").min("1").max("10").value("1")
/////
///// // Date picker
///// input().type(.date).name("birthday")
/////
///// // Hidden field
///// input().type(.hidden).name("csrf_token").value("abc123")
/////
///// // Submit button
///// input().type(.submit).value("Submit")
///// ```
//extension HTML {
//    
//    // MARK: - Common Input Attributes
//
//    
//    /// Sets the value attribute for an input
//    @discardableResult
//    public func value(
//        _ value: String
//    ) -> _HTMLAttributes<Self> {
//        self.attribute("value", value)
//    }
//    
//    /// Sets the name attribute for an input (used in form submission)
//    @discardableResult
//    public func name(
//        _ value: String
//    ) -> _HTMLAttributes<Self> {
//        self.attribute("name", value)
//    }
//    
//    
//    
//    /// Adds the checked attribute to a checkbox or radio input
//    public var checked: _HTMLAttributes<Self> {
//        self.attribute("checked")
//    }
//    
//    
//    // MARK: - Form Input Groups
//    
//    /// Creates a labeled input group with a text input
//    @HTMLBuilder
//    public static func labeledTextInput(
//        id: String,
//        label labelString: String,
//        name: String? = nil,
//        placeholder: String? = nil,
//        value: String? = nil,
//        required: Bool = false
//    ) -> some HTML {
//        div {
//            label { "\(labelString)" }
//                .for(id)
//            
//            input()
//                .type(input: .text)
//                .id(id)
//                .name(name ?? id)
//                .placeholder(placeholder ?? "")
//                .value(value ?? "")
//                .required(required)
//
//        }
//    }
//    
//    /// Creates a checkbox with associated label
//    @HTMLBuilder
//    public static func checkbox(
//        id: String,
//        label labelString: String,
//        name: String? = nil,
//        value: String = "1",
//        checked: Bool = false
//    ) -> some HTML {
//        div {
//            input()
//                .type(input: .checkbox)
//                .id(id)
//                .name(name ?? id)
//                .value(value)
//                .attribute(checked ? "checked" : "", "")
//            
//            label {
//                "\(labelString)"
//            }
//                .for(id)
//        }
//    }
//    
//    /// Creates a radio button with associated label
//    @HTMLBuilder
//    public static func radio(
//        id: String,
//        name: String,
//        label labelString: String,
//        value: String,
//        checked: Bool = false
//    ) -> some HTML {
//        div {
//            input()
//                .type(input: .radio)
//                .id(id)
//                .name(name)
//                .value(value)
//                .attribute(checked ? "checked" : "", "")
//            
//            label {
//                "\(labelString)"
//            }
//                .for(id)
//        }
//    }
//    
//    /// Creates a set of radio buttons from a list of options
//    @HTMLBuilder
//    public static func radioGroup(
//        name: String,
//        options: [(id: String, label: String, value: String)],
//        selectedValue: String? = nil
//    ) -> some HTML {
//        fieldset {
//            HTMLForEach(options) { option in
//                div {
//                    input()
//                        .type(input: .radio)
//                        .id(option.id)
//                        .name(name)
//                        .value(option.value)
//                        .attribute(selectedValue == option.value ? "checked" : "", "")
//                    
//                    label {
//                        "\(option.label)"
//                    }
//                        .for(option.id)
//                }
//            }
//        }
//    }
////    
////    /// Creates a complete form with submit button
////    @HTMLBuilder
////    public static func form(
////        action: String? = nil,
////        method: String = "post",
////        @HTMLBuilder content: () -> some HTML
////    ) -> some HTML {
////        var form = PointFreeHTML.form()
////        
////        if let action = action {
////            form = form.attribute("action", action)
////        }
////        
////        return form {
////            content()
////            
////            div {
////                input()
////                    .type(.submit)
////                    .value("Submit")
////            }
////        }
////            .attribute("method", method)
////    }
////    
////    /// Creates a search input with associated button
////    public static func searchInput(
////        id: String? = nil,
////        name: String = "search",
////        placeholder: String = "Search...",
////        buttonText: String = "Search"
////    ) -> some HTML {
////        div {
////            var input = input()
////                .type(.search)
////                .name(name)
////                .placeholder(placeholder)
////            
////            if let id = id {
////                input = input.id(id)
////            }
////            
////            input
////            
////            button().type("submit").text(buttonText)
////        }
////    }
//}



///// An attribute that specifies the type of input control.
/////
///// The `type` attribute is one of the most important attributes for `<input>` elements. It determines what
///// kind of input control is displayed and how the element behaves. Without it, browsers default to a text input.
/////
///// ## Available Input Types
/////
///// The HTML specification defines many types of input controls, each with specific behaviors and validation rules:
/////
///// ### Text Input Types
///// - `text`: A basic single-line text field (default)
///// - `password`: A text field that masks input
///// - `email`: For email addresses with validation
///// - `tel`: For telephone numbers with appropriate keyboard on mobile devices
///// - `url`: For web addresses with validation
///// - `search`: A text field optimized for search queries
/////
///// ### Numeric Input Types
///// - `number`: For numeric input with increment/decrement controls
///// - `range`: A slider control for numeric input within a range
/////
///// ### Date and Time Input Types
///// - `date`: For selecting a date (year, month, day)
///// - `datetime-local`: For date and time without timezone
///// - `month`: For selecting a month and year
///// - `time`: For selecting a time value
///// - `week`: For selecting a week and year
/////
///// ### Special Input Types
///// - `checkbox`: A toggle state control
///// - `radio`: One option from a group of mutually exclusive options
///// - `color`: A color picker
///// - `file`: For uploading files
///// - `hidden`: Not displayed but included in form submission
/////
///// ### Button Input Types
///// - `button`: A push button with no default behavior
///// - `submit`: Submits the form
///// - `reset`: Resets the form to initial values
///// - `image`: A graphical submit button
/////
///// ## Usage Notes
/////
///// - Each input type has specific attributes that apply only to that type
///// - Browsers provide built-in validation for certain types (email, url, number, etc.)
///// - Mobile browsers may show specialized keyboards based on the input type
///// - Some input types like date and color aren't supported in all browsers
/////
///// ## Examples
/////
///// ```swift
///// // Basic text input
///// HTML.input.type(.text).placeholder("Enter your name")
/////
///// // Email input with validation
///// HTML.input.type(.email).required
/////
///// // Password input
///// HTML.input.type(.password).attribute("autocomplete", "current-password")
/////
///// // Numeric input with range constraints
///// HTML.input.type(.number).min("0").max("100").step("5")
/////
///// // Date picker
///// HTML.input.type(.date).attribute("name", "birthdate")
/////
///// // Checkbox
///// HTML.input.type(.checkbox).attribute("name", "subscribe").attribute("value", "yes")
/////
///// // File upload for images
///// HTML.input.type(.file).accept(.image)
///// ```
//public struct InputType: Attribute {
//    /// The name of the HTML attribute
//    public static let attribute: String = "type"
//
//    /// The input type value
//    private let value: String
//
//    /// Initialize with a type value
//    public init(_ value: String) {
//        self.value = value
//    }
//}
//
//extension InputType: ExpressibleByStringLiteral {
//    public init(stringLiteral value: StringLiteralType) {
//        self.value = value
//    }
//}
//
//extension InputType: CustomStringConvertible {
//    /// Returns the string representation of the input type value
//    public var description: String {
//        return self.value
//    }
//}
//
//
//extension HTML {
//    /// Add a type attribute to specify the type of input control
//    @discardableResult
//    public func type(
//        input value: InputType?
//    ) -> _HTMLAttributes<Self> {
//        self.attribute(InputType.attribute, value?.description)
//    }
//
//}
