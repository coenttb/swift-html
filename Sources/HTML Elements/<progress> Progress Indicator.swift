//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct ProgressIndicator<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "progress" }
    
    /// This attribute describes how much work the task indicated by the progress element requires. The max attribute, if present, must have a value greater than 0 and be a valid floating point number. The default value is `1`.
    public var max: Max?
    
    /// This attribute specifies how much of the task that has been completed. It must be a valid floating point number between 0 and max, or between 0 and 1 if max is omitted. If there is no value attribute, the progress bar is indeterminate; this indicates that an activity is ongoing with no indication of how long it is expected to take.
    public var value: Double?
    
    public let content: () -> HTML
    
    public init(
        max: Max? = nil,
        value: Double? = nil,
        content: @escaping () -> HTML
    ) {
        self.max = max
        self.value = value
        self.content = content
    }
}

public typealias progress = ProgressIndicator


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress
 */
// <progress>: The Progress Indicator element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <progress>
// HTML
// element displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
// Try it
// <label for="file">File progress:</label>
// <progress id="file" max="100" value="70">70%</progress>
// label {
//  padding-right: 10px;
//  font-size: 1rem;
// }
// Attributes
// This element includes the
// global attributes
// .
// max
// This attribute describes how much work the task indicated by the
// progress
// element requires. The
// max
// attribute, if present, must have a value greater than
// 0
// and be a valid floating point number. The default value is
// 1
// .
// value
// This attribute specifies how much of the task that has been completed. It must be a valid floating point number between
// 0
// and
// max
// , or between
// 0
// and
// 1
// if
// max
// is omitted. If there is no
// value
// attribute, the progress bar is indeterminate; this indicates that an activity is ongoing with no indication of how long it is expected to take.
// Note:
// Unlike the
// <meter>
// element, the minimum value is always 0, and the
// min
// attribute is not allowed for the
// <progress>
// element.
// Note:
// The
// :indeterminate
// pseudo-class can be used to match against indeterminate progress bars. To change the progress bar to indeterminate after giving it a value you must remove the value attribute with
// element.removeAttribute('value')
// .
// Accessibility
// Labelling
// In most cases you should provide an accessible label when using
// <progress>
// . While you can use the standard ARIA labelling attributes
// aria-labelledby
// or
// aria-label
// as you would for any element with
// role="progressbar"
// , when using
// <progress>
// you can alternatively use the
// <label>
// element.
// Note:
// Text placed between the element's tags is not an accessible label, it is only recommended as a fallback for old browsers that do not support this element.
// Examples
// html
// <label>
//  Uploading Document: <progress value="70" max="100">70 %</progress>
// </label>
// <!-- OR -->
// <br />
// <label for="progress-bar">Uploading Document</label>
// <progress id="progress-bar" value="70" max="100">70 %</progress>
// Result
// Describing a particular region
// If the
// <progress>
// element is describing the loading progress of a section of a page, use
// aria-describedby
// to point to the status, and set
// aria-busy="true"
// on the section that is being updated, removing the
// aria-busy
// attribute when it has finished loading.
// Examples
// html
// <div aria-busy="true" aria-describedby="progress-bar">
//  <!-- content is for this region is loading -->
// </div>
// <!-- ... -->
// <progress id="progress-bar" aria-label="Content loadingâ¦"></progress>
// Result
// Examples
// html
// <progress value="70" max="100">70 %</progress>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , labelable content,
// palpable content
// .
// Permitted content
// Phrasing content
// , but there must be no
// <progress>
// element among its
//  descendants.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// progressbar
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLProgressElement
// Specifications
// Specification
// HTML
// #
// the-progress-element
// Browser compatibility
// See also
// Creating vertical form controls
// <meter>
// :indeterminate
// -moz-orient
// ::-moz-progress-bar
// ::-webkit-progress-bar
// ::-webkit-progress-value
// ::-webkit-progress-inner-element