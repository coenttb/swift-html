//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct StrongImportance<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "strong" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias strong = StrongImportance


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/strong
 */
// <strong>: The Strong Importance element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <strong>
// HTML
// element indicates that its contents have strong importance, seriousness, or urgency. Browsers typically render the contents in bold type.
// Try it
// <p>
//  ... the most important rule, the rule you can never forget, no matter how much
//  he cries, no matter how much he begs:
//  <strong>never feed him after midnight</strong>.
// </p>
// p {
//  font-size: 1rem;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <strong>
// element is for content that is of "strong importance," including things of great seriousness or urgency (such as warnings). This could be a sentence that is of great importance to the whole page, or you could merely try to point out that some words are of greater importance compared to nearby content.
// Typically this element is rendered by default using a bold font weight. However, it should
// not
// be used to apply bold styling; use the CSS
// font-weight
// property for that purpose. Use the
// <b>
// element to draw attention to certain text without indicating a higher level of importance. Use the
// <em>
// element to mark text that has stress emphasis.
// Another accepted use for
// <strong>
// is to denote the labels of paragraphs which represent notes or warnings within the text of a page.
// <b> vs. <strong>
// It is often confusing to new developers why there are so many ways to express the same thing on a rendered website.
// <b>
// and
// <strong>
// are perhaps one of the most common sources of confusion, causing developers to ask "Should I use
// <b>
// or
// <strong>
// ? Don't they both do the same thing?"
// Not exactly. The
// <strong>
// element is for content that is of greater importance, while the
// <b>
// element is used to draw attention to text without indicating that it's more important.
// It may help to realize that both are valid and semantic elements in HTML and that it's a coincidence that they both have the same default styling (boldface) in most browsers (although some older browsers actually underline
// <strong>
// ). Each element is meant to be used in certain types of scenarios, and if you want to bold text for decoration, you should instead actually use the CSS
// font-weight
// property.
// The intended meaning or purpose of the enclosed text should be what determines which element you use. Communicating meaning is what semantics are all about.
// <em> vs. <strong>
// Adding to the confusion is the fact that while HTML 4 defined
// <strong>
// as indicating a stronger emphasis, HTML 5 defines
// <strong>
// as representing "strong importance for its contents." This is an important distinction to make.
// While
// <em>
// is used to change the meaning of a sentence as spoken emphasis does ("I
// love
// carrots" vs. "I love
// carrots
// "),
// <strong>
// is used to give portions of a sentence added importance (e.g., "
// Warning!
// This is
// very dangerous.
// ") Both
// <strong>
// and
// <em>
// can be nested to increase the relative degree of importance or stress emphasis, respectively.
// Examples
// Basic example
// html
// <p>
//  Before proceeding, <strong>make sure you put on your safety goggles</strong>.
// </p>
// Result
// Labeling warnings
// html
// <p>
//  <strong>Important:</strong> Before proceeding, make sure you add plenty of
//  butter.
// </p>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// None; must have both a start tag and an end tag.
// Permitted parents
// Any element that accepts
// phrasing content
// , or any element that accepts
// flow content
// .
// Implicit ARIA role
// strong
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-strong-element
// Browser compatibility
// See also
// The
// <b>
// element
// The
// <em>
// element
// The
// font-weight
// property