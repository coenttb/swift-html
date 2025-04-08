///
/// <bdi> Bidirectional Isolate.swift
/// swift-html
///
/// Represents the HTML bidirectional isolate element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML bidirectional isolate element (`<bdi>`), which isolates a span of text that might
/// be formatted in a different direction from other text outside it.
///
/// The `BidirectionalIsolate` struct provides a type-safe way to create HTML bidirectional isolate elements.
/// This element is particularly useful when embedding user-generated content with unknown directionality.
///
/// ## Example
///
/// ```swift
/// bdi {
///     "User-generated content with possibly different directionality"
/// }
/// ```
///
/// ## Use Cases
///
/// - Displaying user names or other user-generated content that might contain text 
///   in languages with right-to-left (RTL) script like Arabic or Hebrew
/// - Preventing the directionality of unknown text from affecting surrounding text
/// - Protecting website layout when displaying dynamic content from external sources
///
/// ## Behavior
///
/// The `<bdi>` element works in two ways:
/// - Text inside a `<bdi>` element does not influence the directionality of surrounding text
/// - The directionality of text inside `<bdi>` is not influenced by surrounding text
///
/// - Note: When rendered, this generates an HTML `<bdi>` element that isolates its content from
///   the bidirectional algorithm's influence.
public struct BidirectionalIsolate<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "bdi" }
    
    /// The content of the bidirectional isolate element
    public let content: () -> HTML
    
    /// Creates a new BidirectionalIsolate element with the specified content.
    ///
    /// - Parameters:
    ///   - content: The content to be rendered inside the bidirectional isolate element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating BidirectionalIsolate elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `bdi` identifier when creating
/// HTML bidirectional isolate elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// bdi {
///     "User-generated content with possibly different directionality"
/// }
/// ```
public typealias bdi = BidirectionalIsolate

/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdi
 */
