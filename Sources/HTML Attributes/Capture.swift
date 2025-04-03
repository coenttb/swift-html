///
/// Capture.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that specifies which camera or device should be used for capturing media.
///
/// The `capture` attribute is used with `<input type="file">` elements to indicate which
/// camera or recording device should be used when capturing photos, videos, or audio files.
/// This attribute is typically used in conjunction with the `accept` attribute to specify
/// the type of media to capture.
///
/// ## Usage Notes
///
/// - Only valid on `<input>` elements with `type="file"`
/// - Works best on mobile devices with cameras and microphones
/// - Should be used together with `accept="image/*"`, `accept="video/*"`, or `accept="audio/*"`
/// - On desktop computers, this may simply display a standard file picker
///
/// ## Values
///
/// - `"user"`: Use the front-facing (user-facing) camera and/or microphone
/// - `"environment"`: Use the back-facing (outward-facing) camera and/or microphone
///
/// ## Examples
///
/// Capture a photo using the front-facing camera:
/// ```html
/// <input type="file" accept="image/*" capture="user">
/// ```
///
/// Capture a video using the back-facing camera:
/// ```html
/// <input type="file" accept="video/*" capture="environment">
/// ```
///
/// Capture audio:
/// ```html
/// <input type="file" accept="audio/*" capture="user">
/// ```
public struct Capture: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "capture"
    
    /// The capture device value
    private let value: String
    
    /// Initialize with a capture device value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Convenience initializer for "user" value (front-facing camera)
    public static var user: Capture {
        return Capture("user")
    }
    
    /// Convenience initializer for "environment" value (back-facing camera)
    public static var environment: Capture {
        return Capture("environment")
    }
}

extension Capture: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Capture: CustomStringConvertible {
    /// Returns the string representation of the capture value
    public var description: String {
        return self.value
    }
}

extension HTML {
    
    @discardableResult
    public func capture(
        _ value: Capture?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Capture.attribute, value?.description)
    }
}
