///
/// <colgroup> Table Column Group.swift
/// swift-html
///
/// Represents the HTML table column group element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML table column group element (`<colgroup>`), which defines a group of columns 
/// within a table.
///
/// The `TableColumnGroup` struct provides a type-safe way to create HTML column group elements. 
/// The `<colgroup>` element is used to apply properties to entire groups of columns in a table.
///
/// ## Example
///
/// ```swift
/// // With span attribute (no col elements inside):
/// table {
///   caption {
///     "Personal weekly activities"
///   }
///   colgroup(span: 5, class: "weekdays") 
///   colgroup(span: 2, class: "weekend")
///   // Table rows would follow here
/// }
///
/// // With col elements inside (no span attribute):
/// table {
///   caption {
///     "Superheros and sidekicks"
///   }
///   colgroup {
///     col()
///     col(span: 2, class: "batman")
///     col(span: 2, class: "flash")
///   }
///   // Table rows would follow here
/// }
/// ```
///
/// ## Usage Notes
///
/// - The `<colgroup>` element should appear within a `<table>`, after any `<caption>` element,
///   but before any `<thead>`, `<tbody>`, `<tfoot>`, and `<tr>` elements
/// - If a `span` attribute is present, the `<colgroup>` cannot contain any `<col>` elements
/// - If no `span` attribute is present, the `<colgroup>` can contain zero or more `<col>` elements
/// - Limited CSS properties have an effect: background, border, visibility, and width
///
/// ## Best Practices
///
/// - Use column groups to apply consistent styling to multiple columns at once
/// - For complex tables, use meaningful class names for your column groups
/// - Consider using `<colgroup>` with `<col>` elements for more granular control 
///   of individual columns
///
/// - Note: When rendered, this generates an HTML `<colgroup>` element containing column definitions.
public struct TableColumnGroup<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "colgroup" }
    
    /// The number of consecutive columns this column group spans
    /// Note: Cannot be used if the column group contains col elements
    public var span: HTML_Attributes.Span?
    
    /// The content of the column group, typically col elements
    public let content: () -> HTML
    
    /// Creates a new TableColumnGroup element with an optional span attribute and content.
    ///
    /// - Parameters:
    ///   - span: The number of consecutive columns this column group spans
    ///   - content: The content of the column group, typically col elements
    ///
    /// - Note: Either use the span attribute OR include col elements as content, not both.
    ///   According to the HTML specification, if the span attribute is present, 
    ///   the colgroup element cannot contain any col elements.
    public init(
        span: HTML_Attributes.Span? = nil,
        content: @escaping () -> HTML = { fatalError("Content not provided for TableColumnGroup") }
    ) {
        self.span = span
        self.content = content
    }
}

/// Lowercase typealias for creating TableColumnGroup elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `colgroup` identifier when creating
/// HTML column group elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// colgroup(span: 5, class: "weekdays")
/// ```
/// Or:
/// ```swift
/// colgroup {
///   col()
///   col(span: 2)
/// }
/// ```
public typealias colgroup = TableColumnGroup


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/colgroup
 */
