///
/// Label.swift
/// swift-html
///
/// Represents the HTML label element for form controls.
///
/// Created by Claude on 04/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML label element, which provides a caption for an item in a user interface.
///
/// The `Label` struct provides a way to create accessible form labels that are programmatically
/// associated with form controls. Labels can be associated with controls either explicitly
/// (using the `for` attribute) or implicitly (by nesting the control within the label).
///
/// ## Benefits of Using Labels
///
/// - Screen readers will read the label when focus is on the associated form control
/// - Clicking/tapping the label will focus the associated control
/// - Increases the hit area for activating the control
///
/// ## Example
///
/// ```swift
/// // Explicit association using 'for' attribute
/// label(for: "username") {
///     "Username:"
/// } +
/// input(name: "username", id: "username", type: .text(...))
///
/// // Implicit association by nesting the control
/// label {
///     "Remember me"
///     input(name: "remember", type: .checkbox(...))
/// }
/// ```
///
/// - Note: When rendered, this generates an HTML `<label>` element that improves form accessibility.
public struct Label<HTML>: Element {
    public static var tag: String { "label" }
    
    /// Associates the label with a form control using its ID.
    ///
    /// When specified, this attributes creates an explicit relationship between
    /// the label and a form control. The value should match the ID of the form control.
    public var `for`: For?
    
    /// The content of the label, which can include both text and nested controls.
    public var content: () -> HTML
    
    /// Creates a new Label element with optional explicit association.
    ///
    /// - Parameters:
    ///   - htmlFor: ID of the form control this label is associated with (optional)
    ///   - content: The content of the label
    public init(
        for: For? = nil,
        content: @escaping () -> HTML
    ) {
        self.for = `for`
        self.content = content
    }
}

/// Lowercase typealias for creating Label elements with a more HTML-like syntax.
///
/// Example: `label(for: "name") { "Your name:" }`
public typealias label = Label


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label
 */
// <label>: The Label element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <label>
// HTML
// element represents a caption for an item in a user interface.
// Try it
// <div class="preference">
//  <label for="cheese">Do you like cheese?</label>
//  <input type="checkbox" name="cheese" id="cheese" />
// </div>
// <div class="preference">
//  <label for="peas">Do you like peas?</label>
//  <input type="checkbox" name="peas" id="peas" />
// </div>
// .preference {
//  display: flex;
//  justify-content: space-between;
//  width: 60%;
//  margin: 0.5rem;
// }
// Associating a
// <label>
// with a form control, such as
// <input>
// or
// <textarea>
// offers some major advantages:
// The label text is not only visually associated with its corresponding text input; it is programmatically associated with it too. This means that, for example, a screen reader will read out the label when the user is focused on the form input, making it easier for an assistive technology user to understand what data should be entered.
// When a user clicks or touches/taps a label, the browser passes the focus to its associated input (the resulting event is also raised for the input). That increased hit area for focusing the input provides an advantage to anyone trying to activate it â including those using a touch-screen device.
// To explicitly associate a
// <label>
// element with an
// <input>
// element, you first need to add the
// id
// attribute to the
// <input>
// element. Next, you add the
// for
// attribute to the
// <label>
// element, where the value of
// for
// is the same as the
// id
// in the
// <input>
// element.
// Alternatively, you can nest the
// <input>
// directly inside the
// <label>
// , in which case the
// for
// and
// id
// attributes are not needed because the association is implicit:
// html
// <label>
//  Do you like peas?
//  <input type="checkbox" name="peas" />
// </label>
// The form control that a label is labeling is called the
// labeled control
// of the label element. Multiple labels can be associated with the same form control:
// html
// <label for="username">Enter your username:</label>
// <input id="username" name="username" type="text" />
// <label for="username">Forgot your username?</label>
// Elements that can be associated with a
// <label>
// element include
// <button>
// ,
// <input>
// (except for
// type="hidden"
// ),
// <meter>
// ,
// <output>
// ,
// <progress>
// ,
// <select>
// and
// <textarea>
// .
// Attributes
// This element includes the
// global attributes
// .
// for
// The value of the
// for
// attribute must be a single
// id
// for a
// labelable
// form-related element in the same document as the
// <label>
// element. So, any given
// label
// element can be associated with only one form control.
// Note:
// To programmatically set the
// for
// attribute, use
// htmlFor
// .
// The first element in the document with an
// id
// attribute matching the value of the
// for
// attribute is the
// labeled control
// for this
// label
// element â if the element with that
// id
// is actually a
// labelable element
// . If it is
// not
// a labelable element, then the
// for
// attribute has no effect. If there are other elements that also match the
// id
// value, later in the document, they are not considered.
// Multiple
// label
// elements can be given the same value for their
// for
// attribute; doing so causes the associated form control (the form control that
// for
// value references) to have multiple labels.
// Note:
// A
// <label>
// element can have both a
// for
// attribute and a contained control element, as long as the
// for
// attribute points to the contained control element.
// Styling with CSS
// There are no special styling considerations for
// <label>
// elements â structurally they are inline elements, and so can be styled in much the same way as a
// <span>
// or
// <a>
// element. You can apply styling to them in any way you want, as long as you don't cause the text to become difficult to read.
// Accessibility
// Interactive content
// Don't place interactive elements such as
// anchors
// or
// buttons
// inside a
// label
// . Doing so makes it difficult for people to activate the form input associated with the
// label
// .
// Don't do this:
// html
// <label for="tac">
//  <input id="tac" type="checkbox" name="terms-and-conditions" />
//  I agree to the <a href="terms-and-conditions.html">Terms and Conditions</a>
// </label>
// Prefer this:
// html
// <label for="tac">
//  <input id="tac" type="checkbox" name="terms-and-conditions" />
//  I agree to the Terms and Conditions
// </label>
// <p>
//  <a href="terms-and-conditions.html">Read our Terms and Conditions</a>
// </p>
// Headings
// Placing
// heading elements
// within a
// <label>
// interferes with many kinds of assistive technology, because headings are commonly used as
// a navigation aid
// . If the label's text needs to be adjusted visually, use CSS classes applied to the
// <label>
// element instead.
// If a
// form
// , or a section of a form needs a title, use the
// <legend>
// element placed within a
// <fieldset>
// .
// Don't do this:
// html
// <label for="your-name">
//  <h3>Your name</h3>
//  <input id="your-name" name="your-name" type="text" />
// </label>
// Prefer this:
// html
// <label class="large-label" for="your-name">
//  Your name
//  <input id="your-name" name="your-name" type="text" />
// </label>
// Buttons
// An
// <input>
// element with a
// type="button"
// declaration and a valid
// value
// attribute does not need a label associated with it. Doing so may actually interfere with how assistive technology parses the button input. The same applies for the
// <button>
// element.
// Examples
// Defining an implicit label
// html
// <label>Click me <input type="text" /></label>
// Defining an explicit label with the "for" attribute
// html
// <label for="username">Click me to focus on the input field</label>
// <input type="text" id="username" />
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// interactive content
// ,
// form-associated element
// , palpable content.
// Permitted content
// Phrasing content
// , but no descendant
// label
// elements. No
// labelable
// elements other than the labeled control are allowed.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLLabelElement
// Specifications
// Specification
// HTML
// #
// the-label-element
// Browser compatibility