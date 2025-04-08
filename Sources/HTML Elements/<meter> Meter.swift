//<meter>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meter
//
// <meter>: The HTML Meter element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// October 2018
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <meter>
// HTML
// element represents either a scalar value within a known range or a fractional value.
// Try it
// <label for="fuel">Fuel level:</label>
// <meter id="fuel" min="0" max="100" low="33" high="66" optimum="80" value="50">
//  at 50/100
// </meter>
// label {
//  padding-right: 10px;
//  font-size: 1rem;
// }
// Attributes
// This element includes the
// global attributes
// .
// value
// The current numeric value. This must be between the minimum and maximum values (
// min
// attribute and
// max
// attribute) if they are specified. If unspecified or malformed, the value is
// 0
// . If specified, but not within the range given by the
// min
// attribute and
// max
// attribute, the value is equal to the nearest end of the range.
// Note:
// Unless the
// value
// attribute is between
// 0
// and
// 1
// (inclusive), the
// min
// and
// max
// attributes should define the range so that the
// value
// attribute's value is within it.
// min
// The lower numeric bound of the measured range. This must be less than the maximum value (
// max
// attribute), if specified. If unspecified, the minimum value is
// 0
// .
// max
// The upper numeric bound of the measured range. This must be greater than the minimum value (
// min
// attribute), if specified. If unspecified, the maximum value is
// 1
// .
// low
// The upper numeric bound of the low end of the measured range. This must be greater than the minimum value (
// min
// attribute), and it also must be less than the high value and maximum value (
// high
// attribute and
// max
// attribute, respectively), if any are specified. If unspecified, or if less than the minimum value, the
// low
// value is equal to the minimum value.
// high
// The lower numeric bound of the high end of the measured range. This must be less than the maximum value (
// max
// attribute), and it also must be greater than the low value and minimum value (
// low
// attribute and
// min
// attribute, respectively), if any are specified. If unspecified, or if greater than the maximum value, the
// high
// value is equal to the maximum value.
// optimum
// This attribute indicates the optimal numeric value. It must be within the range (as defined by the
// min
// attribute and
// max
// attribute). When used with the
// low
// attribute and
// high
// attribute, it gives an indication where along the range is considered preferable. For example, if it is between the
// min
// attribute and the
// low
// attribute, then the lower range is considered preferred. The browser may color the meter's bar differently depending on whether the value is less than or equal to the optimum value.
// form
// This optional attribute is used to explicitly set a
// <form>
// owner for the
// <meter>
// element. If omitted, the
// <meter>
// is associated with its ancestor
// <form>
// element or the form association set by the
// form
// attribute on another ancestor element, such as on a
// <fieldset>
// , if any. If included, the value must be the
// id
// of a
// <form>
// in the same tree.
// Examples
// Basic Example
// HTML
// html
// <p>Battery level: <meter min="0" max="100" value="75">75%</meter></p>
// Result
// High and low range example
// Note that in this example the
// min
// attribute is omitted. This is allowed, as it will default to
// 0
// .
// HTML
// html
// <p>
//  Student's exam score:
//  <meter min="0" low="50" high="80" max="100" value="84">84%</meter>
// </p>
// Result
// Technical Summary
// Content categories
// Flow content
// ,
// phrasing content
// , labelable content, palpable content.
// Permitted content
// Phrasing content
// , but there must be no
// <meter>
// element among its
//  descendants.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// meter
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLMeterElement
// Specifications
// Specification
// HTML
// #
// the-meter-element
// Browser compatibility
// See also
// Creating vertical form controls
// <progress>
// ::-webkit-meter-bar
// ,
// ::-webkit-meter-inner-element
// ,
// ::-webkit-meter-even-less-good-value
// ,
// ::-webkit-meter-optimum-value
// ,
// ::-webkit-meter-suboptimum-value
// : non-standard pseudo-elements

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
