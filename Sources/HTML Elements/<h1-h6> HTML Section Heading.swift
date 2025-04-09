///
/// <h1-h6> HTML Section Heading.swift
/// swift-html
///
/// Represents the HTML section heading elements.
///
/// Created by Claude on 04/06/2025.
///

import Foundation

/// <h1>–<h6>: The HTML Section Heading elements
///
/// The <h1> to <h6> HTML elements represent six levels of section headings.
/// <h1> is the highest section level and <h6> is the lowest.
/// By default, all heading elements create a block-level box in the layout,
/// starting on a new line and taking up the full width available in their containing block.
///
/// These elements only include the global attributes.

// MARK: - H1 Element
public struct H1: Element {
    public static var tag: String { "h1" }
    
    public init(){}
}

public typealias h1 = H1

// MARK: - H2 Element
public struct H2: Element {
    public static var tag: String { "h2" }
    
    public init(){}
}

public typealias h2 = H2

// MARK: - H3 Element
public struct H3: Element {
    public static var tag: String { "h3" }
    
    public init(){}
}

public typealias h3 = H3

// MARK: - H4 Element
public struct H4: Element {
    public static var tag: String { "h4" }
    
    public init(){}
}

public typealias h4 = H4

// MARK: - H5 Element
public struct H5: Element {
    public static var tag: String { "h5" }
    
    public init(){}
}

public typealias h5 = H5

// MARK: - H6 Element
public struct H6: Element {
    public static var tag: String { "h6" }
    
    public init(){}
}

public typealias h6 = H6
