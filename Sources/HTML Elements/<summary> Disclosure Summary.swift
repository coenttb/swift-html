//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct DisclosureSummary<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "summary" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias summary = DisclosureSummary


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/summary
 */
// <summary>: The Disclosure Summary element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// January 2020
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <summary>
// HTML
// element specifies a summary, caption, or legend for a
// <details>
// element's disclosure box. Clicking the
// <summary>
// element toggles the state of the parent
// <details>
// element open and closed.
// Try it
// <details>
//  <summary>
//  I have keys but no doors. I have space but no room. You can enter but canât
//  leave. What am I?
//  </summary>
//  A keyboard.
// </details>
// details {
//  border: 1px solid #aaa;
//  border-radius: 4px;
//  padding: 0.5em 0.5em 0;
// }
// summary {
//  font-weight: bold;
//  margin: -0.5em -0.5em 0;
//  padding: 0.5em;
// }
// details[open] {
//  padding: 0.5em;
// }
// details[open] summary {
//  border-bottom: 1px solid #aaa;
//  margin-bottom: 0.5em;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <summary>
// element's contents can be any heading content, plain text, or HTML that can be used within a paragraph.
// A
// <summary>
// element may
// only
// be used as the first child of a
// <details>
// element. When the user clicks on the summary, the parent
// <details>
// element is toggled open or closed, and then a
// toggle
// event is sent to the
// <details>
// element, which can be used to let you know when this state change occurs.
// The content of the
// <details>
// provides the
// accessible description
// for the
// <summary>
// .
// Default label text
// If a
// <details>
// element's first child is not a
// <summary>
// element, the
// user agent
// will use a default string (typically "Details") as the label for the disclosure box.
// Default style
// Per the HTML specification, the default style for
// <summary>
// elements includes
// display: list-item
// . This makes it possible to change or remove the icon displayed as the disclosure widget next to the label from the default, which is typically a triangle.
// You can also change the style to
// display: block
// to remove the disclosure triangle.
// See the
// Browser compatibility
// section for details, as not all browsers support full functionality of this element yet.
// For WebKit-based browsers, such as Safari, it is possible to control the icon display through the non-standard CSS pseudo-element
// ::-webkit-details-marker
// . To remove the disclosure triangle, use
// summary::-webkit-details-marker { display: none }
// .
// Examples
// Below are some examples showing
// <summary>
// in use. You can find more examples in the documentation for the
// <details>
// element.
// Basic example
// A basic example showing the use of
// <summary>
// in a
// <details>
// element:
// html
// <details open>
//  <summary>Overview</summary>
//  <ol>
//  <li>Cash on hand: $500.00</li>
//  <li>Current invoice: $75.30</li>
//  <li>Due date: 5/6/19</li>
//  </ol>
// </details>
// Result
// Summaries as headings
// You can use heading elements in
// <summary>
// , like this:
// html
// <details open>
//  <summary><h4>Overview</h4></summary>
//  <ol>
//  <li>Cash on hand: $500.00</li>
//  <li>Current invoice: $75.30</li>
//  <li>Due date: 5/6/19</li>
//  </ol>
// </details>
// Result
// This currently has some spacing issues that could be addressed using CSS.
// Warning:
// Because the
// <summary>
// element has a default role of
// button
// (which strips all roles from child elements), this example will not work for users of assistive technologies such as screen readers. The
// <h4>
// will have its role removed and thus will not be treated as a heading for these users.
// HTML in summaries
// This example adds some semantics to the
// <summary>
// element to indicate the label as important:
// html
// <details open>
//  <summary><strong>Overview</strong></summary>
//  <ol>
//  <li>Cash on hand: $500.00</li>
//  <li>Current invoice: $75.30</li>
//  <li>Due date: 5/6/19</li>
//  </ol>
// </details>
// Result
// Changing the summary's icon
// The
// <summary>
// element's marker, the disclosure triangle, can be customized with CSS. The marker can be targeted using the
// ::marker
// pseudo-element. which accepts the
// list-style
// shorthand property and its longhand component properties, such as
// list-style-type
// . This enables changing the triangle to an image (usually with
// list-style-image
// ) or a string (including emojis). In this example, we replace the content of one disclosure widget and remove the icon from another by setting
// list-style: none
// before adding a custom disclosure icon via generated content.
// CSS
// In the first disclosure widget, we style the
// ::marker
// , changing the
// content
// based on the
// <details>
// element's
// [open]
// attribute. For the second widget, we remove the marker with
// list-style
// properties, then add styled generated content with the
// ::after
// pseudo-element. We also include styles for
// ::-webkit-details-marker
// to target Safari. The selector for the browser-specific pseudo-element is included in an
// :is()
// pseudo-class so it doesn't invalidate the selector list.
// css
// details {
//  font-size: 1rem;
//  font-family: "Open Sans", Calibri, sans-serif;
//  border: solid;
//  padding: 2px 6px;
//  margin-bottom: 1em;
// }
// details:first-of-type summary::marker,
// :is(::-webkit-details-marker) {
//  content: "+ ";
//  font-family: monospace;
//  color: red;
//  font-weight: bold;
// }
// details[open]:first-of-type summary::marker {
//  content: "â ";
// }
// details:last-of-type summary {
//  list-style: none;
//  &::after {
//  content: "+";
//  color: white;
//  background-color: darkgreen;
//  border-radius: 1em;
//  font-weight: bold;
//  padding: 0 5px;
//  margin-inline-start: 5px;
//  }
//  [open] &::after {
//  content: "â";
//  }
// }
// details:last-of-type summary::-webkit-details-marker {
//  display: none;
// }
// The CSS includes the
// [open]
// attribute selector
// , matching only when the
// open
// attribute is present (when the
// <details>
// are open). The
// :first-of-type
// and
// :last-of-type
// pseudo-classes target the first and sibling elements of the same type. We included the prefixed
// -webkit-
// pseudo-element within a
// :is()
// pseudo-class as it takes a
// forgiving selector list
// , so if the prefixed pseudo-element is invalid in a browser, the whole selector block will not be invalid. We also used CSS
// nesting
// . See the
// CSS selectors
// module.
// HTML
// html
// <h1>Quotes from Helen Keller</h1>
// <details>
//  <summary>On women's rights</summary>
//  <p>
//  <q>We have prayed, we have coaxed, we have begged, for the vote, with the
//  hope that men, out of chivalry, would bestow equal rights upon women and
//  take them into partnership in the affairs of the state. We hoped that
//  their common sense would triumph over prejudices and stupidity. We thought
//  their boasted sense of justice would overcome the errors that so often
//  fetter the human spirit; but we have always gone away empty-handed. We
//  shall beg no more.</q>
//  </p>
// </details>
// <details>
//  <summary>On optimism</summary>
//  <p>
//  <q>Optimism is the faith that leads to achievement; nothing can be done
//  without hope.</q>
//  </p>
// </details>
// Result
// Technical summary
// Content categories
// none
// Permitted content
// Phrasing content
// , optionally intermixed with
// Heading content
// Tag omission
// None; both the start tag and the end tag are mandatory.
// Permitted parents
// The
// <details>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-summary-element
// Browser compatibility
// See also
// <details>