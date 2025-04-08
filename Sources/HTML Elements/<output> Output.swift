//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes


public struct Output<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "output" }
    
    public var `for`: For?
    public var form: HTML_Attributes.Form.ID?
    public var name: Name?
    
    public init(
        form: HTML_Attributes.Form.ID? = nil,
        name: Name? = nil
    ) {
        self.form = form
        self.name = name
    }
}

public typealias output = Output



/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output
 */
// <output>: The Output element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// October 2018
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <output>
// HTML
// element is a container element into which a site or app can inject the results of a calculation or the outcome of a user action.
// Attributes
// This element includes the
// global attributes
// .
// for
// A space-separated list of other elements'
// id
// s, indicating that those elements contributed input values to (or otherwise affected) the calculation.
// form
// The
// <form>
// element to associate the output with (its
// form owner
// ). The value of this attribute must be the
// id
// of a
// <form>
// in the same document. (If this attribute is not set, the
// <output>
// is associated with its ancestor
// <form>
// element, if any.)
// This attribute lets you associate
// <output>
// elements to
// <form>
// s anywhere in the document, not just inside a
// <form>
// . It can also override an ancestor
// <form>
// element. The
// <output>
// element's name and content are not submitted when the form is submitted.
// name
// The element's name. Used in the
// form.elements
// API.
// The
// <output>
// value, name, and contents are NOT submitted during form submission.
// Accessibility
// Many browsers implement this element as an
// aria-live
// region. Assistive technology will thereby announce the results of UI interactions posted inside it without requiring that focus is switched away from the controls that produce those results.
// Examples
// In the following example, the form provides a slider whose value can range between
// 0
// and
// 100
// , and an
// <input>
// element into which you can enter a second number. The two numbers are added together, and the result is displayed in the
// <output>
// element each time the value of any of the controls changes.
// html
// <form id="example-form">
//  <input type="range" id="b" name="b" value="50" /> +
//  <input type="number" id="a" name="a" value="10" /> =
//  <output name="result" for="a b">60</output>
// </form>
// js
// const form = document.getElementById("example-form");
// const a = form.elements["a"];
// const b = form.elements["b"];
// const result = form.elements["result"];
// function updateResult() {
//  const aValue = parseInt(a.value);
//  const bValue = parseInt(b.value);
//  result.value = aValue + bValue;
// }
// form.addEventListener("input", updateResult);
// updateResult();
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// listed
// ,
// labelable
// ,
// resettable
// form-associated element
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// status
// Permitted ARIA roles
// Any
// DOM interface
// HTMLOutputElement
// Specifications
// Specification
// HTML
// #
// the-output-element
// Browser compatibility