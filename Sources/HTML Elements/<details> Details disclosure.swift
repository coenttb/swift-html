//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Details<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "details" }
    
    public var open: Open?
    public var name: Name?
    public let content: () -> HTML
    
    public init(
        open: Open? = nil,
        name: Name? = nil,
        content: @escaping () -> HTML
    ) {
        self.open = open
        self.name = name
        self.content = content
    }
}

public typealias details = Details



/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details
 */
// <details>: The Details disclosure element
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
// <details>
// HTML
// element creates a disclosure widget in which information is visible only when the widget is toggled into an open state. A summary or label must be provided using the
// <summary>
// element.
// A disclosure widget is typically presented onscreen using a small triangle that rotates (or twists) to indicate open/closed state, with a label next to the triangle. The contents of the
// <summary>
// element are used as the label for the disclosure widget. The contents of the
// <details>
// provide the
// accessible description
// for the
// <summary>
// .
// Try it
// <details>
//  <summary>Details</summary>
//  Something small enough to escape casual notice.
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
// A
// <details>
// widget can be in one of two states. The default
// closed
// state displays only the triangle and the label inside
// <summary>
// (or a
// user agent
// -defined default string if no
// <summary>
// ).
// When the user clicks on the widget or focuses it then presses the space bar, it "twists" open, revealing its contents. The common use of a triangle which rotates or twists around to represent opening or closing the widget is why these are sometimes called "twisty".
// You can use CSS to style the disclosure widget, and you can programmatically open and close the widget by setting/removing its
// open
// attribute. Unfortunately, at this time, there's no built-in way to animate the transition between open and closed.
// By default when closed, the widget is only tall enough to display the disclosure triangle and summary. When open, it expands to display the details contained within.
// Fully standards-compliant implementations automatically apply the CSS
// display
// : list-item
// to the
// <summary>
// element. You can use this or the
// ::marker
// pseudo-element to
// customize the disclosure widget
// .
// Attributes
// This element includes the
// global attributes
// .
// open
// This Boolean attribute indicates whether the details â that is, the contents of the
// <details>
// element â are currently visible. The details are shown when this attribute exists, or hidden when this attribute is absent. By default this attribute is absent which means the details are not visible.
// Note:
// You have to remove this attribute entirely to make the details hidden.
// open="false"
// makes the details visible because this attribute is Boolean.
// name
// This attribute enables multiple
// <details>
// elements to be connected, with only one open at a time. This allows developers to easily create UI features such as accordions without scripting.
// The
// name
// attribute specifies a group name â give multiple
// <details>
// elements the same
// name
// value to group them. Only one of the grouped
// <details>
// elements can be open at a time â opening one will cause another to close. If multiple grouped
// <details>
// elements are given the
// open
// attribute, only the first one in the source order will be rendered open.
// Note:
// <details>
// elements don't have to be adjacent to one another in the source to be part of the same group.
// Events
// In addition to the usual events supported by HTML elements, the
// <details>
// element supports the
// toggle
// event, which is dispatched to the
// <details>
// element whenever its state changes between open and closed. It is sent
// after
// the state is changed, although if the state changes multiple times before the browser can dispatch the event, the events are coalesced so that only one is sent.
// You can use an event listener for the
// toggle
// event to detect when the widget changes state:
// js
// details.addEventListener("toggle", (event) => {
//  if (details.open) {
//  /* the element was toggled open */
//  } else {
//  /* the element was toggled closed */
//  }
// });
// Examples
// A basic disclosure example
// This example shows a basic
// <details>
// element with a
// <summary>
// .
// html
// <details>
//  <summary>System Requirements</summary>
//  <p>
//  Requires a computer running an operating system. The computer must have some
//  memory and ideally some kind of long-term storage. An input device as well
//  as some form of output device is recommended.
//  </p>
// </details>
// Result
// Creating an open disclosure box
// To start the
// <details>
// box in its open state, add the Boolean
// open
// attribute:
// html
// <details open>
//  <summary>System Requirements</summary>
//  <p>
//  Requires a computer running an operating system. The computer must have some
//  memory and ideally some kind of long-term storage. An input device as well
//  as some form of output device is recommended.
//  </p>
// </details>
// Result
// Multiple named disclosure boxes
// We include several
// <details>
// boxes, all with the same name so only one can be open at a time:
// html
// <details name="reqs">
//  <summary>Graduation Requirements</summary>
//  <p>
//  Requires 40 credits, including a passing grade in health, geography,
//  history, economics, and wood shop.
//  </p>
// </details>
// <details name="reqs">
//  <summary>System Requirements</summary>
//  <p>
//  Requires a computer running an operating system. The computer must have some
//  memory and ideally some kind of long-term storage. An input device as well
//  as some form of output device is recommended.
//  </p>
// </details>
// <details name="reqs">
//  <summary>Job Requirements</summary>
//  <p>
//  Requires knowledge of HTML, CSS, JavaScript, accessibility, web performance,
//  privacy, security, and internationalization, as well as a dislike of
//  broccoli.
//  </p>
// </details>
// Result
// Try opening all the disclosure widgets. When you open one, all the others automatically close.
// Customizing the appearance
// Now let's apply some CSS to customize the appearance of the disclosure box.
// CSS
// css
// details {
//  font:
//  16px "Open Sans",
//  Calibri,
//  sans-serif;
//  width: 620px;
// }
// details > summary {
//  padding: 2px 6px;
//  width: 15em;
//  background-color: #ddd;
//  border: none;
//  box-shadow: 3px 3px 4px black;
//  cursor: pointer;
// }
// details > p {
//  border-radius: 0 0 10px 10px;
//  background-color: #ddd;
//  padding: 2px 6px;
//  margin: 0;
//  box-shadow: 3px 3px 4px black;
// }
// details:open > summary {
//  background-color: #ccf;
// }
// This CSS creates a look similar to a tabbed interface, where clicking the tab opens it to reveal its contents.
// Note:
// In browsers that don't support the
// :open
// pseudo-class, you can use the attribute selector
// details[open]
// to style the
// <details>
// element when it is in the open state.
// HTML
// html
// <details>
//  <summary>System Requirements</summary>
//  <p>
//  Requires a computer running an operating system. The computer must have some
//  memory and ideally some kind of long-term storage. An input device as well
//  as some form of output device is recommended.
//  </p>
// </details>
// Result
// See the
// <summary>
// page for an
// example of customizing the disclosure widget
// .
// Technical summary
// Content categories
// Flow content
// , sectioning root, interactive content, palpable content.
// Permitted content
// One
// <summary>
// element followed by
// flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// group
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLDetailsElement
// Specifications
// Specification
// HTML
// #
// the-details-element
// Browser compatibility
// See also
// <summary>