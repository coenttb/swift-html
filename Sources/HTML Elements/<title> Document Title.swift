///
/// <title> Document Title.swift
/// swift-html
///
/// Represents the HTML title element that defines a document's title.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML title element (`<title>`), which defines the document's title
/// that is shown in a browser's title bar or a page's tab.
///
/// The `Title` struct provides a type-safe way to create the HTML title element,
/// which is an essential part of every HTML document and must be contained within
/// the head section. It only contains text; any tags within the element are ignored.
///
/// ## Example
///
/// ```swift
/// html {
///   head {
///     title { "Product Catalog - Example Company" }
///     // other metadata
///   }
///   body {
///     // page content
///   }
/// }
/// ```
///
/// ## Best Practices
///
/// - Every HTML document should have a unique, descriptive title
/// - Keep titles under 55-60 characters (search engine display limit)
/// - Put the most important information at the beginning of the title
/// - Avoid single word titles or keyword lists
/// - Include your site name, but typically after the page-specific information
/// - Use a pattern like "Page Name - Site Name" for consistency
///
/// ## SEO and Accessibility
///
/// - Title is a major factor in search engine ranking algorithms
/// - Screen readers announce the title when users navigate to a page
/// - Descriptive titles help users determine if the page contains relevant information
/// - When updating the title dynamically, consider using ARIA Live Regions
///
/// - Note: When rendered, this generates the HTML `<title>` element, which must be
///   placed within the `<head>` element of an HTML document.
public struct Title<HTML>: Element {
    public static var tag: String { "title" }
    
    /// The text content of the title element.
    ///
    /// This should be a descriptive phrase that clearly communicates the purpose of the page.
    /// Only text content is permitted; any HTML tags will be ignored by browsers.
    public var content: () -> HTML
    
    /// Creates a new Title element with the specified text content.
    ///
    /// - Parameter content: The text content of the title element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Title elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `title` identifier when creating
/// HTML title elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// title { "Home Page - My Website" }
/// ```
public typealias title = Title


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title
 */
// <title>: The Document Title element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <title>
// HTML
// element defines the document's title that is shown in a
// browser
// 's title bar or a page's tab. It only contains text; tags within the element are ignored.
// html
// <title>Grandma's Heavy Metal Festival Journal</title>
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <title>
// element is always used within a page's
// <head>
// block.
// Page titles and SEO
// The contents of a page title can have significant implications for search engine optimization (
// SEO
// ). In general, a longer, descriptive title performs better than short or generic titles. The content of the title is one of the components used by search engine algorithms to decide the order in which to list pages in search results. Also, the title is the initial "hook" by which you grab the attention of readers glancing at the search results page.
// A few guidelines and tips for composing good titles:
// Avoid one- or two-word titles. Use a descriptive phrase, or a term-definition pairing for glossary or reference-style pages.
// Search engines typically display about the first 55â60 characters of a page title. Text beyond that may be lost, so try not to have titles longer than that. If you must use a longer title, make sure the important parts come earlier and that nothing critical is in the part of the title that is likely to be dropped.
// Don't use "keyword blobs." If your title is just a list of words, algorithms often reduce your page's position in the search results.
// Try to make sure your titles are as unique as possible within your own site. Duplicateâor near-duplicateâtitles can contribute to inaccurate search results.
// Accessibility
// It is important to provide an accurate and concise title to describe the page's purpose.
// A common navigation technique for users of assistive technology is to read the page title and infer the content the page contains. This is because navigating into a page to determine its content can be a time-consuming and potentially confusing process. Titles should be unique to every page of a website, ideally surfacing the primary purpose of the page first, followed by the name of the website. Following this pattern will help ensure that the primary purpose of the page is announced by a screen reader first. This provides a far better experience than having to listen to the name of a website before the unique page title, for every page a user navigates to in the same website.
// Examples
// html
// <title>Menu - Blue House Chinese Food - FoodYum: Online takeout today!</title>
// If a form submission contains errors and the submission re-renders the current page, the title can be used to help make users aware of any errors with their submission. For instance, update the page
// title
// value to reflect significant page state changes (such as form validation problems).
// html
// <title>
//  2 errors - Your order - Sea Food Store - Food: Online takeout today!
// </title>
// Note:
// Presently, dynamically updating a page's title will not be automatically announced by screen readers. If you are going to update the page title to reflect significant changes to a page's state, then the use of
// ARIA Live Regions
// may be necessary, as well.
// MDN Understanding WCAG, Guideline 2.4 explanations
// Understanding Success Criterion 2.4.2 | W3C Understanding WCAG 2.1
// Examples
// html
// <title>Awesome interesting stuff</title>
// This example establishes a page whose title (as displayed at the top of the window or in the window's tab) as "Awesome interesting stuff".
// Technical summary
// Content categories
// Metadata content
// .
// Permitted content
// Text that is not inter-element
// whitespace
// .
// Tag omission
// Both opening and closing tags are required. Note that leaving off
// </title>
// should cause the browser to ignore the rest
//  of the page.
// Permitted parents
// A
// <head>
// element that contains no other
// <title>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted.
// DOM interface
// HTMLTitleElement
// Specifications
// Specification
// HTML
// #
// the-title-element
// Browser compatibility
// See also
// SVG
// <title>
// element