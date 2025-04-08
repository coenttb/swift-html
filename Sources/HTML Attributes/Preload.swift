//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

/// Represents the preload attribute values for the video element.
public struct Preload: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "preload"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
    
    /// No preloading should occur
    public static let none: Self = "none"
    
    /// Only video metadata (e.g., dimensions, duration) should be loaded
    public static let metadata: Self = "metadata"
    
    /// The entire video can be downloaded
    public static let auto: Self = "auto"
}

extension Preload: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Preload: CustomStringConvertible {
    public var description: String {
        return self.value
    }
}
