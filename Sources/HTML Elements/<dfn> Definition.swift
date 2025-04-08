//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Definition<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dfn" }

    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias dfn = Definition


//<dfn>: The Definition element
//
//
//Baseline Widely available
//
//
//
//The <dfn> HTML element indicates a term to be defined. The <dfn> element should be used in a complete definition statement, where the full definition of the term can be one of the following:
//
//The ancestor paragraph (a block of text, sometimes marked by a <p> element)
//The <dt>/<dd> pairing
//The nearest section ancestor of the <dfn> element,
//Try it
//HTML Demo: <dfn>
//RESET
//HTML
//CSS
//1
//2
//3
//4
//5
//<p>
//  A <dfn id="def-validator">validator</dfn> is a program that checks for syntax
//  errors in code or documents.
//</p>
//
//OUTPUT
//Attributes
//This element's attributes include the global attributes.
//
//The title attribute has special meaning, as noted below.
//
//Usage notes
//There are some not-entirely-obvious aspects to using the <dfn> element. We examine those here.
//
//Specifying the term being defined
//The term being defined is identified following these rules:
//
//If the <dfn> element has a title attribute, the value of the title attribute is considered to be the term being defined. The element must still have text within it, but that text may be an abbreviation (perhaps using <abbr>) or another form of the term.
//If the <dfn> contains a single child element and does not have any text content of its own, and the child element is an <abbr> element with a title attribute itself, then the exact value of the <abbr> element's title is the term being defined.
//Otherwise, the text content of the <dfn> element is the term being defined. This is shown in the first example below.
//Note: If the <dfn> element has a title attribute, it must contain the term being defined and no other text.
//Links to <dfn> elements
//If you include an id attribute on the <dfn> element, you can then link to it using <a> elements. Such links should be uses of the term, with the intent being that the reader can quickly navigate to the term's definition if they're not already aware of it, by clicking on the term's link.
//
//This is shown in the example under Links to definitions below.
//
//Examples
//Let's take a look at some examples of various usage scenarios.
//
//Basic identification of a term
//This example uses a plain <dfn> element to identify the location of a term within the definition.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<p>
//  The <strong>HTML Definition element (<dfn>&lt;dfn&gt;</dfn>)</strong> is used
//  to indicate the term being defined within the context of a definition phrase
//  or sentence.
//</p>
//Since the <dfn> element has no title, the text contents of the <dfn> element itself are used as the term being defined.
//
//Result
//
//Play
//
//Links to definitions
//To add links to the definitions, you create the link the same way you always do, with the <a> element.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<p>
//  The
//  <strong>HTML Definition element (<dfn id="definition-dfn">&lt;dfn&gt;</dfn>)</strong>
//  is used to indicate the term being defined within the context of a definition
//  phrase or sentence.
//</p>
//
//<p>
//  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Graece donan, Latine
//  voluptatem vocant. Confecta res esset. Duo Reges: constructio interrete.
//  Scrupulum, inquam, abeunti;
//</p>
//
//<p>
//  Because of all of that, we decided to use the
//  <code><a href="#definition-dfn">&lt;dfn&gt;</a></code> element for this
//  project.
//</p>
//Here we see the definition — now with an id attribute, "definition-dfn", which can be used as the target of a link. Later on, a link is created using <a> with the href attribute set to "#definition-dfn" to set up the link back to the definition.
//
//Result
//
//Play
//
//Using abbreviations and definitions together
//In some cases, you may wish to use an abbreviation for a term when defining it. This can be done by using the <dfn> and <abbr> elements in tandem, like this:
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<p>
//  The <dfn><abbr title="Hubble Space Telescope">HST</abbr></dfn> is among the
//  most productive scientific instruments ever constructed. It has been in orbit
//  for over 20 years, scanning the sky and returning data and photographs of
//  unprecedented quality and detail.
//</p>
//
//<p>
//  Indeed, the <abbr title="Hubble Space Telescope">HST</abbr> has arguably done
//  more to advance science than any device ever built.
//</p>
//Note the <abbr> element nested inside the <dfn>. The former establishes that the term is an abbreviation ("HST") and specifies the full term ("Hubble Space Telescope") in its title attribute. The latter indicates that the abbreviated term represents a term being defined.
//
//Result
//
//Play
//
//Technical summary
//Content categories    Flow content, phrasing content, palpable content.
//Permitted content    Phrasing content, but no <dfn> element must be a descendant.
//Tag omission    None, both the starting and ending tag are mandatory.
//Permitted parents    Any element that accepts phrasing content.
//Implicit ARIA role    term
//Permitted ARIA roles    Any
//DOM interface    HTMLElement


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dfn
 */
