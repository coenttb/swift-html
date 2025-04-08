//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

/// Represents the controlslist attribute for the video element.
public struct ControlsList: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "controlslist"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Hides the download control
    public static let nodownload: Self = "nodownload"
    
    /// Hides the fullscreen control
    public static let nofullscreen: Self = "nofullscreen"
    
    /// Hides the remote playback control
    public static let noremoteplayback: Self = "noremoteplayback"
    
    /// Combines multiple controlslist values
    public static func combine(_ values: [ControlsList]) -> Self {
        return Self(values.map(\.value).joined(separator: " "))
    }
}

extension ControlsList: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension ControlsList: CustomStringConvertible {
    public var description: String {
        return self.value
    }
}
