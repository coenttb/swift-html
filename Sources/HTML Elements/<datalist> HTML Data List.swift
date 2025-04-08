///
/// <datalist> HTML Data List.swift
/// swift-html
///
/// Represents the HTML datalist element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML datalist element (`<datalist>`), which contains a set of predefined options 
/// for use with form inputs.
///
/// The `DataList` struct provides a type-safe way to create HTML datalist elements. The `<datalist>` 
/// element is used to provide an autocomplete feature for form inputs by suggesting predefined options 
/// that the user can select from while still allowing free-form input.
///
/// ## Example
///
/// ```swift
/// // Input with associated datalist
/// input(
///     type: .text,
///     id: "ice-cream-choice",
///     name: "ice-cream-choice",
///     list: "ice-cream-flavors"
/// )
/// 
/// // Datalist with options
/// datalist(id: "ice-cream-flavors") {
///     option(value: "Chocolate")
///     option(value: "Coconut")
///     option(value: "Mint")
///     option(value: "Strawberry")
///     option(value: "Vanilla")
/// }
/// ```
///
/// ## Usage Notes
///
/// - The `<datalist>` element must be associated with an input element using the `list` attribute
/// - The `<datalist>` element requires an `id` attribute to establish this association
/// - Contains `<option>` elements that represent the suggested values
/// - Unlike `<select>`, allows users to enter values not in the predefined list
/// - Works with many input types: text, search, url, tel, email, number, range, color, date, etc.
///
/// ## Best Practices
///
/// - Always provide an `id` attribute to enable association with input elements
/// - Include meaningful, frequently-used values as options
/// - For better accessibility, ensure inputs have associated labels
/// - Consider browser compatibility, as the appearance and behavior may vary
///
/// ## Accessibility Considerations
///
/// - The font size of datalist options may not scale with browser zoom settings
/// - Limited styling options for the suggestion dropdown
/// - Some screen reader/browser combinations may not announce the dropdown contents
///
/// - Note: When rendered, this generates an HTML `<datalist>` element containing option elements.
public struct DataList<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "datalist" }
    
    /// The content of the datalist, typically option elements
    public let content: () -> HTML
    
    /// Creates a new DataList element with the specified attributes and content.
    ///
    /// - Parameters:
    ///   - content: The content of the datalist, typically option elements
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating DataList elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `datalist` identifier when creating
/// HTML datalist elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// datalist {
///     option(value: "Chrome")
///     option(value: "Firefox")
///     option(value: "Safari")
/// }
/// ```
public typealias datalist = DataList


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/datalist
 */
// <datalist>: The HTML Data List element
// Limited availability
// This feature is not Baseline because it does not work in some of the most widely-used browsers.
// Learn more
// See full compatibility
// Report feedback
// The
// <datalist>
// HTML
// element contains a set of
// <option>
// elements that represent the permissible or recommended options available to choose from within other controls.
// Try it
// <label for="ice-cream-choice">Choose a flavor:</label>
// <input list="ice-cream-flavors" id="ice-cream-choice" name="ice-cream-choice" />
// <datalist id="ice-cream-flavors">
//  <option value="Chocolate"></option>
//  <option value="Coconut"></option>
//  <option value="Mint"></option>
//  <option value="Strawberry"></option>
//  <option value="Vanilla"></option>
// </datalist>
// label {
//  display: block;
//  margin-bottom: 10px;
// }
// To bind the
// <datalist>
// element to the control, we give it a unique identifier in the
// id
// attribute, and then add the
// list
// attribute to the
// <input>
// element with the same identifier as value.
// Only certain types of
// <input>
// support this behavior, and it can also vary from browser to browser.
// Each
// <option>
// element should have a
// value
// attribute, which represents a suggestion to be entered into the input. It can also have a
// label
// attribute, or, missing that, some text content, which may be displayed by the browser instead of
// value
// (Firefox), or in addition to
// value
// (Chrome and Safari, as supplemental text). The exact content of the drop-down menu depends on the browser, but when clicked, content entered into control field will always come from the
// value
// attribute.
// Note:
// <datalist>
// is not a replacement for
// <select>
// . A
// <datalist>
// does not represent an input itself; it is a list of suggested values for an associated control. The control can still accept any value that passes validation, even if it is not in this suggestion list.
// Attributes
// This element has no other attributes than the
// global attributes
// , common to all elements.
// Accessibility
// When deciding to use the
// <datalist>
// element, here are some accessibility issues to be mindful of:
// The font size of the data list's options does not zoom, always remaining the same size. The contents of the autosuggest do not grow or shrink when the rest of the contents are zoomed in or out.
// As targeting the list of options with CSS is very limited to non-existent, rendering can not be styled for high-contrast mode.
// Some screen reader/browser combinations, including NVDA and Firefox, do not announce the contents of the autosuggest popup.
// Examples
// Textual types
// Recommended values in types
// text
// ,
// search
// ,
// url
// ,
// tel
// ,
// email
// and
// number
// , are displayed in a drop-down menu when user clicks or double-clicks on the control.
// Typically the right side of a control will also have an arrow pointing to the presence of predefined values.
// html
// <label for="myBrowser">Choose a browser from this list:</label>
// <input list="browsers" id="myBrowser" name="myBrowser" />
// <datalist id="browsers">
//  <option value="Chrome"></option>
//  <option value="Firefox"></option>
//  <option value="Opera"></option>
//  <option value="Safari"></option>
//  <option value="Microsoft Edge"></option>
// </datalist>
// Date and Time types
// The types
// month
// ,
// week
// ,
// date
// ,
// time
// and
// datetime-local
// can show an interface that allows a convenient selection of a date and time.
// Predefined values can be shown there, allowing the user to quickly fill the control value.
// Note:
// When these types are not supported, a basic
// text
// type will be rendered instead, creating a text field. That field will correctly recognize recommended values and display them to the user in a drop-down menu.
// html
// <input type="time" list="popularHours" />
// <datalist id="popularHours">
//  <option value="12:00"></option>
//  <option value="13:00"></option>
//  <option value="14:00"></option>
// </datalist>
// Range type
// The recommended values in the
// range
// type will be shown as series of hash marks that the user can easily select.
// html
// <label for="tick">Tip amount:</label>
// <input type="range" list="tickmarks" min="0" max="100" id="tick" name="tick" />
// <datalist id="tickmarks">
//  <option value="0"></option>
//  <option value="10"></option>
//  <option value="20"></option>
//  <option value="30"></option>
// </datalist>
// Color type
// The
// color
// type can show predefined colors in a browser-provided interface.
// html
// <label for="colors">Pick a color (preferably a red tone):</label>
// <input type="color" list="redColors" id="colors" />
// <datalist id="redColors">
//  <option value="#800000"></option>
//  <option value="#8B0000"></option>
//  <option value="#A52A2A"></option>
//  <option value="#DC143C"></option>
// </datalist>
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// .
// Permitted content
// Either
// phrasing content
// or zero or more
// <option>
// elements.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// listbox
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLDataListElement
// Specifications
// Specification
// HTML
// #
// the-datalist-element
// Browser compatibility
// See also
// The
// <input>
// element, and more specifically its
// list
// attribute;
// The
// <option>
// element.