// <dfn>: The Definition element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <dfn>
// HTML
// element indicates a term to be defined. The
// <dfn>
// element should be used in a complete definition statement, where the full definition of the term can be one of the following:
// The ancestor paragraph (a block of text, sometimes marked by a
// <p>
// element)
// The
// <dt>
// /
// <dd>
// pairing
// The nearest
// section
// ancestor of the
// <dfn>
// element,
// Try it
// <p>
//  A <dfn id="def-validator">validator</dfn> is a program that checks for syntax
//  errors in code or documents.
// </p>
// dfn {
//  /* Add your styles here */
// }
// Attributes
// This element's attributes include the
// global attributes
// .
// The
// title
// attribute has special meaning, as noted below.
// Usage notes
// There are some not-entirely-obvious aspects to using the
// <dfn>
// element. We examine those here.
// Specifying the term being defined
// The term being defined is identified following these rules:
// If the
// <dfn>
// element has a
// title
// attribute, the value of the
// title
// attribute is considered to be the term being defined. The element must still have text within it, but that text may be an abbreviation (perhaps using
// <abbr>
// ) or another form of the term.
// If the
// <dfn>
// contains a single child element and does not have any text content of its own, and the child element is an
// <abbr>
// element with a
// title
// attribute itself, then the exact value of the
// <abbr>
// element's
// title
// is the term being defined.
// Otherwise, the text content of the
// <dfn>
// element is the term being defined. This is shown
// in the first example below
// .
// Note:
// If the
// <dfn>
// element has a
// title
// attribute, it
// must
// contain the term being defined and no other text.
// Links to
// <dfn>
// elements
// If you include an
// id
// attribute on the
// <dfn>
// element, you can then link to it using
// <a>
// elements. Such links should be uses of the term, with the intent being that the reader can quickly navigate to the term's definition if they're not already aware of it, by clicking on the term's link.
// This is shown in the example under
// Links to definitions
// below.
// Examples
// Let's take a look at some examples of various usage scenarios.
// Basic identification of a term
// This example uses a plain
// <dfn>
// element to identify the location of a term within the definition.
// HTML
// html
// <p>
//  The <strong>HTML Definition element (<dfn>&lt;dfn&gt;</dfn>)</strong> is used
//  to indicate the term being defined within the context of a definition phrase
//  or sentence.
// </p>
// Since the
// <dfn>
// element has no
// title
// , the text contents of the
// <dfn>
// element itself are used as the term being defined.
// Result
// Links to definitions
// To add links to the definitions, you create the link the same way you always do, with the
// <a>
// element.
// HTML
// html
// <p>
//  The
//  <strong>HTML Definition element (<dfn id="definition-dfn">&lt;dfn&gt;</dfn>)</strong>
//  is used to indicate the term being defined within the context of a definition
//  phrase or sentence.
// </p>
// <p>
//  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Graece donan, Latine
//  voluptatem vocant. Confecta res esset. Duo Reges: constructio interrete.
//  Scrupulum, inquam, abeunti;
// </p>
// <p>
//  Because of all of that, we decided to use the
//  <code><a href="#definition-dfn">&lt;dfn&gt;</a></code> element for this
//  project.
// </p>
// Here we see the definition â now with an
// id
// attribute,
// "definition-dfn"
// , which can be used as the target of a link. Later on, a link is created using
// <a>
// with the
// href
// attribute set to
// "#definition-dfn"
// to set up the link back to the definition.
// Result
// Using abbreviations and definitions together
// In some cases, you may wish to use an abbreviation for a term when defining it. This can be done by using the
// <dfn>
// and
// <abbr>
// elements in tandem, like this:
// HTML
// html
// <p>
//  The <dfn><abbr title="Hubble Space Telescope">HST</abbr></dfn> is among the
//  most productive scientific instruments ever constructed. It has been in orbit
//  for over 20 years, scanning the sky and returning data and photographs of
//  unprecedented quality and detail.
// </p>
// <p>
//  Indeed, the <abbr title="Hubble Space Telescope">HST</abbr> has arguably done
//  more to advance science than any device ever built.
// </p>
// Note the
// <abbr>
// element nested inside the
// <dfn>
// . The former establishes that the term is an abbreviation ("HST") and specifies the full term ("Hubble Space Telescope") in its
// title
// attribute. The latter indicates that the abbreviated term represents a term being defined.
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// palpable content
// .
// Permitted content
// Phrasing content
// ,
//  but no
// <dfn>
// element must be a descendant.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// term
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-dfn-element
// Browser compatibility
// See also
// Elements related to definition lists:
// <dl>
// ,
// <dt>
// ,
// <dd>
// <abbr>