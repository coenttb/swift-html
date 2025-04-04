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
public struct Readonly: Attribute, ExpressibleByBooleanLiteral {
    fileprivate let value: Bool
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self.value = value
    }
    
    /// The name of the HTML attribute
    public static let attribute: String = "readonly"
    
}

extension HTML {
    
    /// Adds the readonly attribute to the element
    package var readonly: _HTMLAttributes<Self> {
        self.attribute(Readonly.attribute)
    }
    
    /// Conditionally adds the readonly attribute to the element
    @discardableResult
    @HTMLBuilder
    package func readonly(_ value: Bool?) -> some HTML {
        if value == true {
            self.readonly
        }
        self
    }
}
