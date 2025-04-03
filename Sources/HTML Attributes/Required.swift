///
/// Required.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

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
public enum Required: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "required"
    

}

extension Required: CustomStringConvertible {
    /// Returns the string representation of the required attribute
    public var description: String {
        switch self {
            
        }
    }
}

extension HTML {
    
    /// Adds the required attribute to the element
    public var required: _HTMLAttributes<Self> {
        self.attribute(Required.attribute)
    }
    
    /// Adds the required attribute to the element
    @HTMLBuilder
    public func required(_ value: Bool?) -> some HTML {
        if value == true {
            self.attribute(Required.attribute)
        } else {
            self
        }
    }

    
//    /// Sets up a required field with proper labeling and indication
//    @discardableResult
//    public func requiredField(
//        id: String,
//        type: String = "text",
//        name: String? = nil,
//        label: String
//    ) -> HTML {
//        let input = HTML.input
//            .id(id)
//            .attribute("type", type)
//            .required()
//            .attribute("aria-required", "true")
//        
//        let inputWithName = name != nil ? input.attribute("name", name!) : input
//        
//        return HTML.div([
//            HTML.label.for(id)([
//                HTML.text(label),
//                HTML.span.attribute("class", "required-indicator")
//                    .attribute("aria-hidden", "true")
//                    .text(" *")
//            ]),
//            inputWithName
//        ])
//    }
}
