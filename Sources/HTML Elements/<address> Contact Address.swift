///
/// <address> Contact Address.swift
/// swift-html
///
/// Represents the HTML address element for contact information.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML address element (`<address>`), which indicates that the enclosed HTML 
/// provides contact information for a person, people, or organization.
///
/// The `Address` struct provides a type-safe way to create HTML address elements that contain
/// contact information related to the document or a specific article within the document.
///
/// ## Example
///
/// ```swift
/// address {
///   "Contact the author: "
///   anchor(href: "mailto:author@example.com") {
///     "author@example.com"
///   }
///   lineBreak()
///   "123 Main Street, Anytown USA"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use only for contact information, not for other content
/// - Include the name of the person or organization along with contact details
/// - Place inside the `footer` element of the current section when appropriate
/// - Don't nest address elements
/// - Don't include headings, sections, or header/footer elements inside
///
/// - Note: When rendered, this generates an HTML `<address>` element with the appropriate
///   attributes based on the configuration.
public struct Address<HTML>: Element {
    public static var tag: String { "address" }
    
    /// The content of the address element, which can include text and other elements
    /// like anchors, line breaks, etc.
    ///
    /// The content should contain contact information for a person, people, or organization.
    public var content: () -> HTML
    
    /// Creates a new Address element with the specified content.
    ///
    /// - Parameter content: The contact information to be contained within the address element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Address elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `address` identifier when creating
/// HTML address elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// address {
///   "Contact us: contact@example.com"
/// }
/// ```
public typealias address = Address


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/address
 */
// <address>: The Contact Address element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <address>
// HTML
// element indicates that the enclosed HTML provides contact information for a person or people, or for an organization.
// Try it
// <p>Contact the author of this page:</p>
// <address>
//  <a href="mailto:jim@example.com">jim@example.com</a><br />
//  <a href="tel:+14155550132">+1 (415) 555â0132</a>
// </address>
// a[href^="mailto"]::before {
//  content: "ð§ ";
// }
// a[href^="tel"]::before {
//  content: "ð ";
// }
// The contact information provided by an
// <address>
// element's contents can take whatever form is appropriate for the context, and may include any type of contact information that is needed, such as a physical address, URL, email address, phone number, social media handle, geographic coordinates, and so forth. The
// <address>
// element should include the name of the person, people, or organization to which the contact information refers.
// <address>
// can be used in a variety of contexts, such as providing a business's contact information in the page header, or indicating the author of an article by including an
// <address>
// element within the
// <article>
// .
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <address>
// element can only be used to represent the contact information for its nearest
// <article>
// or
// <body>
// element ancestor.
// This element should not contain more information than the contact information, like a publication date (which belongs in a
// <time>
// element).
// Typically an
// <address>
// element can be placed inside the
// <footer>
// element of the current section, if any.
// Examples
// This example demonstrates the use of
// <address>
// to demarcate the contact information for an article's author.
// html
// <address>
//  You can contact author at
//  <a href="http://www.example.com/contact">www.example.com</a>.<br />
//  If you see any bugs, please
//  <a href="mailto:webmaster@example.com">contact webmaster</a>.<br />
//  You may also want to visit us:<br />
//  Mozilla Foundation<br />
//  331 E Evelyn Ave<br />
//  Mountain View, CA 94041<br />
//  USA
// </address>
// Result
// Although it renders text with the same default styling as the
// <i>
// or
// <em>
// elements, it is more appropriate to use
// <address>
// when dealing with contact information, as it conveys additional semantic information.
// Technical summary
// Content categories
// Flow content
// , palpable content.
// Permitted content
// Flow content
// , but with no nested
// <address>
// element, no heading
//  content (
// <hgroup>
// ,
// h1
// ,
// h2
// ,
// h3
// ,
// h4
// ,
// h5
// ,
// h6
// ), no sectioning content
//  (
// <article>
// ,
// <aside>
// ,
// <section>
// ,
// <nav>
// ), and
//  no
// <header>
// or
// <footer>
// element.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// , but always excluding
// <address>
// elements (according
//  to the logical principle of symmetry, if
// <address>
// tag, as a parent, can not have nested
// <address>
// element, then the same
// <address>
// content can not have
// <address>
// tag as its parent).
// Implicit ARIA role
// group
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Prior to Gecko 2.0 (Firefox 4),
//  Gecko implemented this element using the
// HTMLSpanElement
// interface
// Specifications
// Specification
// HTML
// #
// the-address-element
// Browser compatibility
// See also
// Others section-related elements:
// <body>
// ,
// <nav>
// ,
// <article>
// ,
// <aside>
// ,
// h1
// ,
// h2
// ,
// h3
// ,
// h4
// ,
// h5
// ,
// h6
// ,
// <hgroup>
// ,
// <footer>
// ,
// <section>
// ,
// <header>
// ;
// Sections and outlines of an HTML document
// .