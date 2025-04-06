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
public struct H1 {
    public let attributes: [String: String]
    public let children: [Any]

    public init(_ children: [Any], _ attributes: [String: String] = [:]) {
        self.attributes = attributes
        self.children = children
    }
    
    public init(_ text: String, _ attributes: [String: String] = [:]) {
        self.init([text], attributes)
    }
}

// MARK: - H2 Element
public struct H2 {
    public let attributes: [String: String]
    public let children: [Any]

    public init(_ children: [Any], _ attributes: [String: String] = [:]) {
        self.attributes = attributes
        self.children = children
    }
    
    public init(_ text: String, _ attributes: [String: String] = [:]) {
        self.init([text], attributes)
    }
}

// MARK: - H3 Element
public struct H3 {
    public let attributes: [String: String]
    public let children: [Any]

    public init(_ children: [Any], _ attributes: [String: String] = [:]) {
        self.attributes = attributes
        self.children = children
    }
    
    public init(_ text: String, _ attributes: [String: String] = [:]) {
        self.init([text], attributes)
    }
}

// MARK: - H4 Element
public struct H4 {
    public let attributes: [String: String]
    public let children: [Any]

    public init(_ children: [Any], _ attributes: [String: String] = [:]) {
        self.attributes = attributes
        self.children = children
    }
    
    public init(_ text: String, _ attributes: [String: String] = [:]) {
        self.init([text], attributes)
    }
}

// MARK: - H5 Element
public struct H5 {
    public let attributes: [String: String]
    public let children: [Any]

    public init(_ children: [Any], _ attributes: [String: String] = [:]) {
        self.attributes = attributes
        self.children = children
    }
    
    public init(_ text: String, _ attributes: [String: String] = [:]) {
        self.init([text], attributes)
    }
}

// MARK: - H6 Element
public struct H6 {
    public let attributes: [String: String]
    public let children: [Any]

    public init(_ children: [Any], _ attributes: [String: String] = [:]) {
        self.attributes = attributes
        self.children = children
    }
    
    public init(_ text: String, _ attributes: [String: String] = [:]) {
        self.init([text], attributes)
    }
}