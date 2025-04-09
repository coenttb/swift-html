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
    public var value: HTML_Attributes.Value<String>?
    
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
        value: HTML_Attributes.Value<String>? = nil,
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


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button
 */
// <button>: The Button element
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
// <button>
// HTML
// element is an interactive element activated by a user with a mouse, keyboard, finger, voice command, or other assistive technology. Once activated, it then performs an action, such as submitting a
// form
// or opening a dialog.
// By default, HTML buttons are presented in a style resembling the platform the
// user agent
// runs on, but you can change buttons' appearance with
// CSS
// .
// Try it
// <button class="favorite styled" type="button">Add to favorites</button>
// .styled {
//  border: 0;
//  line-height: 2.5;
//  padding: 0 20px;
//  font-size: 1rem;
//  text-align: center;
//  color: #fff;
//  text-shadow: 1px 1px 1px #000;
//  border-radius: 10px;
//  background-color: rgba(220, 0, 0, 1);
//  background-image: linear-gradient(
//  to top left,
//  rgba(0, 0, 0, 0.2),
//  rgba(0, 0, 0, 0.2) 30%,
//  rgba(0, 0, 0, 0)
//  );
//  box-shadow:
//  inset 2px 2px 3px rgba(255, 255, 255, 0.6),
//  inset -2px -2px 3px rgba(0, 0, 0, 0.6);
// }
// .styled:hover {
//  background-color: rgba(255, 0, 0, 1);
// }
// .styled:active {
//  box-shadow:
//  inset -2px -2px 3px rgba(255, 255, 255, 0.6),
//  inset 2px 2px 3px rgba(0, 0, 0, 0.6);
// }
// Attributes
// This element's attributes include the
// global attributes
// .
// autofocus
// This Boolean attribute specifies that the button should have input
// focus
// when the page loads.
// Only one element in a document can have this attribute.
// command
// Experimental
// Specifies the action to be performed on an element being controlled by a control
// <button>
// , specified via the
// commandfor
// attribute. The possible values are:
// "show-modal"
// This is a declarative equivalent of calling the
// .showModal()
// method on the dialog element.
// The button will show a
// <dialog>
// as modal. If the dialog is already modal, no action will be taken.
// "close"
// This is a declarative equivalent of calling the
// .close()
// method on the dialog element.
// The button will close a
// <dialog>
// element. If the dialog is already closed, no action will be taken.
// "request-close"
// This is a declarative equivalent of calling the
// .requestClose()
// method on the dialog element.
// The button will request to close a
// <dialog>
// element. If the dialog is already closed, no action will be taken.
// "show-popover"
// This is a declarative equivalent of calling the
// .showPopover()
// method on the popover element.
// This is equivalent to
// popovertargetaction
// with the value
// "show"
// .
// The button will show a hidden popover. If you try to show an already showing popover, no action will be taken. See
// Popover API
// for more details.
// "hide-popover"
// This is a declarative equivalent of calling the
// .hidePopover()
// method on the popover element.
// This is equivalent to
// popovertargetaction
// with the value
// "hide"
// .
// The button will hide a showing popover. If you try to hide an already hidden popover, no action will be taken. See
// Popover API
// for more details.
// "toggle-popover"
// This is a declarative equivalent of calling the
// .togglePopover()
// method on the popover element.
// This is equivalent to
// popovertargetaction
// with the value
// "toggle"
// .
// The button will toggle a popover between showing and hidden. If the popover is hidden, it will be shown; if the popover is showing, it will be hidden. See
// Popover API
// for more details.
// Custom values
// This attribute can represent custom values that are prefixed with a two hyphen characters (
// --
// ). Buttons with a custom value will dispatch the
// CommandEvent
// on the controlled element.
// commandfor
// Experimental
// Turns a
// <button>
// element into a command button, controlling the given interactive element; takes the ID of the element to control as its value.
// This is a more general version of
// popovertarget
// .
// disabled
// This Boolean attribute prevents the user from interacting with the button: it cannot be pressed or focused.
// form
// The
// <form>
// element to associate the button with (its
// form owner
// ). The value of this attribute must be the
// id
// of a
// <form>
// in the same document. (If this attribute is not set, the
// <button>
// is associated with its ancestor
// <form>
// element, if any.)
// This attribute lets you associate
// <button>
// elements to
// <form>
// s anywhere in the document, not just inside a
// <form>
// . It can also override an ancestor
// <form>
// element.
// formaction
// The URL that processes the information submitted by the button. Overrides the
// action
// attribute of the button's form owner. Does nothing if there is no form owner.
// formenctype
// If the button is a submit button (it's inside/associated with a
// <form>
// and doesn't have
// type="button"
// ), specifies how to encode the form data that is submitted. Possible values:
// application/x-www-form-urlencoded
// : The default if the attribute is not used.
// multipart/form-data
// : Used to submit
// <input>
// elements with their
// type
// attributes set to
// file
// .
// text/plain
// : Specified as a debugging aid; shouldn't be used for real form submission.
// If this attribute is specified, it overrides the
// enctype
// attribute of the button's form owner.
// formmethod
// If the button is a submit button (it's inside/associated with a
// <form>
// and doesn't have
// type="button"
// ), this attribute specifies the
// HTTP method
// used to submit the form. Possible values:
// post
// : The data from the form are included in the body of the HTTP request when sent to the server. Use when the form contains information that shouldn't be public, like login credentials.
// get
// : The form data are appended to the form's
// action
// URL, with a
// ?
// as a separator, and the resulting URL is sent to the server. Use this method when the form
// has no side effects
// , like search forms.
// dialog
// : This method is used to indicate that the button closes the
// dialog
// with which it is associated, and does not transmit the form data at all.
// If specified, this attribute overrides the
// method
// attribute of the button's form owner.
// formnovalidate
// If the button is a submit button, this Boolean attribute specifies that the form is not to be
// validated
// when it is submitted. If this attribute is specified, it overrides the
// novalidate
// attribute of the button's form owner.
// This attribute is also available on
// <input type="image">
// and
// <input type="submit">
// elements.
// formtarget
// If the button is a submit button, this attribute is an author-defined name or standardized, underscore-prefixed keyword indicating where to display the response from submitting the form. This is the
// name
// of, or keyword for, a
// browsing context
// (a tab, window, or
// <iframe>
// ). If this attribute is specified, it overrides the
// target
// attribute of the button's form owner. The following keywords have special meanings:
// _self
// : Load the response into the same browsing context as the current one. This is the default if the attribute is not specified.
// _blank
// : Load the response into a new unnamed browsing context â usually a new tab or window, depending on the user's browser settings.
// _parent
// : Load the response into the parent browsing context of the current one. If there is no parent, this option behaves the same way as
// _self
// .
// _top
// : Load the response into the top-level browsing context (that is, the browsing context that is an ancestor of the current one, and has no parent). If there is no parent, this option behaves the same way as
// _self
// .
// name
// The name of the button, submitted as a pair with the button's
// value
// as part of the form data, when that button is used to submit the form.
// popovertarget
// Turns a
// <button>
// element into a popover control button; takes the ID of the popover element to control as its value. Establishing a relationship between a popover and its invoker button using the
// popovertarget
// attribute has two additional useful effects:
// The browser creates an implicit
// aria-details
// and
// aria-expanded
// relationship between popover and invoker, and places the popover in a logical position in the keyboard focus navigation order when shown. This makes the popover more accessible to keyboard and assistive technology (AT) users (see also
// Popover accessibility features
// ).
// The browser creates an implicit anchor reference between the two, making it very convenient to position popovers relative to their controls using
// CSS anchor positioning
// . See
// Popover anchor positioning
// for more details.
// popovertargetaction
// Specifies the action to be performed on a popover element being controlled by a control
// <button>
// . Possible values are:
// "hide"
// The button will hide a shown popover. If you try to hide an already hidden popover, no action will be taken.
// "show"
// The button will show a hidden popover. If you try to show an already showing popover, no action will be taken.
// "toggle"
// The button will toggle a popover between showing and hidden. If the popover is hidden, it will be shown; if the popover is showing, it will be hidden. If
// popovertargetaction
// is omitted,
// "toggle"
// is the default action that will be performed by the control button.
// type
// The default behavior of the button. Possible values are:
// submit
// : The button submits the form data to the server. This is the default if the attribute is not specified for buttons associated with a
// <form>
// , or if the attribute is an empty or invalid value.
// reset
// : The button resets all the controls to their initial values, like
// <input type="reset">
// . (This behavior tends to annoy users.)
// button
// : The button has no default behavior, and does nothing when pressed by default. It can have client-side scripts listen to the element's events, which are triggered when the events occur.
// value
// Defines the value associated with the button's
// name
// when it's submitted with the form data. This value is passed to the server in params when the form is submitted using this button.
// Notes
// A submit button with the attribute
// formaction
// set, but without an associated form does nothing. You have to set a form owner, either by wrapping it in a
// <form>
// or set the attribute
// form
// to the id of the form.
// <button>
// elements are much easier to style than
// <input>
// elements. You can add inner HTML content (think
// <i>
// ,
// <br>
// , or even
// <img>
// ), and use
// ::after
// and
// ::before
// pseudo-elements for complex rendering.
// If your buttons are not for submitting form data to a server, be sure to set their
// type
// attribute to
// button
// . Otherwise, they will try to submit form data and to load the (nonexistent) response, possibly destroying the current state of the document.
// While
// <button type="button">
// has no default behavior, event handlers can be scripted to trigger behaviors. An activated button can perform programmable actions using
// JavaScript
// , such as removing an item from a list.
// By default, user agents style buttons as
// display: flow-root
// , which establishes a new
// block formatting context
// and centers the button's children both horizontally and vertically as long as they do not overflow. If the button is defined as a flex or grid container, the children will behave as flex or grid items. A button set to
// display: inline
// will be styled as if the value were set to
// display: inline-block
// .
// Accessibility
// Icon buttons
// Buttons that only display an icon do not have an
// accessible name
// . Accessible names provide information for assistive technology, such as screen readers, to access when they parse the document and generate
// an accessibility tree
// . Assistive technology then uses the accessibility tree to navigate and manipulate page content.
// To give an icon button an accessible name, put text in the
// <button>
// element that concisely describes the button's functionality.
// Examples
// html
// <button name="favorite">
//  <svg fill="#000000" viewBox="0 0 42 42">
//  <path
//  d="M21,1c1.081,0,5.141,12.315,6.201,13.126s13.461,1.053,13.791,2.137 c0.34,1.087-9.561,8.938-9.961,10.252c-0.409,1.307,
//  3.202,13.769,2.331,14.442c-0.879,0.673-11.05-6.79-12.361-6.79 c-1.311,0-11.481,7.463-12.36,6.79c-0.871-0.674,2.739-13.136,
//  2.329-14.442c-0.399-1.313-10.3-9.165-9.96-10.252 c0.33-1.084,12.731-1.326,13.791-2.137S19.91,1,21,1z"></path>
//  </svg>
//  Add to favorites
// </button>
// Result
// If you want to visually hide the button's text, an accessible way to do so is to use
// a combination of CSS properties
// to remove it visually from the screen, but keep it parsable by assistive technology.
// However, it is worth noting that leaving the button text visible can help people who may not be familiar with the icon's meaning or understand the button's purpose. This is especially important for people who are not technologically sophisticated or who may have different cultural interpretations of the icon the button uses.
// What is an accessible name? | The Paciello Group
// MDN Understanding WCAG, Guideline 4.1 explanations
// Understanding Success Criterion 4.1.2 | W3C Understanding WCAG 2.0
// Size and Proximity
// Size
// Interactive elements such as buttons should have an area large enough to be easy to activate. This helps a variety of people, including people with motor control issues and people using non-precise forms of input such as a stylus or fingers. A minimum interactive size of 44Ã44
// CSS pixels
// is recommended.
// Understanding Success Criterion 2.5.5: Target Size | W3C Understanding WCAG 2.1
// Target Size and 2.5.5 | Adrian Roselli
// Quick test: Large touch targets - The A11Y Project
// Proximity
// Large amounts of interactive content â including buttons â placed in close visual proximity to each other should have space separating them. This spacing is beneficial for people who are experiencing motor control issues, who may accidentally activate the wrong interactive content.
// Spacing may be created using CSS properties such as
// margin
// .
// Hand tremors and the giant-button-problem - Axess Lab
// ARIA state information
// To describe the state of a button the correct ARIA attribute to use is
// aria-pressed
// and not
// aria-checked
// or
// aria-selected
// . To find out more read the information about the
// ARIA button role
// .
// Button styles
// It is best not to override the default focus ring for elements that have focus. If the button styles are overridden, it is important to
// ensure that the focus state has enough contrast
// so that people experiencing low vision conditions can perceive it and people with cognitive differences will understand it.
// The
// :focus-visible
// pseudo-class can be used to apply styles to an element that has
// :focus
// only when the user agent's heuristics determine that the focus should be highlighted, such as when a
// <button>
// receives keyboard focus. See
// :focus vs :focus-visible
// for more information.
// Color contrast ratio is determined by comparing the luminosity of the button text and background color values to the background the button is placed on. To meet current
// Web Content Accessibility Guidelines (WCAG)
// , a ratio of 4.5:1 is required for text content and 3:1 for large text. (Large text is defined as 18.66px and
// bold
// or larger, or 24px or larger.)
// WebAIM: Color Contrast Checker
// MDN Understanding WCAG, Guideline 1.4 explanations
// Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0
// Clicking and focus
// Whether clicking on a
// <button>
// or
// <input>
// button types causes it to (by default) become focused varies by browser and OS. Most browsers do give focus to a button being clicked, but
// Safari does not, by design
// .
// Examples
// html
// <button name="button">Press me</button>
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// Interactive content
// ,
// listed
// ,
// labelable
// , and
// submittable
// form-associated
// element, palpable content.
// Permitted content
// Phrasing content
// but there must be no
// Interactive content
// . If the
// <button>
// is the first child of a
// customizable select element
// , then it may also
//  contain zero or one
// <selectedcontent>
// element.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// button
// Permitted ARIA roles
// checkbox
// ,
// combobox
// ,
// link
// ,
// menuitem
// ,
// menuitemcheckbox
// ,
// menuitemradio
// ,
// option
// ,
// radio
// ,
// switch
// ,
// tab
// DOM interface
// HTMLButtonElement
// Specifications
// Specification
// HTML
// #
// the-button-element
// Browser compatibility
