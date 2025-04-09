///
/// Form.swift
/// swift-html
///
/// Represents the HTML form element for user input data collection.
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML form element (`<form>`), which is used to collect user input and submit it to a server.
///
/// The `Form` struct provides a type-safe way to create HTML forms with various attributes
/// and validation options. Forms can contain interactive controls such as text fields,
/// checkboxes, radio buttons, and submit buttons.
///
/// ## Example
///
/// ```swift
/// form(
///     name: "contact",
///     action: .relative("/submit"),
///     method: .post,
///     enctype: .multipartFormData,
///     novalidate: true,
///     target: .self,
///     autocomplete: .on
/// ) {
///     // Form controls go here
///     input(name: "name", type: .text(...))
///     input(name: "email", type: .email(...))
///     input(name: "submit", type: .submit(...))
/// }
/// ```
///
/// ## Form Attributes
///
/// Forms support various attributes that control their behavior:
/// - `action`: Where form data is submitted to
/// - `method`: HTTP method used (GET, POST, DIALOG)
/// - `enctype`: How form data is encoded when submitted
/// - `target`: Where the response is displayed
/// - `novalidate`: Whether browser validation is disabled
/// - `autocomplete`: Whether browser autocomplete is enabled
///
/// ## Form Submission
///
/// When a form is submitted, typically by activating a submit button, the form data is sent to the
/// server specified by the `action` attribute using the method specified by the `method` attribute.
///
/// - Note: When rendered, this generates an HTML `<form>` element with the appropriate
///   attributes based on the form configuration.
public struct Form: Element {
    public static var tag: String { "form" }
    
    /// DEPRECATED: A comma-separated list of content types the server accepts.
    ///
    /// - Note: This attribute has been deprecated in HTML. Instead, use the `accept` attribute
    ///   on individual `<input type="file">` elements.
    @available(*, deprecated, message: "Use accept attribute on input[type=file] elements instead")
    public var accept: Accept? = nil
    
    /// The character encoding for form submission.
    ///
    /// This attribute specifies the character encoding used for form submission.
    /// Modern specification allows only the "UTF-8" value, reflecting the ubiquity of this encoding.
    /// Historically, multiple character encodings could be specified.
    ///
    /// - Default: "utf-8"
    public var acceptCharset: AcceptCharset? = nil
    
    /// Controls whether inputted text is automatically capitalized.
    ///
    /// Possible values include:
    /// - `none`: No automatic capitalization
    /// - `sentences`: Capitalize the first letter of each sentence
    /// - `words`: Capitalize the first letter of each word
    /// - `characters`: Capitalize all characters
    public var autocapitalize: Autocapitalize?
    
    /// Controls whether the browser can automatically complete input values.
    ///
    /// When present, this attribute indicates whether input elements within the form
    /// can have their values automatically completed by the browser. This attribute
    /// on the form element can be overridden by `autocomplete` attributes on
    /// individual input elements.
    public var autocomplete: Autocomplete?
    
    /// The name of the form.
    ///
    /// This value must not be empty and must be unique among the form elements
    /// in the forms collection within the same document.
    public var name: Name?
    
    /// Controls annotations and link relationships for the form.
    ///
    /// Annotations can include: external, nofollow, opener, noopener, and noreferrer.
    /// Link types can include: help, prev, next, search, and license.
    public var rel: Rel?
    
    /// The URL that processes the form submission.
    ///
    /// This URL receives the form data when the form is submitted. If omitted,
    /// the form is submitted to the current page URL.
    /// This attribute is ignored when `method="dialog"` is set.
    public var action: HTML_Attributes.Action?
    
    /// The MIME type of the form submission.
    ///
    /// This attribute is only relevant when the form's method is POST and specifies
    /// how the form data should be encoded when sent to the server.
    ///
    /// Common values:
    /// - `application/x-www-form-urlencoded` (default)
    /// - `multipart/form-data` (required for file uploads)
    /// - `text/plain` (for debugging)
    public var enctype: HTML_Attributes.Enctype?
    
    /// The HTTP method to use when submitting the form.
    ///
    /// Specifies which HTTP method the browser uses to submit the form:
    /// - `GET` (default): Form data appended to the URL
    /// - `POST`: Form data sent in the HTTP request body
    /// - `DIALOG`: For forms inside a dialog, closes the dialog on submission
    public var method: HTML_Attributes.Method?
    
    /// Disables browser validation when submitting the form.
    ///
    /// When present, this boolean attribute indicates that the form shouldn't be validated
    /// before submission. This allows bypassing built-in browser validation for elements
    /// with attributes like `required`, `pattern`, `min`/`max`, etc.
    public var novalidate: HTML_Attributes.Novalidate?
    
    /// Indicates where to display the response after submitting the form.
    ///
    /// This attribute specifies the browsing context (tab, window, or iframe) where
    /// the response should be displayed after form submission.
    ///
    /// Special values:
    /// - `_self` (default): Current browsing context
    /// - `_blank`: New tab or window
    /// - `_parent`: Parent browsing context
    /// - `_top`: Top-level browsing context
    public var target: HTML_Attributes.FormTarget?
    
    /// Creates a new HTML form element with the specified attributes and content.
    ///
    /// - Parameters:
    ///   - autocapitalize: Controls automatic capitalization of text input
    ///   - autocomplete: Controls browser autocomplete functionality
    ///   - name: Form name identifier
    ///   - rel: Link relationship annotations
    ///   - action: URL for form submission processing
    ///   - enctype: MIME type of the form submission
    ///   - method: HTTP method for form submission
    ///   - novalidate: Whether to disable browser validation
    ///   - target: Where to display the response
    public init(
        autocapitalize: Autocapitalize? = nil,
        autocomplete: Autocomplete? = nil,
        name: Name? = nil,
        rel: Rel? = nil,
        action: HTML_Attributes.Action? = nil,
        enctype: HTML_Attributes.Enctype? = nil,
        method: HTML_Attributes.Method? = nil,
        novalidate: HTML_Attributes.Novalidate? = nil,
        target: HTML_Attributes.FormTarget? = nil
    ) {
        self.autocapitalize = autocapitalize
        self.autocomplete = autocomplete
        self.name = name
        self.rel = rel
        self.action = action
        self.enctype = enctype
        self.method = method
        self.novalidate = novalidate
        self.target = target
    }
}

/// Lowercase typealias for creating Form elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `form` identifier when creating
/// HTML form elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// form(name: "login", action: "/login", method: .post) {
///     // Form controls
/// }
/// ```
public typealias form = Form


