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
