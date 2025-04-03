///
/// Readonly.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// A Boolean attribute that makes a form control non-editable but still functional.
///
/// When the `readonly` attribute is present, the user cannot modify the value of the form control,
/// but unlike `disabled` elements, readonly controls are still focusable, can be tabbed to,
/// and are submitted with the form.
///
/// ## Usage Notes
///
/// ### Supported Elements
/// 
/// The readonly attribute is valid on:
/// - `<input>` with types: text, search, url, tel, email, password, date, month, week, time, datetime-local, number
/// - `<textarea>`
///
/// It is NOT valid on:
/// - `<select>` or `<button>`
/// - Non-textual `<input>` types: hidden, range, color, checkbox, radio, file, submit, image, reset, button
///
/// ### Behavior
///
/// - User cannot edit the content but can still focus/tab to it
/// - Field is still submitted with the form (unlike disabled controls)
/// - Field does not participate in constraint validation
/// - If a field is readonly, `required` has no effect
/// - Elements with readonly match the `:read-only` CSS pseudo-class
/// - Elements without readonly match the `:read-write` CSS pseudo-class
/// - Value can still be modified programmatically
///
/// ## Readonly vs. Disabled
///
/// - **Readonly**: Still focusable, still submitted with form, appears partially interactive
/// - **Disabled**: Not focusable, not submitted with form, appears completely non-interactive
///
/// ## Examples
///
/// Readonly text input:
/// ```html
/// <input type="text" value="Cannot edit this" readonly>
/// ```
///
/// Readonly textarea:
/// ```html
/// <textarea readonly>This text cannot be edited by the user.</textarea>
/// ```
///
/// Readonly date input:
/// ```html
/// <input type="date" value="2025-01-01" readonly>
/// ```
public struct Readonly: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "readonly"
    
    /// The value of the readonly attribute (always empty for Boolean attributes)
    private let value: String = ""
    
    /// Initialize a readonly attribute
    public init() {}
    
    /// Initialize with a boolean value to conditionally include the attribute
    public init(_ isReadonly: Bool) {
        // This initializer exists for API consistency, but
        // the actual boolean value is not stored as readonly is a Boolean attribute
    }
    
    /// A shared instance to use since all instances are identical
    public static let readonly = Readonly()
}

extension Readonly: CustomStringConvertible {
    /// Returns the string representation of the readonly attribute
    public var description: String {
        return self.value
    }
}

extension HTML {
    
    /// Adds the readonly attribute to the element
    @discardableResult
    public func readonly() -> _HTMLAttributes<Self> {
        self.attribute(Readonly.attribute, Readonly.readonly.description)
    }
    
    /// Conditionally adds the readonly attribute to the element
    @discardableResult
    @HTMLBuilder
    public func readonly(_ isReadonly: Bool) -> some HTML {
        if isReadonly {
            self.readonly()
        }
        self
    }
    
//    /// Creates a text display field (readonly input with value)
//    @discardableResult
//    public func displayField(
//        id: String,
//        name: String? = nil,
//        label: String,
//        value: String
//    ) -> HTML {
//        let input = HTML.input
//            .id(id)
//            .attribute("type", "text")
//            .attribute("value", value)
//            .readonly()
//        
//        let inputWithName = name != nil ? input.attribute("name", name!) : input
//        
//        return HTML.div([
//            HTML.label
//                .for(id)
//                .text(label),
//            inputWithName
//        ])
//    }
//    
//    /// Creates a static text display area (readonly textarea with content)
//    @discardableResult
//    public func displayArea(
//        id: String,
//        name: String? = nil,
//        label: String,
//        content: String
//    ) -> HTML {
//        let textarea = HTML.textarea
//            .id(id)
//            .readonly()
//            .text(content)
//        
//        let textareaWithName = name != nil ? textarea.attribute("name", name!) : textarea
//        
//        return HTML.div([
//            HTML.label
//                .for(id)
//                .text(label),
//            textareaWithName
//        ])
//    }
//    
//    /// Sets either readonly or disabled based on preference
//    @discardableResult
//    public func editability(
//        readonly: Bool = false,
//        disabled: Bool = false
//    ) -> _HTMLAttributes<Self> {
//        var result = self
//        
//        if readonly {
//            result = result.attribute(Readonly.attribute, "")
//        }
//        
//        if disabled {
//            result = result.attribute("disabled", "")
//        }
//        
//        return result
//    }
}
