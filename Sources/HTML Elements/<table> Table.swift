//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Table<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "table" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias table = Table


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table
 */
// <table>: The Table element
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
// <table>
// HTML
// element represents tabular dataâthat is, information presented in a two-dimensional table comprised of rows and columns of cells containing data.
// Try it
// <table>
//  <caption>
//  Front-end web developer course 2021
//  </caption>
//  <thead>
//  <tr>
//  <th scope="col">Person</th>
//  <th scope="col">Most interest in</th>
//  <th scope="col">Age</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Chris</th>
//  <td>HTML tables</td>
//  <td>22</td>
//  </tr>
//  <tr>
//  <th scope="row">Dennis</th>
//  <td>Web accessibility</td>
//  <td>45</td>
//  </tr>
//  <tr>
//  <th scope="row">Sarah</th>
//  <td>JavaScript frameworks</td>
//  <td>29</td>
//  </tr>
//  <tr>
//  <th scope="row">Karen</th>
//  <td>Web performance</td>
//  <td>36</td>
//  </tr>
//  </tbody>
//  <tfoot>
//  <tr>
//  <th scope="row" colspan="2">Average age</th>
//  <td>33</td>
//  </tr>
//  </tfoot>
// </table>
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
//  font-weight: bold;
// }
// thead,
// tfoot {
//  background-color: rgb(228 240 245);
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 8px 10px;
// }
// td:last-of-type {
//  text-align: center;
// }
// tbody > tr:nth-of-type(even) {
//  background-color: rgb(237 238 242);
// }
// tfoot th {
//  text-align: right;
// }
// tfoot td {
//  font-weight: bold;
// }
// Attributes
// This element includes the
// global attributes
// .
// Deprecated attributes
// The following attributes are deprecated and should not be used. They are documented below for reference when updating existing code and for historical interest only.
// align
// Deprecated
// Specifies the horizontal alignment of the table within its parent element. The possible
// enumerated
// values are
// left
// ,
// center
// , and
// right
// . Use the
// margin-inline-start
// and
// margin-inline-end
// CSS properties instead, as this attribute is deprecated.
// bgcolor
// Deprecated
// Defines the background color of the table. The value is an HTML color; either a
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
// border
// Deprecated
// Defines, as a non-negative integer value (in pixels), the size of the frame surrounding the table. If set to
// 0
// , the
// frame
// attribute is set to void. Use the
// border
// CSS property instead, as this attribute is deprecated.
// cellpadding
// Deprecated
// Defines the space between the content of a cell and its border. This attribute is obsolete: instead of using it, apply the
// padding
// CSS property to the
// <th>
// and
// <td>
// elements.
// cellspacing
// Deprecated
// Defines the size of the space between two cells. This attribute is obsolete: instead of using it, set the
// border-spacing
// CSS property on the
// <table>
// element. Note that this has no effect if the
// <table>
// element's
// border-collapse
// CSS property is set to
// collapse
// .
// frame
// Deprecated
// Defines which side of the frame surrounding the table must be displayed. The possible
// enumerated
// values are
// void
// ,
// above
// ,
// below
// ,
// hsides
// ,
// vsides
// ,
// lhs
// ,
// rhs
// ,
// box
// and
// border
// . Use the
// border-style
// and
// border-width
// CSS properties instead, as this attribute is deprecated.
// rules
// Deprecated
// Defines where rules (borders) are displayed in the table. The possible
// enumerated
// values are
// none
// (default value),
// groups
// (
// <thead>
// ,
// <tbody>
// , and
// <tfoot>
// elements),
// rows
// (horizontal lines),
// cols
// (vertical lines), and
// all
// (border around every cell). Use the
// border
// CSS property on the appropriate table-related elements, as well as on the
// <table>
// itself, instead, as this attribute is deprecated.
// summary
// Deprecated
// Defines an alternative text that summarizes the content of the table. Use the
// <caption>
// element instead, as this attribute is deprecated.
// width
// Deprecated
// Specifies the width of the table. Use the
// width
// CSS property instead, as this attribute is deprecated.
// Note:
// While no HTML specification includes
// height
// as a
// <table>
// attribute, some browsers support a non-standard interpretation of
// height
// . The unitless value sets a minimum absolute height in pixels. If set as a percent value, the minimum table height will be relative to the parent container's height. Use the
// min-height
// CSS property instead, as this attribute is deprecated.
// Visual layout of table contents
// Following elements are part of the table structure:
// <caption>
// <thead>
// <colgroup>
// <col>
// <th>
// <tbody>
// <tr>
// <td>
// <tfoot>
// The
// <table>
// box establishes a table formatting context. Elements inside the
// <table>
// generate rectangular boxes. Each box occupies a number of table cells according to the following rules:
// The row boxes fill the table in the source code order from top to bottom. Each row box occupies one row of cells.
// A row group box occupies one or more row boxes.
// Column boxes are placed next to each other in source code order. Depending on the value of the
// dir
// attribute, the columns are laid in left-to-right or right-to-left direction. A column box occupies one or more columns of table cells.
// A column group box occupies one or more column boxes.
// A cell box may span over multiple rows and columns. User agents trim cells to fit in the available number of rows and columns.
// Table cells do have padding. Boxes that make up a table do not have margins.
// Table layers and transparency
// For styling purpose the table elements may be thought of as being put on six superimposed layers:
// The background set on an element in one layer will be visible only if the layers above it have transparent background. A missing cell is rendered as if an anonymous table-cell box occupied that place.
// Accessibility
// Captions
// By supplying a
// <caption>
// element whose value clearly and concisely describes the table's purpose, it helps the people decide if they need to check the rest of the table content or skip over it.
// This helps people navigating with the aid of assistive technology such as a screen reader, people experiencing low vision conditions, and people with cognitive concerns.
// MDN Adding a caption to your table with <caption>
// Caption & Summary â¢ Tables â¢ W3C WAI Web Accessibility Tutorials
// Scoping rows and columns
// The
// scope
// attribute on header cells (
// <th>
// elements) is redundant in simple contexts, because scope is inferred. However, some assistive technologies may fail to draw correct inferences, so specifying header scope may improve user experiences. In complex tables,
// scope
// can be specified to provide necessary information about the cells related to a header.
// MDN table accessibility guide
// Tables with two headers â¢ Tables â¢ W3C WAI Web Accessibility Tutorials
// Tables with irregular headers â¢ Tables â¢ W3C WAI Web Accessibility Tutorials
// H63: Using the scope attribute to associate header cells and data cells in data tables | W3C Techniques for WCAG 2.0
// Complicated tables
// Assistive technologies such as screen readers may have difficulty parsing tables that are so complex that header cells can't be associated in a strictly horizontal or vertical way. This is typically indicated by the presence of the
// colspan
// and
// rowspan
// attributes.
// Ideally, consider alternate ways to present the table's content, including breaking it apart into a collection of smaller, related tables that don't have to rely on using the
// colspan
// and
// rowspan
// attributes. In addition to helping people who use assistive technology understand the table's content, this may also benefit people with cognitive concerns who may have difficulty understanding the associations the table layout is describing.
// If the table cannot be broken apart, use a combination of the
// id
// and
// headers
// attributes to programmatically associate each table cell with the header(s) (
// <th>
// elements) the cell is associated with.
// MDN table accessibility guide
// Tables with multi-level headers â¢ Tables â¢ W3C WAI Web Accessibility Tutorials
// H43: Using id and headers attributes to associate data cells with header cells in data tables | Techniques for W3C WCAG 2.0
// Examples
// The examples below include tables of progressively increasing complexity. See also our beginner's
// Styling tables
// guide for table styling information including common, useful techniques.
// Since the structure of a
// <table>
// involves the use of several table-related HTML elements along with various associated attributes, the following examples are intended to provide a simplified explanation that covers the basics and common standards. Additional and more detailed information can be found on the corresponding linked pages.
// These table examples demonstrate how to create an
// accessible
// table that is structured with HTML and styled with
// CSS
// .
// Because of how HTML tables are structured, the
// markup
// can quickly grow. For this reason, it is important to clearly define the table's purpose and final appearance to create the appropriate structure. A logical structure developed with
// semantic
// markup is not only easier to style, but enables useful and accessible tables that can be understood and navigated by everyone, including search engines and users of assistive technologies.
// The first example is basic, with subsequent examples growing in complexity. First, we will develop a very basic HTML table structure for the table. The first two examples contain no table section groups such as a defined head, body, or foot, and involve no cell spanning or explicitly defined cell relationships. Not even a caption is provided. As we work through the examples, they will be progressively enhanced to include all the table features that a complex data table should possess.
// Basic table
// This example includes a
// very
// basic table with three rows and two columns. To demonstrate default browser table styles, no CSS has been included in this example.
// HTML
// The table rows are defined with
// <tr>
// elements, and the columns are defined with table header and data cells within them. The first row contains the header cells (
// <th>
// elements) that serve as column headers for the data cells (
// <td>
// elements). Each element (
// <th>
// or
// <td>
// ) per row is in its respective columnâthat is, the first element of a row is in the first column, and the second element of that row is in the second column.
// html
// <table>
//  <tr>
//  <th>Name</th>
//  <th>Age</th>
//  </tr>
//  <tr>
//  <td>Maria Sanchez</td>
//  <td>28</td>
//  </tr>
//  <tr>
//  <td>Michael Johnson</td>
//  <td>34</td>
//  </tr>
// </table>
// Result
// There is no custom
// CSS
// or
// user stylesheet
// applied to this table. The styling results purely from the
// user-agent stylesheet
// .
// Expanded table with header cells
// This example extends the
// basic table
// , extending the content and adding basic CSS styles.
// HTML
// The table comprises four rows (
// <tr>
// elements) now, with four columns each. The first row is a row of header cells (The first row contains only
// <th>
// elements). Subsequent rows include a header column (
// <th>
// elements as the first child elements of each row) and three data columns (
// <td>
// elements). As table sectioning elements are not used, the browser automatically defines the content group structure, i.e., all rows are wrapped within the body of the table of an implicit
// <tbody>
// element.
// html
// <table>
//  <tr>
//  <th>Name</th>
//  <th>ID</th>
//  <th>Member Since</th>
//  <th>Balance</th>
//  </tr>
//  <tr>
//  <th>Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th>Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th>Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>15.00</td>
//  </tr>
// </table>
// CSS
// With CSS, we provide the basic styling to create lines around the components of the table to make the data structure clearer. The CSS adds a solid border around the
// <table>
// and around each of the table's cells, including those specified with both
// <th>
// and
// <td>
// elements, demarcating every header and data cells.
// css
// table {
//  border: 2px solid rgb(140 140 140);
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
// }
// Result
// Specifying table cell relations
// Before moving on to extend the table in more advanced ways, it's advisable to improve
// accessibility
// by defining relationships between the header and data cells (
// <th>
// and
// <td>
// elements).
// HTML
// This is accomplished by introducing the
// scope
// attribute on the
// <th>
// elements and setting the values to the corresponding
// col
// (column) or
// row
// value.
// html
// <table>
//  <tr>
//  <th scope="col">Name</th>
//  <th scope="col">ID</th>
//  <th scope="col">Member Since</th>
//  <th scope="col">Balance</th>
//  </tr>
//  <tr>
//  <th scope="row">Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>15.00</td>
//  </tr>
// </table>
// The CSS and visual result are unchangedâthe adaptation provides valuable contextual information for assistive technologies such as screen readers to help identify which cells the headers relate to.
// Note:
// If the table structure is even more complex, the (additional) use of the
// headers
// attribute on the
// <th>
// and
// <td>
// elements may improve accessibility and help assistive technologies identify the relationships between cells; see
// Complicated tables
// .
// Explicitly specifying table section groups
// In addition to improving accessibility by
// specifying cell relations
// , the
// semantics
// of the table can be improved by introducing table section groups.
// HTML
// Since the first row (
// <tr>
// element) contains only column header cells and provides the header for the rest of the table's contents, it can be enclosed in the
// <thead>
// element to explicitly specify that row as the head section of the table. Moreover, what is automatically accomplished by the browser can also be defined explicitlyâthe body section of the table, which contains the main data of the table, is specified by enclosing the corresponding rows in the
// <tbody>
// element. The explicit use of the
// <tbody>
// element helps the browser to create the intended table structure, avoiding unwanted results.
// html
// <table>
//  <thead>
//  <tr>
//  <th scope="col">Name</th>
//  <th scope="col">ID</th>
//  <th scope="col">Member Since</th>
//  <th scope="col">Balance</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>15.00</td>
//  </tr>
//  </tbody>
// </table>
// Once again, the CSS and visual result are unchangedâspecifying such table section groups provides valuable contextual information for assistive technologies, including screen readers and search engines, as well as for styling in the CSS, which will be shown in a later example.
// Column and row spanning
// In this example, we extend the table even more by adding a column and introducing a multi-row head section.
// HTML
// Building on the table created so far, a new column for a "Membership End Date" is added in each body row with the
// <td>
// element. An additional row (
// <tr>
// element) is also added within the head section (
// <thead>
// element) to introduce a "Membership Dates" header as a heading for the "Joined" and "Canceled" columns.
// The creation of the second header row involves adding
// colspan
// and
// rowspan
// attributes to the
// <th>
// elements to allocate the header cells to the correct columns and rows.
// html
// <table>
//  <thead>
//  <tr>
//  <th scope="col" rowspan="2">Name</th>
//  <th scope="col" rowspan="2">ID</th>
//  <th scope="col" colspan="2">Membership Dates</th>
//  <th scope="col" rowspan="2">Balance</th>
//  </tr>
//  <tr>
//  <th scope="col">Joined</th>
//  <th scope="col">Canceled</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>n/a</td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td><time datetime="2017-04-08">April 8, 2017</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>n/a</td>
//  <td>15.00</td>
//  </tr>
//  </tbody>
// </table>
// table {
//  border: 2px solid rgb(140 140 140);
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
// }
// Result
// The head section now has two rows, one with the headers (
// <th>
// elements) "Name", "ID", "Membership Dates", and "Balance", and a "Membership Dates" header with two subheaders that are in a second row: "Joined" and "Canceled". This is accomplished by:
// The first row's "Name", "ID", and "Balance" header cells span both table header rows by using the
// rowspan
// attribute, making them each two rows tall.
// The first row's "Membership Dates" header cell spans two columns using the
// colspan
// attribute, causing it to be two columns wide.
// The second row contains only the two header cells "Joined" and "Canceled" because the other three columns are merged with the cells in the first row that span two rows. The two header cells are correctly positioned under the "Membership Dates" header.
// Table caption and column summary
// It's a common and advisable practice to provide a summary for the table's content, allowing users to quickly determine the table's relevance. Furthermore, the "Balance" column is summarized by displaying the sum of the balances of the individual members.
// HTML
// A table summary is added by using a table
// caption
// (
// <caption>
// element) as the first child element of the
// <table>
// . The caption provides the
// accessible description
// for the table.
// Lastly, a table foot section (
// <tfoot>
// element) is added below the body, with a row that summarizes the "Balance" column by displaying a sum. The elements and attributes introduced earlier are applied.
// html
// <table>
//  <caption>
//  Status of the club members 2021
//  </caption>
//  <thead>
//  <tr>
//  <th scope="col" rowspan="2">Name</th>
//  <th scope="col" rowspan="2">ID</th>
//  <th scope="col" colspan="2">Membership Dates</th>
//  <th scope="col" rowspan="2">Balance</th>
//  </tr>
//  <tr>
//  <th scope="col">Joined</th>
//  <th scope="col">Canceled</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>n/a</td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td><time datetime="2017-04-08">April 8, 2017</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>n/a</td>
//  <td>15.00</td>
//  </tr>
//  </tbody>
//  <tfoot>
//  <tr>
//  <th scope="row" colspan="4">Total balance</th>
//  <td>52.00</td>
//  </tr>
//  </tfoot>
// </table>
// table {
//  border: 2px solid rgb(140 140 140);
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
// }
// Result
// Basic table styling
// Let's apply a basic style to the table to adjust the typeface and add a
// background-color
// to the head and foot rows. The HTML is unchanged this time, so let's dive right into the CSS.
// <table>
//  <caption>
//  Status of the club members 2021
//  </caption>
//  <thead>
//  <tr>
//  <th scope="col" rowspan="2">Name</th>
//  <th scope="col" rowspan="2">ID</th>
//  <th scope="col" colspan="2">Membership Dates</th>
//  <th scope="col" rowspan="2">Balance</th>
//  </tr>
//  <tr>
//  <th scope="col">Joined</th>
//  <th scope="col">Canceled</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>n/a</td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td><time datetime="2017-04-08">April 8, 2017</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>n/a</td>
//  <td>15.00</td>
//  </tr>
//  </tbody>
//  <tfoot>
//  <tr>
//  <th scope="row" colspan="4">Total balance</th>
//  <td>52.00</td>
//  </tr>
//  </tfoot>
// </table>
// CSS
// While a
// font
// property is added to the
// <table>
// element here to set a more visually appealing typeface (or an abominable sans-serif typeface, depending on your personal opinion), the interesting part is the second style, where the
// <tr>
// elements located within the
// <thead>
// and
// <tfoot>
// are styled adding a light blue
// background-color
// . This is a way to quickly apply a background color to all the cells in specific sections simultaneously.
// css
// table {
//  border: 2px solid rgb(140 140 140);
//  font:
//  16px "Open Sans",
//  Helvetica,
//  Arial,
//  sans-serif;
// }
// thead > tr,
// tfoot > tr {
//  background-color: rgb(228 240 245);
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
// }
// Result
// Advanced table styling
// Now we'll go all-out, with styles on rows in the header and body areas both, including alternating row colors, cells with different colors depending on position within a row, and so forth. Let's take a look at the result first this time.
// Result
// Here's what the final table will look like:
// There is no change to the HTML again. See what proper preparation of the HTML structure can do?
// <table>
//  <caption>
//  Status of the club members 2021
//  </caption>
//  <thead>
//  <tr>
//  <th scope="col" rowspan="2">Name</th>
//  <th scope="col" rowspan="2">ID</th>
//  <th scope="col" colspan="2">Membership Dates</th>
//  <th scope="col" rowspan="2">Balance</th>
//  </tr>
//  <tr>
//  <th scope="col">Joined</th>
//  <th scope="col">Canceled</th>
//  </tr>
//  </thead>
//  <tbody>
//  <tr>
//  <th scope="row">Margaret Nguyen</th>
//  <td>427311</td>
//  <td><time datetime="2010-06-03">June 3, 2010</time></td>
//  <td>n/a</td>
//  <td>0.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Edvard Galinski</th>
//  <td>533175</td>
//  <td><time datetime="2011-01-13">January 13, 2011</time></td>
//  <td><time datetime="2017-04-08">April 8, 2017</time></td>
//  <td>37.00</td>
//  </tr>
//  <tr>
//  <th scope="row">Hoshi Nakamura</th>
//  <td>601942</td>
//  <td><time datetime="2012-07-23">July 23, 2012</time></td>
//  <td>n/a</td>
//  <td>15.00</td>
//  </tr>
//  </tbody>
//  <tfoot>
//  <tr>
//  <th scope="row" colspan="4">Total balance</th>
//  <td>52.00</td>
//  </tr>
//  </tfoot>
// </table>
// CSS
// The CSS is much more involved this time. It's not complicated, but there's a lot going on. Let's break it down.
// Here the
// border-collapse
// and
// border-spacing
// properties are added to eliminate spacing between cells and collapse borders that touch one another to be a single border instead of winding up with double borders. Additionally, the
// <caption>
// is placed at the
// bottom
// of the table using the
// caption-side
// property:
// css
// table {
//  border-collapse: collapse;
//  border-spacing: 0;
//  border: 2px solid rgb(140 140 140);
//  font:
//  16px "Open Sans",
//  Helvetica,
//  Arial,
//  sans-serif;
// }
// caption {
//  caption-side: bottom;
//  padding: 10px;
//  font-weight: bold;
// }
// Next, the
// padding
// property is used to give all the table cells space around their content. The
// vertical-align
// property aligns the content of the header cells to the
// bottom
// of the cell, which can be seen on the cells in the head that span two rows:
// css
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 4px 6px;
// }
// th {
//  vertical-align: bottom;
// }
// The next CSS rule sets the
// background-color
// of all
// <tr>
// elements in the table's head (as specified using
// <thead>
// ). Then the bottom border of the head is set to be a two-pixel wide line. Notice, however, that we're using the
// :nth-of-type
// selector to apply the
// border-bottom
// property to the
// second
// row in the head. Why? Because the head is made of two rows that are spanned by some of the cells. That means there are actually two rows there; applying the style to the first row would not give us the expected result:
// css
// thead > tr {
//  background-color: rgb(228 240 245);
// }
// thead > tr:nth-of-type(2) {
//  border-bottom: 2px solid rgb(140 140 140);
// }
// Let's style the two header cells "Joined" and "Canceled" with green and red hues to represent the "good" of a new member and the "bummer" of a canceled membership. Here we dig into the last row of the table's head section using the
// :last-of-type
// selector and give the first header cell in it (the "Joined" header) a greenish color, and the second header cell in it (the "Canceled" header) a reddish hue:
// css
// thead > tr:last-of-type > th:nth-of-type(1) {
//  background-color: rgb(225 255 225);
// }
// thead > tr:last-of-type > th:nth-of-type(2) {
//  background-color: rgb(255 225 225);
// }
// Since the first column should stand out as well, some custom styling is added here too. This CSS rule styles the first header cell in each row of the table's body with the
// text-align
// property to left-justify the member names, and with a somewhat different
// background-color
// :
// css
// tbody > tr > th:first-of-type {
//  text-align: left;
//  background-color: rgb(225 229 244);
// }
// It's common to help improve the readability of table data by alternating row colorsâthis is sometimes referred to as "zebra striping". Let's add a bit of
// background-color
// to every even row:
// css
// tbody > tr:nth-of-type(even) {
//  background-color: rgb(237 238 242);
// }
// Since it's standard practice to right-justify currency values in tables, let's do that here. This just sets the
// text-align
// property for the last
// <td>
// in each body row to
// right
// :
// css
// tbody > tr > td:last-of-type {
//  text-align: right;
// }
// Finally, some styling similar to the head is applied to the foot section of the table to make it stand out as well:
// css
// tfoot > tr {
//  border-top: 2px dashed rgb(140 140 140);
//  background-color: rgb(228 240 245);
// }
// tfoot th,
// tfoot td {
//  text-align: right;
//  font-weight: bold;
// }
// Displaying large tables in small spaces
// A common issue with tables on the web is that they don't natively work very well on small screens when the amount of content is large, and the way to make them scrollable isn't obvious, especially when the markup may come from a CMS and cannot be modified to have a wrapper.
// This example provides one way to display tables in small spaces. We've hidden the HTML content as it is very large, and there is nothing remarkable about it. The CSS is more useful to inspect in this example.
// <table>
//  <thead>
//  <tr>
//  <th>1<sup>3</sup> equals:
//  <th>2<sup>3</sup> equals:
//  <th>3<sup>3</sup> equals:
//  <th>4<sup>3</sup> equals:
//  <th>5<sup>3</sup> equals:
//  <th>6<sup>3</sup> equals:
//  <th>7<sup>3</sup> equals:
//  <tbody>
//  <tr>
//  <td>row 1: 1
//  <td>row 1: 8
//  <td>row 1: 27
//  <td>row 1: 64
//  <td>row 1: 125
//  <td>row 1: 216
//  <td>row 1: 343
//  <tr>
//  <td>row 2: 1
//  <td>row 2: 8
//  <td>row 2: 27
//  <td>row 2: 64
//  <td>row 2: 125
//  <td>row 2: 216
//  <td>row 2: 343
//  <tr>
//  <td>row 3: 1
//  <td>row 3: 8
//  <td>row 3: 27
//  <td>row 3: 64
//  <td>row 3: 125
//  <td>row 3: 216
//  <td>row 3: 343
//  <tr>
//  <td>row 4: 1
//  <td>row 4: 8
//  <td>row 4: 27
//  <td>row 4: 64
//  <td>row 4: 125
//  <td>row 4: 216
//  <td>row 4: 343
//  <tr>
//  <td>row 5: 1
//  <td>row 5: 8
//  <td>row 5: 27
//  <td>row 5: 64
//  <td>row 5: 125
//  <td>row 5: 216
//  <td>row 5: 343
//  <tr>
//  <td>row 6: 1
//  <td>row 6: 8
//  <td>row 6: 27
//  <td>row 6: 64
//  <td>row 6: 125
//  <td>row 6: 216
//  <td>row 6: 343
//  <tr>
//  <td>row 7: 1
//  <td>row 7: 8
//  <td>row 7: 27
//  <td>row 7: 64
//  <td>row 7: 125
//  <td>row 7: 216
//  <td>row 7: 343
//  <tr>
//  <td>row 8: 1
//  <td>row 8: 8
//  <td>row 8: 27
//  <td>row 8: 64
//  <td>row 8: 125
//  <td>row 8: 216
//  <td>row 8: 343
//  <tr>
//  <td>row 9: 1
//  <td>row 9: 8
//  <td>row 9: 27
//  <td>row 9: 64
//  <td>row 9: 125
//  <td>row 9: 216
//  <td>row 9: 343
//  <tr>
//  <td>row 10: 1
//  <td>row 10: 8
//  <td>row 10: 27
//  <td>row 10: 64
//  <td>row 10: 125
//  <td>row 10: 216
//  <td>row 10: 343
//  <tr>
//  <td>row 11: 1
//  <td>row 11: 8
//  <td>row 11: 27
//  <td>row 11: 64
//  <td>row 11: 125
//  <td>row 11: 216
//  <td>row 11: 343
//  <tr>
//  <td>row 12: 1
//  <td>row 12: 8
//  <td>row 12: 27
//  <td>row 12: 64
//  <td>row 12: 125
//  <td>row 12: 216
//  <td>row 12: 343
//  <tr>
//  <td>row 13: 1
//  <td>row 13: 8
//  <td>row 13: 27
//  <td>row 13: 64
//  <td>row 13: 125
//  <td>row 13: 216
//  <td>row 13: 343
//  <tr>
//  <td>row 14: 1
//  <td>row 14: 8
//  <td>row 14: 27
//  <td>row 14: 64
//  <td>row 14: 125
//  <td>row 14: 216
//  <td>row 14: 343
//  <tr>
//  <td>row 15: 1
//  <td>row 15: 8
//  <td>row 15: 27
//  <td>row 15: 64
//  <td>row 15: 125
//  <td>row 15: 216
//  <td>row 15: 343
//  <tr>
//  <td>row 16: 1
//  <td>row 16: 8
//  <td>row 16: 27
//  <td>row 16: 64
//  <td>row 16: 125
//  <td>row 16: 216
//  <td>row 16: 343
//  <tr>
//  <td>row 17: 1
//  <td>row 17: 8
//  <td>row 17: 27
//  <td>row 17: 64
//  <td>row 17: 125
//  <td>row 17: 216
//  <td>row 17: 343
//  <tr>
//  <td>row 18: 1
//  <td>row 18: 8
//  <td>row 18: 27
//  <td>row 18: 64
//  <td>row 18: 125
//  <td>row 18: 216
//  <td>row 18: 343
//  <tr>
//  <td>row 19: 1
//  <td>row 19: 8
//  <td>row 19: 27
//  <td>row 19: 64
//  <td>row 19: 125
//  <td>row 19: 216
//  <td>row 19: 343
//  <tr>
//  <td>row 20: 1
//  <td>row 20: 8
//  <td>row 20: 27
//  <td>row 20: 64
//  <td>row 20: 125
//  <td>row 20: 216
//  <td>row 20: 343
// </table>
// CSS
// When looking at these styles you'll notice that table's
// display
// property has been set to
// block
// . While this allows scrolling, the table loses some of its integrity, and table cells try to become as small as possible. To mitigate this issue we've set
// white-space
// to
// nowrap
// on the
// <tbody>
// . However, we don't do this for the
// <thead>
// to avoid long titles forcing columns to be wider than they need to be to display the data.
// To keep the table headers on the page while scrolling down we've set
// position
// to sticky on the
// <th>
// elements. Note that we have
// not
// set
// border-collapse
// to
// collapse
// , as if we do the header cannot be separated correctly from the rest of the table.
// Given that the
// <table>
// has a fixed size, the
// overflow
// set to
// auto
// is the important part here, as it makes the table scrollable.
// css
// table,
// th,
// td {
//  border: 1px solid black;
// }
// table {
//  overflow: auto;
//  width: 100%;
//  max-width: 400px;
//  height: 240px;
//  display: block;
//  margin: 0 auto;
//  border-spacing: 0;
// }
// tbody {
//  white-space: nowrap;
// }
// th,
// td {
//  padding: 5px 10px;
//  border-top-width: 0;
//  border-left-width: 0;
// }
// th {
//  position: sticky;
//  top: 0;
//  background: #fff;
//  vertical-align: bottom;
// }
// th:last-child,
// td:last-child {
//  border-right-width: 0;
// }
// tr:last-child td {
//  border-bottom-width: 0;
// }
// Result
// Technical summary
// Content categories
// Flow content
// Permitted content
// In this order:
// an optional
// <caption>
// element,
// zero or more
// <colgroup>
// elements,
// an optional
// <thead>
// element,
// either one of the following:
// zero or more
// <tbody>
// elements
// one or more
// <tr>
// elements
// an optional
// <tfoot>
// element
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts flow content
// Implicit ARIA role
// table
// Permitted ARIA roles
// Any
// DOM interface
// HTMLTableElement
// Specifications
// Specification
// HTML
// #
// the-table-element
// Browser compatibility
// See also
// Learn: HTML table basics
// <caption>
// ,
// <col>
// ,
// <colgroup>
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
// background-color
// : CSS property to set the background color of the table
// border
// ,
// border-collapse
// ,
// border-spacing
// : CSS properties to control the aspect of cell borders, rules, and frame
// margin
// ,
// padding
// : CSS properties to align the table and set spacing on cell content
// text-align
// : CSS property to horizontally align table cell content
// vertical-align
// : CSS property to vertically align table cell content
// width
// : CSS property to control the width of the table