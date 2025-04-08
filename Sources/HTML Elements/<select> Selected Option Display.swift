//<select>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select
//
// <select>: The HTML Select element
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
// <select>
// HTML
// element represents a control that provides a menu of options.
// Try it
// <label for="pet-select">Choose a pet:</label>
// <select name="pets" id="pet-select">
//  <option value="">--Please choose an option--</option>
//  <option value="dog">Dog</option>
//  <option value="cat">Cat</option>
//  <option value="hamster">Hamster</option>
//  <option value="parrot">Parrot</option>
//  <option value="spider">Spider</option>
//  <option value="goldfish">Goldfish</option>
// </select>
// label {
//  font-family: sans-serif;
//  font-size: 1rem;
//  padding-right: 10px;
// }
// select {
//  font-size: 0.9rem;
//  padding: 2px 5px;
// }
// The above example shows typical
// <select>
// usage. It is given an
// id
// attribute to enable it to be associated with a
// <label>
// for accessibility purposes, as well as a
// name
// attribute to represent the name of the associated data point submitted to the server. Each menu option is defined by an
// <option>
// element nested inside the
// <select>
// .
// Each
// <option>
// element should have a
// value
// attribute containing the data value to submit to the server when that option is selected. If no
// value
// attribute is included, the value defaults to the text contained inside the element. You can include a
// selected
// attribute on an
// <option>
// element to make it selected by default when the page first loads. If no
// selected
// attribute is specified, the first
// <option>
// element will be selected by default.
// A
// <select>
// element is represented in JavaScript by an
// HTMLSelectElement
// object, and this object has a
// value
// property which contains the value of the selected
// <option>
// .
// The
// <select>
// element has some unique attributes you can use to control it, such as
// multiple
// to specify whether multiple options can be selected, and
// size
// to specify how many options should be shown at once. It also accepts most of the general form input attributes such as
// required
// ,
// disabled
// ,
// autofocus
// , etc.
// You can further nest
// <option>
// elements inside
// <optgroup>
// elements to create separate groups of options inside the dropdown. You can also include
// <hr>
// elements to create separators that add visual breaks between options.
// For further examples, see
// The native form widgets: Drop-down content
// .
// Attributes
// This element includes the
// global attributes
// .
// autocomplete
// A string providing a hint for a
// user agent's
// autocomplete feature. See
// The HTML autocomplete attribute
// for a complete list of values and details on how to use autocomplete.
// autofocus
// This Boolean attribute lets you specify that a form control should have input focus when the page loads. Only one form element in a document can have the
// autofocus
// attribute.
// disabled
// This Boolean attribute indicates that the user cannot interact with the control. If this attribute is not specified, the control inherits its setting from the containing element, for example
// <fieldset>
// ; if there is no containing element with the
// disabled
// attribute set, then the control is enabled.
// form
// The
// <form>
// element to associate the
// <select>
// with (its
// form owner
// ). The value of this attribute must be the
// id
// of a
// <form>
// in the same document. (If this attribute is not set, the
// <select>
// is associated with its ancestor
// <form>
// element, if any.)
// This attribute lets you associate
// <select>
// elements to
// <form>
// s anywhere in the document, not just inside a
// <form>
// . It can also override an ancestor
// <form>
// element.
// multiple
// This Boolean attribute indicates that multiple options can be selected in the list. If it is not specified, then only one option can be selected at a time. When
// multiple
// is specified, most browsers will show a scrolling list box instead of a single line dropdown.
// name
// This attribute is used to specify the name of the control.
// required
// A Boolean attribute indicating that an option with a non-empty string value must be selected.
// size
// If the control is presented as a scrolling list box (e.g., when
// multiple
// is specified), this attribute represents the number of rows in the list that should be visible at one time. Browsers are not required to present a select element as a scrolled list box. The default value is
// 0
// .
// Note:
// According to the HTML specification, the default value for size should be
// 1
// ; however, in practice, this has been found to break some websites, and no other browser currently does that, so Mozilla has opted to continue to return
// 0
// for the time being with Firefox.
// Usage notes
// Selecting multiple options
// On a desktop computer, there are a number of ways to select multiple options in a
// <select>
// element with a
// multiple
// attribute:
// Mouse users can hold the
// Ctrl
// ,
// Command
// , or
// Shift
// keys (depending on what makes sense for your operating system) and then click multiple options to select/deselect them.
// Warning:
// The mechanism for selecting multiple non-contiguous items via the keyboard described below currently only seems to work in Firefox.
// On macOS, the
// Ctrl
// +
// Up
// and
// Ctrl
// +
// Down
// shortcuts conflict with the OS default shortcuts for
// Mission Control
// and
// Application windows
// , so you'll have to turn these off before it will work.
// Keyboard users can select multiple contiguous items by:
// Focusing on the
// <select>
// element (e.g., using
// Tab
// ).
// Selecting an item at the top or bottom of the range they want to select using the
// Up
// and
// Down
// cursor keys to go up and down the options.
// Holding down the
// Shift
// key and then using the
// Up
// and
// Down
// cursor keys to increase or decrease the range of items selected.
// Keyboard users can select multiple non-contiguous items by:
// Focusing on the
// <select>
// element (e.g., using
// Tab
// ).
// Holding down the
// Ctrl
// key then using the
// Up
// and
// Down
// cursor keys to change the "focused" select option, i.e., the one that will be selected if you choose to do so. The "focused" select option is highlighted with a dotted outline, in the same way as a keyboard-focused link.
// Pressing
// Space
// to select/deselect "focused" select options.
// Styling with CSS
// The
// <select>
// element has historically been notoriously difficult to style productively with CSS, hence features being introduced to enable creating
// fully customizable select elements
// .
// Legacy select styling
// In browsers that don't support the modern customization features (or legacy codebases where they can't be used), you are limited to manipulating the
// box model
// , the
// displayed font
// , etc. You can also use the
// appearance
// property to remove the default system
// appearance
// .
// It is however, hard to get a consistent result across browsers with traditional
// <select>
// elements. If you want to get full control, you should consider using a library with good facilities for styling form widgets, or try rolling your own dropdown menu using non-semantic elements, JavaScript, and
// WAI-ARIA
// to provide semantics.
// You can use the
// :open
// pseudo-class to style
// <select>
// elements in the open state, that is, when the drop-down options list is displayed. This doesn't apply to multi-line
// <select>
// elements (those with the
// multiple
// attribute set) â they tend to render as a scrolling list box rather than a drop-down, so don't have an open state.
// For more information on legacy
// <select>
// styling, see:
// Styling HTML forms
// Advanced styling for HTML forms
// The
// field-sizing
// property, which controls how
// <select>
// elements are sized in relation to their contained options.
// Accessibility
// The
// <hr>
// within a
// <select>
// should be considered purely decorative, as they are currently not exposed within the accessibility tree and therefore not exposed to assistive technologies.
// Examples
// Basic select
// The following example creates a three-value dropdown menu, the second option of which is selected by default.
// html
// <!-- The second value will be selected initially -->
// <select name="choice">
//  <option value="first">First Value</option>
//  <option value="second" selected>Second Value</option>
//  <option value="third">Third Value</option>
// </select>
// Result
// Select with grouping options
// The following example creates a dropdown menu with grouping using
// <optgroup>
// and
// <hr>
// to make it easier for the user to understand the content in the dropdown.
// html
// <label for="hr-select">Your favorite food</label> <br />
// <select name="foods" id="hr-select">
//  <option value="">Choose a food</option>
//  <hr />
//  <optgroup label="Fruit">
//  <option value="apple">Apples</option>
//  <option value="banana">Bananas</option>
//  <option value="cherry">Cherries</option>
//  <option value="damson">Damsons</option>
//  </optgroup>
//  <hr />
//  <optgroup label="Vegetables">
//  <option value="artichoke">Artichokes</option>
//  <option value="broccoli">Broccoli</option>
//  <option value="cabbage">Cabbages</option>
//  </optgroup>
//  <hr />
//  <optgroup label="Meat">
//  <option value="beef">Beef</option>
//  <option value="chicken">Chicken</option>
//  <option value="pork">Pork</option>
//  </optgroup>
//  <hr />
//  <optgroup label="Fish">
//  <option value="cod">Cod</option>
//  <option value="haddock">Haddock</option>
//  <option value="salmon">Salmon</option>
//  <option value="turbot">Turbot</option>
//  </optgroup>
// </select>
// Result
// Advanced select with multiple features
// The follow example is more complex, showing off more features you can use on a
// <select>
// element:
// html
// <label>
//  Please choose one or more pets:
//  <select name="pets" multiple size="4">
//  <optgroup label="4-legged pets">
//  <option value="dog">Dog</option>
//  <option value="cat">Cat</option>
//  <option value="hamster" disabled>Hamster</option>
//  </optgroup>
//  <optgroup label="Flying pets">
//  <option value="parrot">Parrot</option>
//  <option value="macaw">Macaw</option>
//  <option value="albatross">Albatross</option>
//  </optgroup>
//  </select>
// </label>
// Result
// You'll see that:
// Multiple options are selectable because we've included the
// multiple
// attribute.
// The
// size
// attribute causes only 4 lines to display at a time; you can scroll to view all the options.
// We've included
// <optgroup>
// elements to divide the options up into different groups. This is a purely visual grouping, its visualization generally consists of the group name being bolded, and the options being indented.
// The "Hamster" option includes a
// disabled
// attribute and therefore can't be selected at all.
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// interactive content
// ,
// listed
// ,
// labelable
// ,
// resettable
// , and
// submittable
// form-associated
// element
// Permitted content
// Zero or more
// <option>
// ,
// <optgroup>
// , or
// <hr>
// elements in traditional
// <select>
// elements. In
// customizable select elements
// :
// The select
// <button>
// is optionally included as a child
// <button>
// element with a nested
// <selectedcontent>
// element.
// The drop-down picker is defined as any other content, which can include zero or more
// <option>
// ,
// <optgroup>
// ,
// <hr>
// ,
// <div>
// ,
// <script>
// ,
// <template>
// , and
// <noscript>
// elements.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// combobox
// with
// no
// multiple
// attribute and
// no
// size
// attribute greater than 1, otherwise
// listbox
// Permitted ARIA roles
// menu
// with
// no
// multiple
// attribute and
// no
// size
// attribute greater than 1, otherwise no
// role
// permitted
// DOM interface
// HTMLSelectElement
// Specifications
// Specification
// HTML
// #
// the-select-element
// Browser compatibility
// See also
// Events fired by
// <select>
// :
// change
// ,
// input
// The
// <option>
// element
// The
// <optgroup>
// element
// Customizable select elements

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
