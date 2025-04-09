//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

/// Specifies the mode for a shadow root created using declarative shadow DOM.
///
/// The `ShadowRootMode` attribute is used with the `<template>` element to create
/// a declarative shadow DOM when set to either "open" or "closed".
///
/// ## Values
///
/// - `.open`: Exposes the internal shadow root DOM for JavaScript access (recommended for most use cases)
/// - `.closed`: Hides the internal shadow root DOM from JavaScript access
///
public struct ShadowRootMode: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "shadowrootmode"
    
    /// The shadow root mode value
    private let value: String
    
    /// Initialize with a shadow root mode value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Exposes the internal shadow root DOM for JavaScript access
    public static let open = ShadowRootMode("open")
    
    /// Hides the internal shadow root DOM from JavaScript access
    public static let closed = ShadowRootMode("closed")
}
extension HTML_Attributes.ShadowRootMode: CustomStringConvertible {
    /// Returns the string representation of the shadow root mode value
    public var description: String {
        return self.value
    }
}
