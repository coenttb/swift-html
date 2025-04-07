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
