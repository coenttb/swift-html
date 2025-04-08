//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct TableRow<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "tr" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias tr = TableRow


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tr
 */
// <tr>: The Table Row element
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
// <tr>
// HTML
// element defines a row of cells in a table. The row's cells can then be established using a mix of
// <td>
// (data cell) and
// <th>
// (header cell) elements.
// Try it
// <table>
//  <caption>
//  Alien football stars
//  </caption>
//  <tr>
//  <th scope="col">Player</th>
//  <th scope="col">Gloobles</th>
//  <th scope="col">Za'taak</th>
//  </tr>
//  <tr>
//  <th scope="row">TR-7</th>
//  <td>7</td>
//  <td>4,569</td>
//  </tr>
//  <tr>
//  <th scope="row">Khiresh Odo</th>
//  <td>7</td>
//  <td>7,223</td>
//  </tr>
//  <tr>
//  <th scope="row">Mia Oolong</th>
//  <td>9</td>
//  <td>6,219</td>
//  </tr>
// </table>
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 8px 10px;
// }
// th[scope="col"] {
//  background-color: #505050;
//  color: #fff;
// }
// th[scope="row"] {
//  background-color: #d6ecd4;
// }
// td {
//  text-align: center;
// }
// tr:nth-of-type(even) {
//  background-color: #eee;
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
// Attributes
// This element includes the
// global attributes
// .
// Deprecated attributes
// The following attributes are deprecated and should not be used. They are documented below for reference when updating existing code and for historical interest only.
// align
// Deprecated
// Specifies the horizontal alignment of each row cell. The possible
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
// Defines the background color of each row cell. The value is an HTML color; either a
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
// Specifies the alignment of the content to a character of each row cell. Typical values for this include a period (
// .
// ) when attempting to align numbers or monetary values. If
// align
// is not set to
// char
// , this attribute is ignored.
// charoff
// Deprecated
// Specifies the number of characters to offset the row cell content from the alignment character specified by the
// char
// attribute.
// valign
// Deprecated
// Specifies the vertical alignment of each row cell. The possible
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
// <tr>
// element is valid as a child of a
// <thead>
// ,
// <tbody>
// , or
// <tfoot>
// element only.
// If the
// <tr>
// is placed as a direct child of its parent
// <table>
// element, the
// <tbody>
// parent is implied and browsers will add the
// <tbody>
// to the markup.
// The implied
// <tbody>
// parent is only supported if the
// <table>
// otherwise has no child
// <tbody>
// elements, and only if the
// <tr>
// is included after any
// <caption>
// ,
// <colgroup>
// , and
// <thead>
// elements.
// The CSS pseudo-classes
// :nth-of-type
// ,
// :first-of-type
// , and
// :last-of-type
// are often useful for selecting the desired set of rows and their data and header cells (
// <td>
// and
// <th>
// elements).
// When a
// <tr>
// is included as a direct child of the
// <table>
// , as the browser adds a
// <tbody>
// to the markup, CSS selectors such as
// table > tr
// may not work as expected or at all.
// Examples
// See
// <table>
// for a complete table example introducing common standards and best practices.
// Basic row setup
// This example demonstrates a table with four rows and three columns, where the first column contains headers for the row data cells.
// HTML
// Four
// <tr>
// elements are used to create four table rows. Each row contains three cells - one header cell (
// <th>
// ) and two data cells (
// <td>
// ) - creating three columns. The
// scope
// attribute set on each header cell specifies which cells they relate to, which in this example is all data cells within the
// row
// .
// html
// <table>
//  <tbody>
//  <tr>
//  <th scope="row">A</th>
//  <td>Alfa</td>
//  <td>AL fah</td>
//  </tr>
//  <tr>
//  <th scope="row">B</th>
//  <td>Bravo</td>
//  <td>BRAH voh</td>
//  </tr>
//  <tr>
//  <th scope="row">C</th>
//  <td>Charlie</td>
//  <td>CHAR lee</td>
//  </tr>
//  <tr>
//  <th scope="row">D</th>
//  <td>Delta</td>
//  <td>DELL tah</td>
//  </tr>
//  </tbody>
// </table>
// CSS
// The CSS
// :nth-of-type
// pseudo-class is used to select every
// odd
// row and set the
// background-color
// of those rows to a slightly darker tone, creating a so-called "zebra stripe" effect. This alternating background makes the rows of data in the table easier to parse and readâimagine having many rows and columns and trying to find some data in a particular row. In addition, the row header cells (
// <th>
// elements) are highlighted with a
// background-color
// to distinguish them from the data cells (
// <td>
// elements).
// css
// tr:nth-of-type(odd) {
//  background-color: #eee;
// }
// tr th[scope="row"] {
//  background-color: #d6ecd4;
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
// Result
// Header row
// This example extends the basic table from the
// previous example
// by adding a header row as the first row of the table.
// HTML
// An additional table row (
// <tr>
// ) is added as the first row of the table with column header cells (
// <th>
// ) providing a header for each column. We put this row in a
// <thead>
// grouping element to indicate this is the header of the table. The
// scope
// attribute is added to each header cell (
// <th>
// ) within this head row to explicitly specify that each header cell relates to all the cells within its own column, even though those cells are in the
// <tbody>
// .
// html
// <table>
//  <thead>
//  <tr>
//  <th scope="col">Symbol</th>
//  <th scope="col">Code word</th>
//  <th scope="col">Pronunciation</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">A</th>
//  <td>Alfa</td>
//  <td>AL fah</td>
//  </tr>
//  <tr>
//  <th scope="row">B</th>
//  <td>Bravo</td>
//  <td>BRAH voh</td>
//  </tr>
//  <tr>
//  <th scope="row">C</th>
//  <td>Charlie</td>
//  <td>CHAR lee</td>
//  </tr>
//  <tr>
//  <th scope="row">D</th>
//  <td>Delta</td>
//  <td>DELL tah</td>
//  </tr>
//  </tbody>
// </table>
// CSS
// The CSS is nearly unchanged from the
// previous example
// , except for some additional styling to highlight the "header row" so that the headers of the columns stand out from the other cells.
// css
// tr:nth-of-type(odd) {
//  background-color: #eee;
// }
// tr th[scope="col"] {
//  background-color: #505050;
//  color: #fff;
// }
// tr th[scope="row"] {
//  background-color: #d6ecd4;
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
// Result
// Sorting rows
// There are no native methods for sorting the rows (
// <tr>
// elements) of a
// <table>
// . But using
// Array.prototype.sort()
// ,
// Node.removeChild
// , and
// Node.appendChild
// , a custom
// sort()
// function can be implemented in JavaScript to sort an
// HTMLCollection
// of
// <tr>
// elements.
// HTML
// A
// <tbody>
// element is used in this basic table to mark the body section of the table and to include three rows (
// <tr>
// elements) with data (
// <td>
// elements), creating one column with numbers in descending order.
// html
// <table>
//  <tbody>
//  <tr>
//  <td>3</td>
//  </tr>
//  <tr>
//  <td>2</td>
//  </tr>
//  <tr>
//  <td>1</td>
//  </tr>
//  </tbody>
// </table>
// JavaScript
// In the JavaScript code below, the created
// sort()
// function is attached to the
// <tbody>
// element so that it sorts the table cells in order of increasing value and updates the display accordingly.
// js
// HTMLTableSectionElement.prototype.sort = function (cb) {
//  Array.from(this.rows)
//  .sort(cb)
//  .forEach((e) => this.appendChild(this.removeChild(e)));
// };
// document
//  .querySelector("table")
//  .tBodies[0].sort((a, b) => a.textContent.localeCompare(b.textContent));
// table {
//  border-collapse: collapse;
//  border: 2px solid rgb(140 140 140);
//  font-family: sans-serif;
//  font-size: 0.8rem;
//  letter-spacing: 1px;
// }
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 4px 8px;
// }
// Result
// Sorting rows with a click on header cells
// This example extends the basic table from the
// previous example
// by making the sorting interactive and independent for multiple columns.
// HTML
// An additional data cell (
// <td>
// element) is added to each row (
// <tr>
// element) within the table body (
// <tbody>
// element) to create a second column with letters in ascending order. Using the
// <thead>
// element, a head section is added before the body section to introduce a head row with table header cells (
// <th>
// element). These header cells are used in the JavaScript code below to make them clickable and then to perform the corresponding sorting when activated per click.
// html
// <table>
//  <thead>
//  <tr>
//  <th>Numbers</th>
//  <th>Letters</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <td>3</td>
//  <td>A</td>
//  </tr>
//  <tr>
//  <td>2</td>
//  <td>B</td>
//  </tr>
//  <tr>
//  <td>1</td>
//  <td>C</td>
//  </tr>
//  </tbody>
// </table>
// JavaScript
// A click event handler is added to each table header (
// <th>
// element) of each
// <table>
// in the
// document
// ; it sorts all the rows (
// <tr>
// elements) of the
// <tbody>
// based on the contents of the data cells (
// <td>
// elements) contained in the rows.
// Note:
// This solution assumes that the
// <td>
// elements are populated by raw text with no descendant elements.
// js
// const allTables = document.querySelectorAll("table");
// for (const table of allTables) {
//  const tBody = table.tBodies[0];
//  const rows = Array.from(tBody.rows);
//  const headerCells = table.tHead.rows[0].cells;
//  for (const th of headerCells) {
//  const cellIndex = th.cellIndex;
//  th.addEventListener("click", () => {
//  rows.sort((tr1, tr2) => {
//  const tr1Text = tr1.cells[cellIndex].textContent;
//  const tr2Text = tr2.cells[cellIndex].textContent;
//  return tr1Text.localeCompare(tr2Text);
//  });
//  tBody.append(...rows);
//  });
//  }
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
//  padding: 4px 8px;
// }
// th {
//  background-color: #505050;
//  color: #fff;
//  cursor: pointer;
// }
// Result
// Note:
// To be usable and accessible, the header cell of each sortable column must be identifiable as a sorting button and each must define whether the column is currently sorted in ascending or descending order visually and with the
// aria-sort
// attribute. See the
// ARIA Authoring Practices Guide
// 's
// sortable table example
// for more information.
// Technical summary
// Content categories
// None
// Permitted content
// Zero or more
// <td>
// and/or
// <th>
// elements;
// script-supporting elements
// (
// <script>
// and
// <template>
// ) are also allowed.
// Tag omission
// Start tag is mandatory. End tag may be omitted if the
// <tr>
// element is immediately followed by a
// <tr>
// element, or if the row is the last element
//  in its parent table group (
// <thead>
// ,
// <tbody>
// or
// <tfoot>
// )
//  element.
// Permitted parents
// <table>
// (only if the table has no child
// <tbody>
// element, and even then only after any
// <caption>
// ,
// <colgroup>
// , and
// <thead>
// elements); otherwise, the parent must
//  be a
// <thead>
// ,
// <tbody>
// or
// <tfoot>
// element.
// Implicit ARIA role
// row
// Permitted ARIA roles
// Any
// DOM interface
// HTMLTableRowElement
// Specifications
// Specification
// HTML
// #
// the-tr-element
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
// <tfoot>
// ,
// <th>
// ,
// <thead>
// : Other table-related elements
// background-color
// : CSS property to set the background color of each row cell
// border
// : CSS property to control borders of row cells
// text-align
// : CSS property to horizontally align each row cell content
// vertical-align
// : CSS property to vertically align each row cell content
// :nth-of-type
// ,
// :first-of-type
// ,
// :last-of-type
// : CSS pseudo-classes to select the desired row cells