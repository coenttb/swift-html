///
/// <br> Line Break.swift
/// swift-html
///
/// Represents the HTML br element for line breaks.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML br element (`<br>`), which produces a line break in text (carriage-return).
///
/// The `BR` struct provides a type-safe way to create HTML line break elements. It is useful for
/// writing content where line breaks are semantically meaningful, such as in poetry or addresses.
///
/// ## Example
///
/// ```swift
/// p {
///     "First line"
///     br()
///     "Second line"
/// }
/// ```
///
/// ## Semantic Usage
///
/// The `<br>` element should only be used when the line break is part of the content's meaning,
/// such as in poetry or an address. Do not use `<br>` to create spacing between paragraphs;
/// instead, use CSS margin properties with appropriate elements like `<p>`.
///
/// - Note: When rendered, this generates an HTML `<br>` element, which creates a line break.
public struct BR: Element  {
    public static var tag: String { "br" }
    
    /// Creates a new BR element with the specified attributes.
    ///
    /// - Parameter attributes: Optional attributes for the br element.
    public init() { }
}

/// Lowercase typealias for creating BR elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `br` identifier when creating
/// HTML br elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// p {
///     "First line"
///     br()
///     "Second line"
/// }
/// ```
public typealias br = BR


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/br
 */
// <br>: The Line Break element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <br>
// HTML
// element produces a line break in text (carriage-return). It is useful for writing a poem or an address, where the division of lines is significant.
// Try it
// <p>
//  Oâer all the hilltops<br />
//  Is quiet now,<br />
//  In all the treetops<br />
//  Hearest thou<br />
//  Hardly a breath;<br />
//  The birds are asleep in the trees:<br />
//  Wait, soon like these<br />
//  Thou too shalt rest.
// </p>
// p {
//  font-size: 1rem;
//  font-family: sans-serif;
//  margin: 20px;
// }
// As you can see from the above example, a
// <br>
// element is included at each point where we want the text to break. The text after the
// <br>
// begins again at the start of the next line of the text block.
// Note:
// Do not use
// <br>
// to create margins between paragraphs; wrap them in
// <p>
// elements and use the
// CSS
// margin
// property to control their size.
// Attributes
// This element's attributes include the
// global attributes
// .
// Deprecated attributes
// clear
// Deprecated
// Indicates where to begin the next line after the break.
// Styling with CSS
// The
// <br>
// element has a single, well-defined purpose â to create a line break in a block of text. As such, it has no dimensions or visual output of its own, and there is very little you can do to style it.
// You can set a
// margin
// on
// <br>
// elements themselves to increase the spacing between the lines of text in the block, but this is a bad practice â you should use the
// line-height
// property that was designed for that purpose.
// Accessibility
// Creating separate paragraphs of text using
// <br>
// is not only bad practice, it is problematic for people who navigate with the aid of screen reading technology. Screen readers may announce the presence of the element, but not any content contained within
// <br>
// s. This can be a confusing and frustrating experience for the person using the screen reader.
// Use
// <p>
// elements, and use CSS properties like
// margin
// to control their spacing.
// Examples
// Basic br
// In the following example we use
// <br>
// elements to create line breaks between the different lines of a postal address:
// html
// Mozilla<br />
// 331 E. Evelyn Avenue<br />
// Mountain View, CA<br />
// 94041<br />
// USA<br />
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// .
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag. In XHTML documents,
//  write this element as
// <br />
// .
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// none
// ,
// presentation
// DOM interface
// HTMLBRElement
// Specifications
// Specification
// HTML
// #
// the-br-element
// Browser compatibility
// See also
// <address>
// element
// <p>
// element
// <wbr>
// element