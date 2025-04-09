///
/// Fetchpriority.swift
/// swift-html
///
/// Represents the HTML fetchpriority attribute which provides a hint of the relative 
/// priority for fetching a resource.
///
/// Created by Claude on 04/06/2025.
///

import Foundation

/// Represents the HTML `fetchpriority` attribute, which provides a hint of the relative
/// priority to use when fetching a resource of a particular type.
///
/// The `fetchpriority` attribute allows developers to signal how the browser should
/// prioritize fetching a particular resource relative to other resources of the same type.
/// This helps browsers assign appropriate loading priorities to critical resources.
///
/// ## Example
///
/// ```html
/// <!-- HTML Example -->
/// <img src="hero.jpg" fetchpriority="high">
/// <img src="decoration.jpg" fetchpriority="low">
/// <link rel="preload" href="critical.css" as="style" fetchpriority="high">
/// ```
///
/// ## Usage Notes
///
/// - This attribute should be used sparingly; excessive or incorrect prioritization can degrade performance
/// - Both the internal priority of any fetch operation and the impact of `fetchpriority` are browser-dependent
/// - Can be particularly useful for preloaded resources and critical render path assets
/// - Common use cases include prioritizing LCP (Largest Contentful Paint) images and critical CSS
///
/// ## Valid Elements
///
/// - `<img>`: For prioritizing image loading
/// - `<link>`: For prioritizing preloaded resources
/// - `<script>`: For prioritizing script loading
/// - `<iframe>`: For prioritizing iframe content loading
public enum Fetchpriority: String, Sendable, Equatable, Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "fetchpriority"
    
    /// Fetch the resource at a high priority relative to other resources of the same type.
    ///
    /// Use for critical resources that significantly impact user experience, such as:
    /// - LCP (Largest Contentful Paint) images
    /// - Critical CSS required for initial render
    /// - Important scripts needed early in the page lifecycle
    case high
    
    /// Fetch the resource at a low priority relative to other resources of the same type.
    ///
    /// Use for non-critical resources that don't significantly impact initial user experience, such as:
    /// - Below-the-fold images
    /// - Non-critical scripts
    /// - Analytics and tracking code
    case low
    
    /// Don't set a preference for the fetch priority (default).
    ///
    /// This is used if no value is explicitly set or if an invalid value is set.
    /// The browser will use its default prioritization heuristics.
    case auto
    
    /// Returns the string representation of the fetchpriority value
    public var description: String {
        return self.rawValue
    }
}

extension Fetchpriority: CustomStringConvertible {}
