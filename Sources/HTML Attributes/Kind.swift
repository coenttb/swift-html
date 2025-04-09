//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

/// Represents the kind attribute values for the track element.
public enum Kind: String, Attribute  {
    /// The name of the HTML attribute
    public static let attribute: String = "kind"
    /// Subtitles provide translation of content that cannot be understood by the viewer
    case subtitles
    
    /// Closed captions provide a transcription and possibly a translation of audio
    case captions
    
    /// Chapter titles are intended to be used when the user is navigating the media resource
    case chapters
    
    /// Tracks used by scripts, not visible to the user
    case metadata
}

extension Kind: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.rawValue
    }
}
