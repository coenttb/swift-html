///
/// <article> Article Contents.swift
/// swift-html
///
/// Represents the HTML article element for independent, self-contained content.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML article element (`<article>`), which defines a self-contained composition
/// that is intended to be independently distributable or reusable.
///
/// The `Article` struct provides a type-safe way to create HTML article elements that represent
/// independent pieces of content, such as blog posts, news articles, forum posts, or comments.
///
/// ## Example
///
/// ```swift
/// article {
///   heading1 { "Weather forecast for Seattle" }
///   article {
///     heading2 { "03 March 2018" }
///     paragraph { "Rain." }
///   }
///   article {
///     heading2 { "04 March 2018" }
///     paragraph { "Periods of rain." }
///   }
/// }
/// ```
///
/// ## Best Practices
///
/// - Each article should be identified with a heading element (`<h1>-<h6>`)
/// - Nested articles represent content related to the parent article (e.g., comments)
/// - Author information can be provided using the `<address>` element
/// - Publication dates should use the `<time>` element with a datetime attribute
/// - Use `<section>` elements for logical divisions within an article
/// - Don't place article elements inside `<address>` elements
///
/// - Note: When rendered, this generates an HTML `<article>` element with the appropriate
///   attributes based on the configuration.
public struct Article<HTML>: Element {
    public static var tag: String { "article" }
    
    /// The content of the article element, which can include any flow content.
    ///
    /// This should include a heading element (`<h1>-<h6>`) to identify the article,
    /// and can contain nested articles for related content like comments.
    public var content: () -> HTML
    
    /// Creates a new Article element with the specified content.
    ///
    /// - Parameter content: The content of the article element, typically including a heading
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Article elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `article` identifier when creating
/// HTML article elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// article {
///   heading2 { "Blog Post Title" }
///   paragraph { "Content goes here..." }
/// }
/// ```
public typealias article = Article


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/article
 */
// <article>: The Article Contents element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <article>
// HTML
// element represents a self-contained composition in a document, page, application, or site, which is intended to be independently distributable or reusable (e.g., in syndication). Examples include: a forum post, a magazine or newspaper article, or a blog entry, a product card, a user-submitted comment, an interactive widget or gadget, or any other independent item of content.
// Try it
// <article class="forecast">
//  <h1>Weather forecast for Seattle</h1>
//  <article class="day-forecast">
//  <h2>03 March 2018</h2>
//  <p>Rain.</p>
//  </article>
//  <article class="day-forecast">
//  <h2>04 March 2018</h2>
//  <p>Periods of rain.</p>
//  </article>
//  <article class="day-forecast">
//  <h2>05 March 2018</h2>
//  <p>Heavy rain.</p>
//  </article>
// </article>
// .forecast {
//  margin: 0;
//  padding: 0.3rem;
//  background-color: #eee;
// }
// .forecast > h1,
// .day-forecast {
//  margin: 0.5rem;
//  padding: 0.3rem;
//  font-size: 1.2rem;
// }
// .day-forecast {
//  background: right/contain content-box border-box no-repeat
//  url("/shared-assets/images/examples/rain.svg") white;
// }
// .day-forecast > h2,
// .day-forecast > p {
//  margin: 0.2rem;
//  font-size: 1rem;
// }
// A given document can have multiple articles in it; for example, on a blog that shows the text of each article one after another as the reader scrolls, each post would be contained in an
// <article>
// element, possibly with one or more
// <section>
// s within.
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Each
// <article>
// should be identified, typically by including a heading (
// <h1>
// -
// <h6>
// element) as a child of the
// <article>
// element.
// When an
// <article>
// element is nested, the inner element represents an article related to the outer element. For example, the comments of a blog post can be
// <article>
// elements nested in the
// <article>
// representing the blog post.
// Author information of an
// <article>
// element can be provided through the
// <address>
// element, but it doesn't apply to nested
// <article>
// elements.
// The publication date and time of an
// <article>
// element can be described using the
// datetime
// attribute of a
// <time>
// element.
// Examples
// html
// <article class="film_review">
//  <h2>Jurassic Park</h2>
//  <section class="main_review">
//  <h3>Review</h3>
//  <p>Dinos were great!</p>
//  </section>
//  <section class="user_reviews">
//  <h3>User reviews</h3>
//  <article class="user_review">
//  <h4>Too scary!</h4>
//  <p>Way too scary for me.</p>
//  <footer>
//  <p>
//  Posted on
//  <time datetime="2015-05-16 19:00">May 16</time>
//  by Lisa.
//  </p>
//  </footer>
//  </article>
//  <article class="user_review">
//  <h4>Love the dinos!</h4>
//  <p>I agree, dinos are my favorite.</p>
//  <footer>
//  <p>
//  Posted on
//  <time datetime="2015-05-17 19:00">May 17</time>
//  by Tom.
//  </p>
//  </footer>
//  </article>
//  </section>
//  <footer>
//  <p>
//  Posted on
//  <time datetime="2015-05-15 19:00">May 15</time>
//  by Staff.
//  </p>
//  </footer>
// </article>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// sectioning content
// ,
// palpable content
// Permitted content
// Flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// . Note that an
// <article>
// element must not be a
//  descendant of an
// <address>
// element.
// Implicit ARIA role
// article
// Permitted ARIA roles
// application
// ,
// document
// ,
// feed
// ,
// main
// ,
// none
// ,
// presentation
// ,
// region
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-article-element
// Browser compatibility
// See also
// Other section-related elements:
// <body>
// ,
// <nav>
// ,
// <section>
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
// <header>
// ,
// <footer>
// ,
// <address>
// Using HTML sections and outlines