// <bdi>: The Bidirectional Isolate element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// January 2020
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <bdi>
// HTML
// element tells the browser's bidirectional algorithm to treat the text it contains in isolation from its surrounding text. It's particularly useful when a website dynamically inserts some text and doesn't know the directionality of the text being inserted.
// Try it
// <h1>World wrestling championships</h1>
// <ul>
//  <li><bdi class="name">Evil Steven</bdi>: 1st place</li>
//  <li><bdi class="name">FranÃ§ois fatale</bdi>: 2nd place</li>
//  <li><span class="name">Ø³ÙØ§</span>: 3rd place</li>
//  <li><bdi class="name">Ø§ÙØ±Ø¬Ù Ø§ÙÙÙÙ Ø¥ÙØ§Ù</bdi>: 4th place</li>
//  <li><span class="name" dir="auto">Ø³ÙØ§</span>: 5th place</li>
// </ul>
// html {
//  font-family: sans-serif;
// }
// bdi {
//  /* Add your styles here */
// }
// .name {
//  color: red;
// }
// Bidirectional text is text that may contain both sequences of characters that are arranged left-to-right (LTR) and sequences of characters that are arranged right-to-left (RTL), such as an Arabic quotation embedded in an English string. Browsers implement the
// Unicode Bidirectional Algorithm
// to handle this. In this algorithm, characters are given an implicit directionality: for example, Latin characters are treated as LTR while Arabic characters are treated as RTL. Some other characters (such as spaces and some punctuation) are treated as neutral and are assigned directionality based on that of their surrounding characters.
// Usually, the bidirectional algorithm will do the right thing without the author having to provide any special markup but, occasionally, the algorithm needs help. That's where
// <bdi>
// comes in.
// The
// <bdi>
// element is used to wrap a span of text and instructs the bidirectional algorithm to treat this text in isolation from its surroundings. This works in two ways:
// The directionality of text embedded in
// <bdi>
// does not influence
// the directionality of the surrounding text.
// The directionality of text embedded in
// <bdi>
// is not influenced by
// the directionality of the surrounding text.
// For example, consider some text like:
// EMBEDDED-TEXT - 1st place
// If
// EMBEDDED-TEXT
// is LTR, this works fine. But if
// EMBEDDED-TEXT
// is RTL, then
// - 1
// will be treated as RTL text (because it consists of neutral and weak characters). The result will be garbled:
// 1 - EMBEDDED-TEXTst place
// If you know the directionality of
// EMBEDDED-TEXT
// in advance, you can fix this problem by wrapping
// EMBEDDED-TEXT
// in a
// <span>
// with the
// dir
// attribute set to the known directionality. But if you don't know the directionality - for example, because
// EMBEDDED-TEXT
// is being read from a database or entered by the user - you should use
// <bdi>
// to prevent the directionality of
// EMBEDDED-TEXT
// from affecting its surroundings.
// Though the same visual effect can be achieved using the CSS rule
// unicode-bidi: isolate
// on a
// <span>
// or another text-formatting element, HTML authors should not use this approach because it is not semantic and browsers are allowed to ignore CSS styling.
// Embedding the characters in
// <span dir="auto">
// has the same effect as using
// <bdi>
// , but its semantics are less clear.
// Attributes
// Like all other HTML elements, this element supports the
// global attributes
// , except that the
// dir
// attribute behaves differently than normal: it defaults to
// auto
// , meaning its value is never inherited from the parent element. This means that unless you specify a value of either
// rtl
// or
// ltr
// for
// dir
// , the
// user agent
// will determine the correct directionality to use based on the contents of the
// <bdi>
// .
// Examples
// No bdi with only LTR
// This example lists the winners of a competition using
// <span>
// elements only. When the names only contain LTR text the results look fine:
// html
// <ul>
//  <li><span class="name">Henrietta Boffin</span> - 1st place</li>
//  <li><span class="name">Jerry Cruncher</span> - 2nd place</li>
// </ul>
// body {
//  border: 1px solid #3f87a6;
//  max-width: calc(100% - 40px - 6px);
//  padding: 20px;
//  width: calc(100% - 40px - 6px);
//  border-width: 1px 1px 1px 5px;
// }
// No bdi with RTL text
// This example lists the winners of a competition using
// <span>
// elements only, and one of the winners has a name consisting of RTL text. In this case the
// - 1
// , which consists of characters with neutral or weak directionality, will adopt the directionality of the RTL text, and the result will be garbled:
// html
// <ul>
//  <li><span class="name">Ø§ÙÙØ£ÙØ¹ÙØ´ÙÙ</span> - 1st place</li>
//  <li><span class="name">Jerry Cruncher</span> - 2nd place</li>
// </ul>
// body {
//  border: 1px solid #3f87a6;
//  max-width: calc(100% - 40px - 6px);
//  padding: 20px;
//  width: calc(100% - 40px - 6px);
//  border-width: 1px 1px 1px 5px;
// }
// Using bdi with LTR and RTL text
// This example lists the winners of a competition using
// <bdi>
// elements. These elements instruct the browser to treat the name in isolation from its embedding context, so the example output is properly ordered:
// html
// <ul>
//  <li><bdi class="name">Ø§ÙÙØ£ÙØ¹ÙØ´ÙÙ</bdi> - 1st place</li>
//  <li><bdi class="name">Jerry Cruncher</bdi> - 2nd place</li>
// </ul>
// body {
//  border: 1px solid #3f87a6;
//  max-width: calc(100% - 40px - 6px);
//  padding: 20px;
//  width: calc(100% - 40px - 6px);
//  border-width: 1px 1px 1px 5px;
// }
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
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// generic
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-bdi-element
// Browser compatibility
// See also
// Inline markup and bidirectional text in HTML
// Unicode Bidirectional Algorithm basics
// Localization
// Related HTML element:
// <bdo>
// Related CSS properties:
// direction
// ,
// unicode-bidi