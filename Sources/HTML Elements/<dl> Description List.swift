//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct DescriptionList<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dl" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias dl = DescriptionList


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl
 */
// <dl>: The Description List element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <dl>
// HTML
// element represents a description list. The element encloses a list of groups of terms (specified using the
// <dt>
// element) and descriptions (provided by
// <dd>
// elements). Common uses for this element are to implement a glossary or to display metadata (a list of key-value pairs).
// Try it
// <p>Cryptids of Cornwall:</p>
// <dl>
//  <dt>Beast of Bodmin</dt>
//  <dd>A large feline inhabiting Bodmin Moor.</dd>
//  <dt>Morgawr</dt>
//  <dd>A sea serpent.</dd>
//  <dt>Owlman</dt>
//  <dd>A giant owl-like creature.</dd>
// </dl>
// p,
// dt {
//  font-weight: bold;
// }
// dl,
// dd {
//  font-size: 0.9rem;
// }
// dd {
//  margin-bottom: 1em;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Accessibility
// Each screen reader exposes
// <dl>
// content differently, including total count, terms/definitions context, and navigation methods. These differences are not necessarily bugs.
// As of iOS 14, VoiceOver will announce that
// <dl>
// content is a list when navigating with the virtual cursor (not via the read-all command). VoiceOver does not support list navigation commands with
// <dl>
// . Be careful applying ARIA
// term
// and
// definition
// roles to
// <dl>
// constructs as VoiceOver (macOS and iOS) will adjust how they are announced.
// VoiceOver on iOS 14 Supports Description Lists
// Brief Note on Description List Support
// Examples
// Single term and description
// html
// <dl>
//  <dt>Firefox</dt>
//  <dd>
//  A free, open source, cross-platform, graphical web browser developed by the
//  Mozilla Corporation and hundreds of volunteers.
//  </dd>
//  <!-- Other terms and descriptions -->
// </dl>
// Result
// Multiple terms, single description
// html
// <dl>
//  <dt>Firefox</dt>
//  <dt>Mozilla Firefox</dt>
//  <dt>Fx</dt>
//  <dd>
//  A free, open source, cross-platform, graphical web browser developed by the
//  Mozilla Corporation and hundreds of volunteers.
//  </dd>
//  <!-- Other terms and descriptions -->
// </dl>
// Result
// Single term, multiple descriptions
// html
// <dl>
//  <dt>Firefox</dt>
//  <dd>
//  A free, open source, cross-platform, graphical web browser developed by the
//  Mozilla Corporation and hundreds of volunteers.
//  </dd>
//  <dd>
//  The Red Panda also known as the Lesser Panda, Wah, Bear Cat or Firefox, is a
//  mostly herbivorous mammal, slightly larger than a domestic cat (60 cm long).
//  </dd>
//  <!-- Other terms and descriptions -->
// </dl>
// Result
// Multiple terms and descriptions
// It is also possible to define multiple terms with multiple corresponding descriptions, by combining the examples above.
// Metadata
// Description lists are useful for displaying metadata as a list of key-value pairs.
// html
// <dl>
//  <dt>Name</dt>
//  <dd>Godzilla</dd>
//  <dt>Born</dt>
//  <dd>1952</dd>
//  <dt>Birthplace</dt>
//  <dd>Japan</dd>
//  <dt>Color</dt>
//  <dd>Green</dd>
// </dl>
// Result
// Tip: It can be handy to define a key-value separator in the CSS, such as:
// css
// dt::after {
//  content: ": ";
// }
// Wrapping name-value groups in
// div
// elements
// HTML allows wrapping each name-value group in a
// <dl>
// element in a
// <div>
// element. This can be useful when using
// microdata
// , or when
// global attributes
// apply to a whole group, or for styling purposes.
// html
// <dl>
//  <div>
//  <dt>Name</dt>
//  <dd>Godzilla</dd>
//  </div>
//  <div>
//  <dt>Born</dt>
//  <dd>1952</dd>
//  </div>
//  <div>
//  <dt>Birthplace</dt>
//  <dd>Japan</dd>
//  </div>
//  <div>
//  <dt>Color</dt>
//  <dd>Green</dd>
//  </div>
// </dl>
// Result
// Notes
// Do not use this element (nor
// <ul>
// elements) to merely create indentation on a page. Although it works, this is a bad practice and obscures the meaning of description lists.
// To change the indentation of a description term, use the
// CSS
// margin
// property.
// Technical summary
// Content categories
// Flow content
// , and if the
// <dl>
// element's children include one
//  name-value group, palpable content.
// Permitted content
// Either: Zero or more groups each consisting of one or more
// <dt>
// elements followed by one or more
// <dd>
// elements, optionally intermixed with
// <script>
// and
// <template>
// elements.
// Or: (in
// WHATWG
// HTML,
// W3C
// HTML 5.2
//  and later) One or more
// <div>
// elements,
//  optionally intermixed with
// <script>
// and
// <template>
// elements.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// group
// ,
// list
// ,
// none
// ,
// presentation
// DOM interface
// HTMLDListElement
// Specifications
// Specification
// HTML
// #
// the-dl-element
// Browser compatibility
// See also
// <dt>
// <dd>