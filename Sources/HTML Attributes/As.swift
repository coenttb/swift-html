//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/04/2025.
//

import Foundation

/// The type of resource being loaded by the link.
///
/// This attribute is required when `rel="preload"` has been set on the link element,
/// optional when `rel="modulepreload"` has been set, and otherwise should not be used.
///
/// It specifies the type of content being loaded, which is necessary for request matching,
/// application of correct content security policy, and setting of correct Accept request header.
public enum As: String, Sendable, Equatable {
    /// For `<audio>` elements
    case audio
    /// For `<iframe>` and `<frame>` elements
    case document
    /// For `<embed>` elements
    case embed
    /// For fetch, XHR requests
    case fetch
    /// For CSS @font-face
    case font
    /// For images and SVGs
    case image
    /// For `<object>` elements
    case object
    /// For `<script>` elements, Worker importScripts
    case script
    /// For stylesheets
    case style
    /// For `<track>` elements
    case track
    /// For Worker, SharedWorker
    case worker
}



