//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct PreformattedText<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "pre" }
    
    public let content: () -> HTML
    
    @available(*, deprecated)
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias pre = PreformattedText


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/pre
 */
// <pre>: The Preformatted Text element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <pre>
// HTML
// element represents preformatted text which is to be presented exactly as written in the HTML file. The text is typically rendered using a non-proportional, or
// monospaced
// font.
// Whitespace inside this element is displayed as written, with one exception. If one or more leading newline characters are included immediately following the opening
// <pre>
// tag, the
// first
// newline character is stripped.
// <pre>
// elements' text content is parsed as HTML, so if you want to ensure that your text content stays as plain text, some syntax characters, such as
// <
// , may need to be escaped using their respective
// character references
// . See
// escaping ambiguous characters
// for more information.
// <pre>
// elements commonly contain
// <code>
// ,
// <samp>
// , and
// <kbd>
// elements, to represent computer code, computer output, and user input, respectively.
// By default,
// <pre>
// is a
// block-level
// element, i.e., its default
// display
// value is
// block
// .
// Try it
// <pre>
//  S
//  A
//  LUT
//  M
//  O N
//  D E
//  DONT
//  E SUIS
//  LA LAN
//  G U E Ã
//  L O Q U E N
//  TE QUESA
//  B O U C H E
//  O P A R I S
//  T I R E ET TIRERA
//  T O U JOURS
//  AUX A L
//  LEM ANDS - Apollinaire
// </pre>
// pre {
//  font-size: 0.7rem;
//  margin: 0;
// }
// Attributes
// This element only includes the
// global attributes
// .
// width
// Deprecated
// Non-standard
// Contains the
// preferred
// count of characters that a line should have. Though technically still implemented, this attribute has no visual effect; to achieve such an effect, use CSS
// width
// instead.
// wrap
// Non-standard
// Deprecated
// Is a
// hint
// indicating how the overflow must happen. In modern browser this hint is ignored and no visual effect results in its present; to achieve such an effect, use CSS
// white-space
// instead.
// Accessibility
// It is important to provide an alternate description for any images or diagrams created using preformatted text. The alternate description should clearly and concisely describe the image or diagram's content.
// People experiencing low vision conditions and browsing with the aid of assistive technology such as a screen reader may not understand what the preformatted text characters are representing when they are read out in sequence.
// A combination of the
// <figure>
// and
// <figcaption>
// elements, supplemented by the
// ARIA
// role
// and
// aria-label
// attributes on the
// pre
// element allow the preformatted
// ASCII
// art to be announced as an image with alternative text, and the
// figcaption
// serving as the image's caption.
// Example
// html
// <figure>
//  <pre role="img" aria-label="ASCII COW">
//  ___________________________
//  &lt; I'm an expert in my field. &gt;
//  ---------------------------
//  \ ^__^
//  \ (oo)\_______
//  (__)\ )\/\
//  ||----w |
//  || ||
//  </pre>
//  <figcaption id="cow-caption">
//  A cow saying, "I'm an expert in my field." The cow is illustrated using
//  preformatted text characters.
//  </figcaption>
// </figure>
// MDN Understanding WCAG, Guideline 1.1 explanations
// H86: Providing text alternatives for ASCII art, emoticons, and leetspeak | W3C Techniques for WCAG 2.0
// Examples
// Basic example
// HTML
// html
// <p>Using CSS to change the font color is easy.</p>
// <pre><code>
// body {
//  color: red;
// }
// </code></pre>
// Result
// Escaping ambiguous characters
// Suppose you want to demonstrate HTML code in a
// <pre>
// element. The character sequences that define valid HTML tags (starting with
// <
// and ending with
// >
// ) will not be displayed. To display the tag characters as text, you need to escape (at least) the
// <
// character using its character reference, so that the sequences no longer define valid tags.
// In reality, the HTML parser treats most characters as plain text unless in specific contexts. For example,
// < code
// is fine, but
// <code
// would be misparsed;
// &am;
// is fine, but
// &amp;
// is not. However, it's a good practice to escape all ambiguous characters to avoid any confusion, especially if you are programmatically generating HTML and injecting the
// <pre>
// content. In this case, here's a good rule of thumb for how to escape characters:
// First, write the content out, as you would like it to appear in the HTML document.
// Replace any ampersands (
// &
// ) with
// &amp;
// . Do this step first, so that new
// &
// characters generated in the next step don't get escaped.
// Replace any
// <
// characters with
// &lt;
// .
// This should result in the content being displayed as you intended. The replacement of other HTML syntax characters is optional (like
// >
// to
// &gt;
// ,
// "
// to
// &quot;
// , and
// '
// to
// &apos;
// ), but will do no harm.
// HTML
// html
// <pre><code>
// let i = 5;
// if (i &lt; 10 &amp;&amp; i &gt; 0)
//  return &quot;Single Digit Number&quot;
// </code></pre>
// Result
// Technical summary
// Content categories
// Flow content
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// generic
// Permitted ARIA roles
// Any
// DOM interface
// HTMLPreElement
// Specifications
// Specification
// HTML
// #
// the-pre-element
// Browser compatibility
// See also
// CSS:
// white-space
// ,
// word-break
// Character reference
// Related element:
// <code>
// ,
// <samp>
// ,
// <kbd>