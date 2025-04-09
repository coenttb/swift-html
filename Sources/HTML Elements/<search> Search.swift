//
// <search> Search.swift
// swift-html
//
// Represents the HTML search element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML search element (`<search>`), which is a container representing parts of the document or application with form controls or other content related to performing a search or filtering operation.
///
/// The `Search` struct provides a type-safe way to create HTML search elements.
///
/// ## Example
///
/// ```swift
/// search {
///     form {
///         label {
///             "Find a Movie"
///             for_("movie")
///         }
///         input.search {
///             id("movie")
///             name("q")
///         }
///         button.submit {
///             "Search"
///         }
///     }
/// }
/// ```
///
/// ## Usage Notes
///
/// - The `<search>` element is not for presenting search results. Rather, search results should be presented as part of the main content of the web page.
/// - Suggestions and links that are part of "quick search" functionality are appropriately nested within the contents of the `<search>` element as they are search features.
///
/// ## Accessibility
///
/// - The `<search>` element defines a "search" landmark, removing the need to add `role="search"` to a `<form>` element.
/// - When multiple search elements exist on a page, consider using the `title` attribute to distinguish between them.
///
public struct Search<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "search" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Search element.
    ///
    /// - Parameter content: The content of the search element
    public init(content: @escaping () -> HTML) {
        self.content = content
    }
}

/// Lowercase typealias for creating Search elements with a more HTML-like syntax.
public typealias search = Search

/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/search
 */
// <search>: The generic search element
// Baseline
// 2023
// Newly available
// Since
// October 2023
// , this feature works across the latest devices and browser versions. This feature might not work in older devices or browsers.
// Learn more
// See full compatibility
// Report feedback
// The
// <search>
// HTML
// element is a container representing the parts of the document or application with form controls or other content related to performing a search or filtering operation. The
// <search>
// element semantically identifies the purpose of the element's contents as having search or filtering capabilities. The search or filtering functionality can be for the website or application, the current web page or document, or the entire Internet or subsection thereof.
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <search>
// element is not for presenting search results. Rather, search or filtered results should be presented as part of the main content of that web page. That said, suggestions and links that are part of "quick search" functionality within the search or filtering functionality are appropriately nested within the contents of the
// <search>
// element as they are search features.
// Accessibility
// The
// <search>
// element defines a
// search
// landmark. This removes the need for adding
// role=search
// to a
// <form>
// element.
// Examples
// Header search form
// This example demonstrates the use of
// <search>
// as the container for a search within a website header to perform a site-wide search. The
// <search>
// is a semantic container for the
// <form>
// that submits the user-entered search query to a server.
// HTML
// html
// <header>
//  <h1>Movie website</h1>
//  <search>
//  <form action="./search/">
//  <label for="movie">Find a Movie</label>
//  <input type="search" id="movie" name="q" />
//  <button type="submit">Search</button>
//  </form>
//  </search>
// </header>
// Result
// Web app search
// This example demonstrates potential DOM content when dynamically including JavaScript search functionality in a web application. When search functionality is implemented entirely with JavaScript, if no form is submitted, neither a
// <form>
// element nor a submit
// <button>
// is required. For semantics, the
// <search>
// element is included to contain the search and filtering capabilities.
// HTML
// html
// <search>
//  <label>
//  Find and filter your query
//  <input type="search" id="query" />
//  </label>
//  <label>
//  <input type="checkbox" id="exact-only" />
//  Exact matches only
//  </label>
//  <section>
//  <h3>Results:</h3>
//  <ul id="results">
//  <!-- search result content -->
//  </ul>
//  <output id="no-results">
//  <!-- no results content -->
//  </output>
//  </section>
// </search>
// Result
// Note:
// Remember that some users don't have JavaScript, and none of your users have JavaScript running until the JavaScript is successfully downloaded, parsed, and executed. Ensure your users can access the content of your site with JavaScript disabled.
// Multiple searches
// This example demonstrates a page with two search features. The first is a global site search located on the header. The second is a search and filter based on the page context, in our example a car search.
// HTML
// html
// <body>
//  <header>
//  <h1>Car rental agency</h1>
//  <search title="Website">...</search>
//  </header>
//  <main>
//  <h2>Cars available for rent</h2>
//  <search title="Cars">
//  <h3>Filter results</h3>
//  ...
//  </search>
//  <article>
//  <!-- search result content -->
//  </article>
//  </main>
// </body>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// palpable content
// .
// Permitted content
// Flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Implicit ARIA role
// search
// Permitted ARIA roles
// form
// ,
// group
// ,
// none
// ,
// presentation
// ,
// region
// ,
// search
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-search-element
// Browser compatibility
// See also
// Other search-related elements:
// <header>
// ,
// <footer>
// ,
// <aside>
// ,
// <nav>
// ,
// <form>
// ARIA: Search role