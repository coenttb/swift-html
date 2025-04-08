///
/// <caption> Table Caption.swift
/// swift-html
///
/// Represents the HTML table caption element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table caption element (`<caption>`), which specifies the title or caption
/// of a table, providing the table with an accessible description.
///
/// The `Caption` struct provides a type-safe way to create HTML table caption elements.
/// The caption element must be the first child of its parent table element.
///
/// ## Example
///
/// ```swift
/// table {
///     caption {
///         "Monthly Sales Data"
///     }
///     // table rows and cells...
/// }
/// ```
///
/// ## Accessibility Benefits
///
/// - Provides a clear, concise description of the table's content
/// - Helps users who are scanning the page quickly understand the table's purpose
/// - Especially beneficial for screen reader users, allowing them to determine the table's
///   relevance without reading through multiple cells
///
/// ## Positioning
///
/// By default, most browsers display the caption at the top of the table, but this can be
/// controlled with the CSS `caption-side` property.
///
/// - Note: If included, the `<caption>` element must be the first child of its parent `<table>` element; When a `<table>` is nested within a `<figure>` as the figure's only content, it should be captioned via a `<figcaption>` for the `<figure>` instead of as a `<caption>` nested within the `<table>`. Any background-color applied to a table will not be applied to its caption. Add a background-color to the `<caption>` element as well if you want the same color to be behind both.

public struct Caption<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "caption" }
    
    /// The content of the table caption
    public let content: () -> HTML
    
    /// Creates a new Caption element with the specified content.
    ///
    /// - Parameters:
    ///   - content: The content to be rendered inside the table caption element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Caption elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `caption` identifier when creating
/// HTML table caption elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// caption {
///     "Monthly Sales Data"
/// }
/// ```
public typealias caption = Caption


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/caption
 */
// <caption>: The Table Caption element
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
// <caption>
// HTML
// element specifies the caption (or title) of a table, providing the table an
// accessible description
// .
// Try it
// <table>
//  <caption>
//  He-Man and Skeletor facts
//  </caption>
//  <tr>
//  <td></td>
//  <th scope="col" class="heman">He-Man</th>
//  <th scope="col" class="skeletor">Skeletor</th>
//  </tr>
//  <tr>
//  <th scope="row">Role</th>
//  <td>Hero</td>
//  <td>Villain</td>
//  </tr>
//  <tr>
//  <th scope="row">Weapon</th>
//  <td>Power Sword</td>
//  <td>Havoc Staff</td>
//  </tr>
//  <tr>
//  <th scope="row">Dark secret</th>
//  <td>Expert florist</td>
//  <td>Cries at romcoms</td>
//  </tr>
// </table>
// caption {
//  caption-side: bottom;
//  padding: 10px;
//  font-weight: bold;
// }
// table {
//  border-collapse: collapse;
//  border: 2px solid rgb(140 140 140);
//  font-family: sans-serif;
//  font-size: 0.8rem;
//  letter-spacing: 1px;
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 8px 10px;
// }
// th {
//  background-color: rgb(230 230 230);
// }
// td {
//  text-align: center;
// }
// tr:nth-child(even) td {
//  background-color: rgb(250 250 250);
// }
// tr:nth-child(odd) td {
//  background-color: rgb(240 240 240);
// }
// .heman {
//  font: 1.4rem molot;
//  text-shadow:
//  1px 1px 1px #fff,
//  2px 2px 1px #000;
// }
// .skeletor {
//  font: 1.7rem rapscallion;
//  letter-spacing: 3px;
//  text-shadow:
//  1px 1px 0 #fff,
//  0 0 9px #000;
// }
// Attributes
// This element includes the
// global attributes
// .
// Deprecated attributes
// The following attributes are deprecated and should not be used. They are documented below for reference when updating existing code and for historical interest only.
// align
// Deprecated
// Specifies on which side of the table the caption should be displayed. The possible
// enumerated
// values are
// left
// ,
// top
// ,
// right
// , or
// bottom
// . Use the
// caption-side
// and
// text-align
// CSS properties instead, as this attribute is deprecated.
// Usage notes
// If included, the
// <caption>
// element must be the first child of its parent
// <table>
// element.
// When a
// <table>
// is nested within a
// <figure>
// as the figure's only content, it should be captioned via a
// <figcaption>
// for the
// <figure>
// instead of as a
// <caption>
// nested within the
// <table>
// .
// Any
// background-color
// applied to a table will not be applied to its caption. Add a
// background-color
// to the
// <caption>
// element as well if you want the same color to be behind both.
// Example
// See
// <table>
// for a complete table example introducing common standards and best practices.
// Table with caption
// This example demonstrates a basic table that includes a caption describing the data presented.
// Such a "title" is helpful for users who are quickly scanning the page, and it is especially beneficial for visually impaired users, allowing them to determine the table's relevance quickly without the need to have a screen reader read the contents of many cells just to find out what the table is about.
// HTML
// A
// <caption>
// element is used as the first child of the
// <table>
// , with text content similar to a title to describe the table data. Three rows, the first being a header row, with two columns are created using the
// <tr>
// ,
// <th>
// and
// <td>
// elements after the
// <caption>
// .
// html
// <table>
//  <caption>
//  User login email addresses
//  </caption>
//  <tr>
//  <th>Login</th>
//  <th>Email</th>
//  </tr>
//  <tr>
//  <td>user1</td>
//  <td>user1@example.com</td>
//  </tr>
//  <tr>
//  <td>user2</td>
//  <td>user2@example.com</td>
//  </tr>
// </table>
// CSS
// Some basic CSS is used to align and highlight the
// <caption>
// .
// css
// caption {
//  caption-side: top;
//  text-align: left;
//  padding-bottom: 10px;
//  font-weight: bold;
// }
// table {
//  border-collapse: collapse;
//  border: 2px solid rgb(140 140 140);
//  font-family: sans-serif;
//  font-size: 0.8rem;
//  letter-spacing: 1px;
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 8px 10px;
// }
// th {
//  background-color: rgb(230 230 230);
// }
// td {
//  text-align: center;
// }
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// Flow content
// .
// Tag omission
// The end tag can be omitted if the element is not immediately followed by
//  ASCII whitespace or a comment.
// Permitted parents
// A
// <table>
// element, as its first descendant.
// Implicit ARIA role
// caption
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLTableCaptionElement
// Specifications
// Specification
// HTML
// #
// the-caption-element
// Browser compatibility
// See also
// Learn: HTML table basics
// <col>
// ,
// <colgroup>
// ,
// <table>
// ,
// <tbody>
// ,
// <td>
// ,
// <tfoot>
// ,
// <th>
// ,
// <thead>
// ,
// <tr>
// : Other table-related elements
// caption-side
// : CSS property to position the
// <caption>
// relative to its parent
// <table>
// text-align
// : CSS property to horizontally align the text content of the
// <caption>