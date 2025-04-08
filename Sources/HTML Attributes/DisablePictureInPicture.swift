//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

/// Represents the disablepictureinpicture attribute for the video element.
public struct DisablePictureInPicture: BooleanAttribute {
    /// The name of the HTML attribute
    public static let attribute: String = "disablepictureinpicture"
    
    public var value: Bool
  
    public init(value: Bool) {
        self.value = value
    }
}
