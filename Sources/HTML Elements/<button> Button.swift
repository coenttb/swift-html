///
/// <button> Button.swift
/// swift-html
///
/// Represents the HTML button element.
///
/// Created by Claude on 04/06/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML button element (`<button>`), which is used to create a clickable button.
///
/// The `Button` struct provides a type-safe way to create HTML button elements. Buttons can be
/// configured with various attributes such as type, disabled status, and form association.
///
/// ## Example
///
/// ```swift
/// button {
///     "Click me"
/// }
///
/// button(type: .submit, disabled: true) {
///     "Submit"
/// }
/// ```
///
/// ## Button Types
///
/// Buttons can have different types that define their behavior:
/// - `.submit`: Submits the form data (default)
/// - `.reset`: Resets the form data to its initial values
/// - `.button`: No default behavior, typically used with JavaScript
///
/// ## Accessibility
///
/// When creating buttons, ensure you provide meaningful text content to aid users
/// with assistive technologies.
///
/// - Note: When rendered, this generates an HTML `<button>` element that is interactive and clickable.
public struct Button<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "button" }
    
    /// The button type (submit, reset, or button)
    public var type: Button.`Type`?
    
    /// Whether the button is disabled
    public var disabled: HTML_Attributes.Disabled?
    
    /// The ID of the form this button is associated with
    public var form: HTML_Attributes.Form.ID?
    
    /// The name of the button, used when submitting forms
    public var name: HTML_Attributes.Name?
    
    /// The value associated with the button, used when submitting forms
    public var value: HTML_Attributes.Value?
    
    /// Whether the button should automatically get focus on page load
    public var autofocus: HTML_Attributes.Autofocus?
    
    /// The URL that processes the form submission (for submit buttons)
    public var formaction: HTML_Attributes.FormAction?
    
    /// How form data should be encoded before submission (for submit buttons)
    public var formenctype: HTML_Attributes.FormEncType?
    
    /// The HTTP method used for form submission (for submit buttons)
    public var formmethod: HTML_Attributes.FormMethod?
    
    /// Whether to skip form validation on submission (for submit buttons)
    public var formnovalidate: HTML_Attributes.FormNovalidate?
    
    /// Where to display the response after form submission (for submit buttons)
    public var formtarget: HTML_Attributes.Target?
    
    /// The button's content
    public let content: () -> HTML
    
    /// Creates a new Button element with the specified attributes and content.
    ///
    /// - Parameters:
    ///   - type: The button type (submit, reset, or button)
    ///   - disabled: Whether the button is disabled
    ///   - form: The ID of the form this button is associated with
    ///   - name: The name of the button, used when submitting forms
    ///   - value: The value associated with the button, used when submitting forms
    ///   - autofocus: Whether the button should automatically get focus on page load
    ///   - formaction: The URL that processes the form submission (for submit buttons)
    ///   - formenctype: How form data should be encoded before submission (for submit buttons)
    ///   - formmethod: The HTTP method used for form submission (for submit buttons)
    ///   - formnovalidate: Whether to skip form validation on submission (for submit buttons)
    ///   - formtarget: Where to display the response after form submission (for submit buttons)
    ///   - content: The content to be rendered inside the button element
    public init(
        type: Button.`Type`? = nil,
        disabled: HTML_Attributes.Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil,
        name: HTML_Attributes.Name? = nil,
        value: HTML_Attributes.Value? = nil,
        autofocus: HTML_Attributes.Autofocus? = nil,
        formaction: HTML_Attributes.FormAction? = nil,
        formenctype: HTML_Attributes.FormEncType? = nil,
        formmethod: HTML_Attributes.FormMethod? = nil,
        formnovalidate: HTML_Attributes.FormNovalidate? = nil,
        formtarget: HTML_Attributes.Target? = nil,
        content: @escaping () -> HTML
    ) {
        self.type = type
        self.disabled = disabled
        self.form = form
        self.name = name
        self.value = value
        self.autofocus = autofocus
        self.formaction = formaction
        self.formenctype = formenctype
        self.formmethod = formmethod
        self.formnovalidate = formnovalidate
        self.formtarget = formtarget
        self.content = content
    }
}

extension Button {
    /// Button types that define how a button behaves
    public enum `Type`: String {
        /// Submits the form data (default behavior)
        case submit
        
        /// Resets the form data to its initial values
        case reset
        
        /// No default behavior, typically used with JavaScript
        case button
    }
}


/// Lowercase typealias for creating Button elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `button` identifier when creating
/// HTML button elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// button {
///     "Click me"
/// }
/// ```
public typealias button = Button
