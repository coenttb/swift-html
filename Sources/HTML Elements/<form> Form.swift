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
public struct Form<HTML>: Element {
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
    
    /// The content of the form, including input fields, buttons, and other controls.
    ///
    /// This closure returns the HTML content that will be rendered inside the form element.
    public var content: () -> HTML
    
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
    ///   - content: The form contents (input fields, buttons, etc.)
    public init(
        autocapitalize: Autocapitalize? = nil,
        autocomplete: Autocomplete? = nil,
        name: Name? = nil,
        rel: Rel? = nil,
        action: HTML_Attributes.Action? = nil,
        enctype: HTML_Attributes.Enctype? = nil,
        method: HTML_Attributes.Method? = nil,
        novalidate: HTML_Attributes.Novalidate? = nil,
        target: HTML_Attributes.FormTarget? = nil,
        content: @escaping () -> HTML
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
        self.content = content
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



/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form
 */
// <form>: The Form element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <form>
// HTML
// element represents a document section containing interactive controls for submitting information.
// Try it
// <form action="" method="get" class="form-example">
//  <div class="form-example">
//  <label for="name">Enter your name: </label>
//  <input type="text" name="name" id="name" required />
//  </div>
//  <div class="form-example">
//  <label for="email">Enter your email: </label>
//  <input type="email" name="email" id="email" required />
//  </div>
//  <div class="form-example">
//  <input type="submit" value="Subscribe!" />
//  </div>
// </form>
// form.form-example {
//  display: table;
// }
// div.form-example {
//  display: table-row;
// }
// label,
// input {
//  display: table-cell;
//  margin-bottom: 10px;
// }
// label {
//  padding-right: 10px;
// }
// It is possible to use the
// :valid
// and
// :invalid
// CSS
// pseudo-classes
// to style a
// <form>
// element based on whether the
// elements
// inside the form are valid.
// Attributes
// This element includes the
// global attributes
// .
// accept
// Deprecated
// Comma-separated
// content types
// the server accepts.
// Note:
// This attribute has been deprecated and should not be used.
// Instead, use the
// accept
// attribute on
// <input type=file>
// elements.
// accept-charset
// The
// character encoding
// accepted by the server.
// The specification allows a single case-insensitive value of
// "UTF-8"
// , reflecting the ubiquity of this encoding (historically multiple character encodings could be specified as a comma-separated or space-separated list).
// autocapitalize
// Controls whether inputted text is automatically capitalized and, if so, in what manner. See the
// autocapitalize
// global attribute page for more information.
// autocomplete
// Indicates whether input elements can by default have their values automatically completed by the browser.
// autocomplete
// attributes on form elements override it on
// <form>
// . Possible values:
// off
// : The browser may not automatically complete entries. (Browsers tend to ignore this for suspected login forms; see
// Managing autofill for login fields
// .)
// on
// : The browser may automatically complete entries.
// name
// The name of the form. The value must not be the empty string, and must be unique among the
// form
// elements in the forms collection that it is in, if any.
// rel
// Controls the annotations and what kinds of links the form creates. Annotations include
// external
// ,
// nofollow
// ,
// opener
// ,
// noopener
// , and
// noreferrer
// . Link types include
// help
// ,
// prev
// ,
// next
// ,
// search
// , and
// license
// . The
// rel
// value is a space-separated list of these enumerated values.
// Attributes for form submission
// The following attributes control behavior during form submission.
// action
// The URL that processes the form submission. This value can be overridden by a
// formaction
// attribute on a
// <button>
// ,
// <input type="submit">
// , or
// <input type="image">
// element. This attribute is ignored when
// method="dialog"
// is set.
// enctype
// If the value of the
// method
// attribute is
// post
// ,
// enctype
// is the
// MIME type
// of the form submission. Possible values:
// application/x-www-form-urlencoded
// : The default value.
// multipart/form-data
// : Use this if the form contains
// <input>
// elements with
// type=file
// .
// text/plain
// : Useful for debugging purposes.
// This value can be overridden by
// formenctype
// attributes on
// <button>
// ,
// <input type="submit">
// , or
// <input type="image">
// elements.
// method
// The
// HTTP
// method to submit the form with.
// The only allowed methods/values are (case insensitive):
// post
// : The
// POST
// method; form data sent as the
// request body
// .
// get
// (default): The
// GET
// ; form data appended to the
// action
// URL with a
// ?
// separator. Use this method when the form
// has no side effects
// .
// dialog
// : When the form is inside a
// <dialog>
// , closes the dialog and causes a
// submit
// event to be fired on submission, without submitting data or clearing the form.
// This value is overridden by
// formmethod
// attributes on
// <button>
// ,
// <input type="submit">
// , or
// <input type="image">
// elements.
// novalidate
// This Boolean attribute indicates that the form shouldn't be validated when submitted. If this attribute is not set (and therefore the form
// is
// validated), it can be overridden by a
// formnovalidate
// attribute on a
// <button>
// ,
// <input type="submit">
// , or
// <input type="image">
// element belonging to the form.
// target
// Indicates where to display the response after submitting the form. It is a name/keyword for a
// browsing context
// (for example, tab, window, or iframe). The following keywords have special meanings:
// _self
// (default): Load into the same browsing context as the current one.
// _blank
// : Load into a new unnamed browsing context. This provides the same behavior as setting
// rel="noopener"
// which does not set
// window.opener
// .
// _parent
// : Load into the parent browsing context of the current one. If no parent, behaves the same as
// _self
// .
// _top
// : Load into the top-level browsing context (i.e., the browsing context that is an ancestor of the current one and has no parent). If no parent, behaves the same as
// _self
// .
// _unfencedTop
// : Load the response from a form inside an embedded
// fenced frame
// into the top-level frame (i.e., traversing beyond the root of the fenced frame, unlike other reserved destinations). Only available inside fenced frames.
// This value can be overridden by a
// formtarget
// attribute on a
// <button>
// ,
// <input type="submit">
// , or
// <input type="image">
// element.
// Examples
// html
// <!-- Form which will send a GET request to the current URL -->
// <form method="get">
//  <label>
//  Name:
//  <input name="submitted-name" autocomplete="name" />
//  </label>
//  <button>Save</button>
// </form>
// <!-- Form which will send a POST request to the current URL -->
// <form method="post">
//  <label>
//  Name:
//  <input name="submitted-name" autocomplete="name" />
//  </label>
//  <button>Save</button>
// </form>
// <!-- Form with fieldset, legend, and label -->
// <form method="post">
//  <fieldset>
//  <legend>Do you agree to the terms?</legend>
//  <label><input type="radio" name="radio" value="yes" /> Yes</label>
//  <label><input type="radio" name="radio" value="no" /> No</label>
//  </fieldset>
// </form>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// palpable content
// Permitted content
// Flow content
// , but not containing
// <form>
// elements
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// Implicit ARIA role
// form
// Permitted ARIA roles
// search
// ,
// none
// or
// presentation
// DOM interface
// HTMLFormElement
// Specifications
// Specification
// HTML
// #
// the-form-element
// Browser compatibility
// See also
// HTML forms guide
// Other elements that are used when creating forms:
// <button>
// ,
// <datalist>
// ,
// <fieldset>
// ,
// <input>
// ,
// <label>
// ,
// <legend>
// ,
// <meter>
// ,
// <optgroup>
// ,
// <option>
// ,
// <output>
// ,
// <progress>
// ,
// <select>
// ,
// <textarea>
// .
// Getting a list of the elements in the form:
// HTMLFormElement.elements
// ARIA: Form role
// ARIA: Search role