// <colgroup>: The Table Column Group element
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
// <colgroup>
// HTML
// element defines a group of columns within a table.
// Try it
// <table>
//  <caption>
//  Superheros and sidekicks
//  </caption>
//  <colgroup>
//  <col />
//  <col span="2" class="batman" />
//  <col span="2" class="flash" />
//  </colgroup>
//  <tr>
//  <td></td>
//  <th scope="col">Batman</th>
//  <th scope="col">Robin</th>
//  <th scope="col">The Flash</th>
//  <th scope="col">Kid Flash</th>
//  </tr>
//  <tr>
//  <th scope="row">Skill</th>
//  <td>Smarts, strong</td>
//  <td>Dex, acrobat</td>
//  <td>Super speed</td>
//  <td>Super speed</td>
//  </tr>
// </table>
// .batman {
//  background-color: #d7d9f2;
// }
// .flash {
//  background-color: #ffe8d4;
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
//  padding: 8px 6px;
// }
// td {
//  text-align: center;
// }
// Attributes
// This element includes the
// global attributes
// .
// span
// Specifies the number of consecutive columns the
// <colgroup>
// element spans. The value must be a positive integer greater than zero. If not present, its default value is
// 1
// .
// Note:
// The
// span
// attribute is not permitted if there are one or more
// <col>
// elements within the
// <colgroup>
// .
// Deprecated attributes
// The following attributes are deprecated and should not be used. They are documented below for reference when updating existing code and for historical interest only.
// align
// Deprecated
// Specifies the horizontal alignment of each column group cell. The possible
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
// attribute and the offset defined by the
// charoff
// attribute. Note that the descendant
// <col>
// elements may override this value using their own
// align
// attribute. Use the
// text-align
// CSS property on the
// <td>
// and
// <th>
// elements instead, as this attribute is deprecated.
// Note:
// Setting
// text-align
// on the
// <colgroup>
// element has no effect as
// <td>
// and
// <th>
// elements are not descendants of the
// <colgroup>
// element, and therefore they do not inherit from it.
// If the table does not use a
// colspan
// attribute, use the
// td:nth-of-type(an+b)
// CSS selector per column, where
// a
// is the total number of the columns in the table and
// b
// is the ordinal position of the column in the table, e.g.,
// td:nth-of-type(7n+2) { text-align: right; }
// to right-align the second column cells.
// If the table does use a
// colspan
// attribute, the effect can be achieved by combining adequate CSS attribute selectors like
// [colspan=n]
// , though this is not trivial.
// bgcolor
// Deprecated
// Defines the background color of each column group cell. The value is an HTML color; either a
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
// Does nothing. It was originally intended to specify the alignment of the content to a character of each column group cell. Typical values for this include a period (
// .
// ) when attempting to align numbers or monetary values. If
// align
// is not set to
// char
// , this attribute is ignored, though it will still be used as the default value for the
// align
// of the
// <col>
// elements which are members of this column group.
// charoff
// Deprecated
// Does nothing. It was originally intended to specify the number of characters to offset the column group cell content from the alignment character specified by the
// char
// attribute.
// valign
// Deprecated
// Specifies the vertical alignment of each column group cell. The possible
// enumerated
// values are
// baseline
// ,
// bottom
// ,
// middle
// , and
// top
// . Note that the descendant
// <col>
// elements may override this value using their own
// valign
// attribute. Use the
// vertical-align
// CSS property on the
// <td>
// and
// <th>
// elements instead, as this attribute is deprecated.
// Note:
// Setting
// vertical-align
// on the
// <colgroup>
// element has no effect as
// <td>
// and
// <th>
// elements are not descendants of the
// <colgroup>
// element, and therefore they do not inherit from it.
// If the table does not use a
// colspan
// attribute, use the
// td:nth-of-type()
// CSS selector per column, e.g.,
// td:nth-of-type(2) { vertical-align: middle; }
// to center the second column cells vertically.
// If the table does use a
// colspan
// attribute, the effect can be achieved by combining adequate CSS attribute selectors like
// [colspan=n]
// , though this is not trivial.
// width
// Deprecated
// Specifies a default width for each column in the current column group. In addition to the standard pixel and percentage values, this attribute can take the special form
// 0*
// , which means that the width of each column spanned should be the minimum width necessary to hold the column's contents. Relative widths such as
// 5*
// can also be used. Note that the descendant
// <col>
// elements may override this value using their own
// width
// attribute. Use the
// width
// CSS property instead, as this attribute is deprecated.
// Usage notes
// The
// <colgroup>
// should appear within a
// <table>
// , after any
// <caption>
// element (if used), but before any
// <thead>
// ,
// <tbody>
// ,
// <tfoot>
// , and
// <tr>
// elements.
// Only a limited number of CSS properties affect
// <colgroup>
// :
// background
// : The various
// background
// properties will set the background for cells within the column group. As the column group background color is painted on top of the table, but behind background colors applied to the columns (
// <col>
// ), the row groups (
// <thead>
// ,
// <tbody>
// , and
// <tfoot>
// ), the rows (
// <tr>
// ), and the individual cells (
// <th>
// and
// <td>
// ), backgrounds applied to table column groups are only visible if every layer painted on top of them has a transparent background.
// border
// : The various
// border
// properties apply, but only if the
// <table>
// has
// border-collapse: collapse
// set.
// visibility
// : The value
// collapse
// for a column group results in all cells of the columns in that column group not being rendered, and cells spanning into other columns being clipped. The space these columns in the column group would have occupied is removed. However, the size of other columns is still calculated as though the cells in the collapsed column(s) in the column group are present. Other values for
// visibility
// have no effect.
// width
// : The
// width
// property defines a minimum width for the columns within the column group, as if
// min-width
// were set.
// Example
// See
// <table>
// for a complete table example introducing common standards and best practices.
// This example demonstrates a seven-column table divided into two
// <colgroup>
// elements that span multiple columns.
// HTML
// Two
// <colgroup>
// elements are used to structure a basic table by creating column groups. The number of columns in each column group is specified by the
// span
// attribute.
// html
// <table>
//  <caption>
//  Personal weekly activities
//  </caption>
//  <colgroup span="5" class="weekdays"></colgroup>
//  <colgroup span="2" class="weekend"></colgroup>
//  <tr>
//  <th>Mon</th>
//  <th>Tue</th>
//  <th>Wed</th>
//  <th>Thu</th>
//  <th>Fri</th>
//  <th>Sat</th>
//  <th>Sun</th>
//  </tr>
//  <tr>
//  <td>Clean room</td>
//  <td>Football training</td>
//  <td>Dance Course</td>
//  <td>History Class</td>
//  <td>Buy drinks</td>
//  <td>Study hour</td>
//  <td>Free time</td>
//  </tr>
//  <tr>
//  <td>Yoga</td>
//  <td>Chess Club</td>
//  <td>Meet friends</td>
//  <td>Gymnastics</td>
//  <td>Birthday party</td>
//  <td>Fishing trip</td>
//  <td>Free time</td>
//  </tr>
// </table>
// CSS
// Grouped columns can be used to visually highlight the structure using CSS:
// css
// table {
//  border-collapse: collapse;
//  border: 2px solid rgb(140 140 140);
// }
// caption {
//  caption-side: bottom;
//  padding: 10px;
// }
// th,
// td {
//  border: 1px solid rgb(160 160 160);
//  padding: 8px 6px;
//  text-align: center;
// }
// .weekdays {
//  background-color: #d7d9f2;
// }
// .weekend {
//  background-color: #ffe8d4;
// }
// table {
//  font-family: sans-serif;
//  font-size: 0.8rem;
//  letter-spacing: 1px;
// }
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// If the
// span
// attribute is
//  present: none.
// If
//  the attribute is not present: zero or more
// <col>
// element
// Tag omission
// The start tag may be omitted, if it has a
// <col>
// element as its first child and if it is not preceded by a
// <colgroup>
// whose end tag has been omitted.
// The
//  end tag may be omitted, if it is not followed by a space or a comment.
// Permitted parents
// A
// <table>
// element. The
// <colgroup>
// must appear after any
// <caption>
// element, but before any
// <thead>
// ,
// <tbody>
// ,
// <tfoot>
// , and
// <tr>
// elements.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLTableColElement
// Specifications
// Specification
// HTML
// #
// the-colgroup-element
// Browser compatibility
// See also
// Learn: HTML table basics
// <caption>
// ,
// <col>
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
// background-color
// : CSS property to set the background color of each column group cell
// border
// : CSS property to control borders of column group cells
// text-align
// : CSS property to horizontally align each column group cell content
// vertical-align
// : CSS property to vertically align each column group cell content
// visibility
// : CSS property to hide (or show) cells of a column group
// width
// : CSS property to control the default width for each column in a column group
// :nth-of-type
// ,
// :first-of-type
// ,
// :last-of-type
// : CSS pseudo-classes to select the desired column cells