//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct TableFoot<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "tfoot" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias tfoot = TableFoot


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tfoot
 */
// <tfoot>: The Table Foot element
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
// <tfoot>
// HTML
// element encapsulates a set of table rows (
// <tr>
// elements), indicating that they comprise the foot of a table with information about the table's columns. This is usually a summary of the columns, e.g., a sum of the given numbers in a column.
// Try it
// <table>
//  <caption>
//  Council budget (in Â£) 2018
//  </caption>
//  <thead>
//  <tr>
//  <th scope="col">Items</th>
//  <th scope="col">Expenditure</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Donuts</th>
//  <td>3,000</td>
//  </tr>
//  <tr>
//  <th scope="row">Stationery</th>
//  <td>18,000</td>
//  </tr>
//  </tbody>
//  <tfoot>
//  <tr>
//  <th scope="row">Totals</th>
//  <td>21,000</td>
//  </tr>
//  </tfoot>
// </table>
// thead,
// tfoot {
//  background-color: #2c5e77;
//  color: #fff;
// }
// tbody {
//  background-color: #e4f0f5;
// }
// table {
//  border-collapse: collapse;
//  border: 2px solid rgb(140 140 140);
//  font-family: sans-serif;
//  font-size: 0.8rem;
//  letter-spacing: 1px;
// }
// caption {
//  caption-side: bottom;
//  padding: 10px;
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 8px 10px;
// }
// td {
//  text-align: center;
// }
// Attributes
// This element includes the
// global attributes
// .
// Deprecated attributes
// The following attributes are deprecated and should not be used. They are documented below for reference when updating existing code and for historical interest only.
// align
// Deprecated
// Specifies the horizontal alignment of each foot cell. The possible
// enumerated
// values are
// left
// ,
// center
// ,
// right
// ,
// justify
// , and
// char
// . When supported, the
// char
// value aligns the textual content on the character defined in the
// char
// attribute and on offset defined by the
// charoff
// attribute. Use the
// text-align
// CSS property instead, as this attribute is deprecated.
// bgcolor
// Deprecated
// Defines the background color of each foot cell. The value is an HTML color; either a
// 6-digit hexadecimal RGB code
// , prefixed by a
// #
// , or a
// color keyword
// . Other CSS
// <color>
// values are not supported. Use the
// background-color
// CSS property instead, as this attribute is deprecated.
// char
// Deprecated
// Does nothing. It was originally intended to specify the alignment of the content to a character of each foot cell. Typical values for this include a period (
// .
// ) when attempting to align numbers or monetary values. If
// align
// is not set to
// char
// , this attribute is ignored.
// charoff
// Deprecated
// Does nothing. It was originally intended to specify the number of characters to offset the foot cell content from the alignment character specified by the
// char
// attribute.
// valign
// Deprecated
// Specifies the vertical alignment of each foot cell. The possible
// enumerated
// values are
// baseline
// ,
// bottom
// ,
// middle
// , and
// top
// . Use the
// vertical-align
// CSS property instead, as this attribute is deprecated.
// Usage notes
// The
// <tfoot>
// is placed after any
// <caption>
// ,
// <colgroup>
// ,
// <thead>
// ,
// <tbody>
// , and
// <tr>
// elements.
// Along with its related
// <thead>
// and
// <tbody>
// elements, the
// <tfoot>
// element provides useful
// semantic
// information and can be used when rendering for either screen or print. Specifying such table content groups also provides valuable contextual information for assistive technologies, including screen readers and search engines.
// When printing a document, in the case of a multipage table, the table foot usually specifies information that is output as an intermediate summary on each page.
// Example
// See
// <table>
// for a complete table example introducing common standards and best practices.
// Table with footer
// This example demonstrates a table divided into a head section with column headers, a body section with the table's main data, and a foot section summarizing data of one column.
// HTML
// The
// <thead>
// ,
// <tbody>
// , and
// <tfoot>
// elements are used to structure a basic table into
// semantic
// sections. The
// <tfoot>
// element represents the foot section of the table, which contains a row (
// <tr>
// ) representing the calculated average of the values in the "Credits" column.
// To allocate the cells in the foot to the correct columns, the
// colspan
// attribute is used on the
// <th>
// element to span row header cell across the first three table columns. The single data cell (
// <td>
// ) in the foot is automatically placed in the correct location, i.e., the fourth column, with the omitted
// colspan
// attribute value defaulting to
// 1
// . Additionally, the
// scope
// attribute is set to
// row
// on the header cell (
// <th>
// ) in the foot to explicitly define that this foot header cell relates to the table cells within the same row, which in our example is the one data cell in the foot row that contains the calculated average.
// html
// <table>
//  <thead>
//  <tr>
//  <th>Student ID</th>
//  <th>Name</th>
//  <th>Major</th>
//  <th>Credits</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <td>3741255</td>
//  <td>Jones, Martha</td>
//  <td>Computer Science</td>
//  <td>240</td>
//  </tr>
//  <tr>
//  <td>3971244</td>
//  <td>Nim, Victor</td>
//  <td>Russian Literature</td>
//  <td>220</td>
//  </tr>
//  <tr>
//  <td>4100332</td>
//  <td>Petrov, Alexandra</td>
//  <td>Astrophysics</td>
//  <td>260</td>
//  </tr>
//  </tbody>
//  <tfoot>
//  <tr>
//  <th colspan="3" scope="row">Average Credits</th>
//  <td>240</td>
//  </tr>
//  </tfoot>
// </table>
// CSS
// Some basic CSS is used to style and highlight the table foot so that the foot cells stand out from the data in the table body.
// css
// tfoot {
//  border-top: 3px dotted rgb(160 160 160);
//  background-color: #2c5e77;
//  color: #fff;
// }
// tfoot th {
//  text-align: right;
// }
// tfoot td {
//  font-weight: bold;
// }
// thead {
//  border-bottom: 2px solid rgb(160 160 160);
//  background-color: #2c5e77;
//  color: #fff;
// }
// tbody {
//  background-color: #e4f0f5;
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
// tr > td:last-of-type {
//  text-align: center;
// }
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// Zero or more
// <tr>
// elements.
// Tag omission
// The start tag is mandatory. The end tag may be omitted if there is no
//  more content in the parent
// <table>
// element.
// Permitted parents
// A
// <table>
// element. The
// <tfoot>
// must appear after any
// <caption>
// ,
// <colgroup>
// ,
// <thead>
// ,
// <tbody>
// , and
// <tr>
// elements. Note that this is the requirement in HTML.
// Originally, in HTML4, the opposite was true: the
// <tfoot>
// element could not be placed after any
// <tbody>
// and
// <tr>
// elements.
// Implicit ARIA role
// rowgroup
// Permitted ARIA roles
// Any
// DOM interface
// HTMLTableSectionElement
// Specifications
// Specification
// HTML
// #
// the-tfoot-element
// Browser compatibility
// See also
// Learn: HTML table basics
// <caption>
// ,
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
// <th>
// ,
// <thead>
// ,
// <tr>
// : Other table-related elements
// background-color
// : CSS property to set the background color of each foot cell
// border
// : CSS property to control borders of foot cells
// text-align
// : CSS property to horizontally align each foot cell content
// vertical-align
// : CSS property to vertically align each foot cell content