//<fieldset>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset
//
// <fieldset>: The Field Set element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <fieldset>
// HTML
// element is used to group several controls as well as labels (
// <label>
// ) within a web form.
// Try it
// <form>
//  <fieldset>
//  <legend>Choose your favorite monster</legend>
//  <input type="radio" id="kraken" name="monster" value="K" />
//  <label for="kraken">Kraken</label><br />
//  <input type="radio" id="sasquatch" name="monster" value="S" />
//  <label for="sasquatch">Sasquatch</label><br />
//  <input type="radio" id="mothman" name="monster" value="M" />
//  <label for="mothman">Mothman</label>
//  </fieldset>
// </form>
// legend {
//  background-color: #000;
//  color: #fff;
//  padding: 3px 6px;
// }
// input {
//  margin: 0.4rem;
// }
// As the example above shows, the
// <fieldset>
// element provides a grouping for a part of an HTML form, with a nested
// <legend>
// element providing a caption for the
// <fieldset>
// . It takes few attributes, the most notable of which are
// form
// , which can contain the
// id
// of a
// <form>
// on the same page, allowing you to make the
// <fieldset>
// part of that
// <form>
// even if it is not nested inside it, and
// disabled
// , which allows you to disable the
// <fieldset>
// and all its contents in one go.
// Attributes
// This element includes the
// global attributes
// .
// disabled
// If this Boolean attribute is set, all form controls that are descendants of the
// <fieldset>
// , are disabled, meaning they are not editable and won't be submitted along with the
// <form>
// . They won't receive any browsing events, like mouse clicks or focus-related events. By default browsers display such controls grayed out. Note that form elements inside the
// <legend>
// element won't be disabled.
// form
// This attribute takes the value of the
// id
// attribute of a
// <form>
// element you want the
// <fieldset>
// to be part of, even if it is not inside the form. Please note that usage of this is confusing â if you want the
// <input>
// elements inside the
// <fieldset>
// to be associated with the form, you need to use the
// form
// attribute directly on those elements. You can check which elements are associated with a form via JavaScript, using
// HTMLFormElement.elements
// .
// name
// The name associated with the group.
// Note:
// The caption for the fieldset is given by the first
// <legend>
// element nested inside it.
// Styling with CSS
// There are several special styling considerations for
// <fieldset>
// .
// Its
// display
// value is
// block
// by default, and it establishes a
// block formatting context
// . If the
// <fieldset>
// is styled with an inline-level
// display
// value, it will behave as
// inline-block
// , otherwise it will behave as
// block
// . By default there is a
// 2px
// groove
// border surrounding the contents, and a small amount of default padding. The element has
// min-inline-size: min-content
// by default.
// If a
// <legend>
// is present, it is placed over the
// block-start
// border. The
// <legend>
// shrink-wraps, and also establishes a formatting context. The
// display
// value is blockified. (For example,
// display: inline
// behaves as
// block
// .)
// There will be an anonymous box holding the contents of the
// <fieldset>
// , which inherits certain properties from the
// <fieldset>
// . If the
// <fieldset>
// is styled with
// display: grid
// or
// display: inline-grid
// , then the anonymous box will be a grid formatting context. If the
// <fieldset>
// is styled with
// display: flex
// or
// display: inline-flex
// , then the anonymous box will be a flex formatting context. Otherwise, it establishes a block formatting context.
// You can feel free to style the
// <fieldset>
// and
// <legend>
// in any way you want to suit your page design.
// Examples
// Basic fieldset
// This example includes a
// <fieldset>
// with a
// <legend>
// , with a single control inside it.
// html
// <form action="#">
//  <fieldset>
//  <legend>Do you agree?</legend>
//  <input type="checkbox" id="chbx" name="agree" value="Yes!" />
//  <label for="chbx">I agree</label>
//  </fieldset>
// </form>
// Result
// Disabled fieldset
// This example shows a disabled
// <fieldset>
// with two controls inside it. Note how both the controls are disabled due to being inside a disabled
// <fieldset>
// .
// html
// <form action="#">
//  <fieldset disabled>
//  <legend>Disabled login fieldset</legend>
//  <div>
//  <label for="name">Name: </label>
//  <input type="text" id="name" value="Chris" />
//  </div>
//  <div>
//  <label for="pwd">Archetype: </label>
//  <input type="password" id="pwd" value="Wookie" />
//  </div>
//  </fieldset>
// </form>
// Result
// Technical summary
// Content categories
// Flow content
// ,
//  sectioning root,
// listed
// ,
// form-associated
// element, palpable content.
// Permitted content
// An optional
// <legend>
// element, followed by flow
//  content.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// group
// Permitted ARIA roles
// radiogroup
// ,
// presentation
// ,
// none
// DOM interface
// HTMLFieldSetElement
// Specifications
// Specification
// HTML
// #
// the-fieldset-element
// Browser compatibility
// See also
// The
// <legend>
// element
// The
// <input>
// element
// The
// <label>
// element
// The
// <form>
// element

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
