///
/// <video> Video Embed.swift
/// swift-html
///
/// Represents the HTML video element for embedding videos in a document.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML video element (`<video>`), which embeds a media player that supports video playback into a document.
///
/// The `Video` struct provides a type-safe way to create HTML video elements with various attributes for controlling playback, appearance, and behavior.
///
/// ## Example
///
/// ```swift
/// video {
///     source(src: "video.mp4", type: "video/mp4")
///     source(src: "video.webm", type: "video/webm")
///     "Your browser doesn't support HTML video."
/// }
/// ```
///
/// With additional attributes:
///
/// ```swift
/// video(
///     controls: true,
///     autoplay: true,
///     muted: true,
///     poster: "thumbnail.jpg",
///     width: 640,
///     height: 360
/// ) {
///     source(src: "video.mp4", type: "video/mp4")
/// }
/// ```
///
/// ## Best Practices
///
/// - Always provide multiple source formats for better browser compatibility
/// - Include fallback content for browsers that don't support video
/// - Consider providing captions and transcripts for accessibility
/// - Set width and height attributes to avoid layout shifts during loading
/// - Use the `poster` attribute to provide a preview image
/// - Consider setting `preload="metadata"` for better performance on mobile devices
/// - For autoplay videos, use the `muted` attribute to improve autoplay compatibility
///
/// ## Accessibility Considerations
///
/// - Videos should include captions for people with hearing impairments
/// - Consider providing a transcript for better accessibility
/// - Make sure video controls are accessible via keyboard
/// - Videos with important visual information should include audio descriptions
///
public struct Video: Element {
    /// The HTML tag name for the video element
    public static var tag: String { "video" }
    
    /// The URL of the video to embed
    public var src: HTML_Attributes.Src?
    
    /// Whether to display playback controls
    public var controls: HTML_Attributes.Controls?
    
    /// Whether to automatically begin playback
    public var autoplay: HTML_Attributes.Autoplay?
    
    /// URL for an image to be shown while the video is downloading
    public var poster: HTML_Attributes.Poster?
    
    /// Whether to automatically seek back to the start after reaching the end
    public var loop: HTML_Attributes.Loop?
    
    /// Whether to initially silence the audio
    public var muted: HTML_Attributes.Muted?
    
    /// The width of the video's display area in CSS pixels
    public var width: HTML_Attributes.Width?
    
    /// The height of the video's display area in CSS pixels
    public var height: HTML_Attributes.Height?
    
    /// Provides a hint about what content to preload
    public var preload: HTML_Attributes.Preload?
    
    /// Whether to play the video inline rather than fullscreen (especially important for iOS)
    public var playsinline: HTML_Attributes.Playsinline?
    
    /// How to handle cross-origin requests
    public var crossorigin: HTML_Attributes.Crossorigin?
    
    /// Helps the browser select what controls to show when controls are enabled
    public var controlslist: HTML_Attributes.ControlsList?
    
    /// Prevents the browser from suggesting Picture-in-Picture
    public var disablepictureinpicture: HTML_Attributes.DisablePictureInPicture?
    
    /// Disables remote playback capabilities
    public var disableremoteplayback: HTML_Attributes.DisableRemotePlayback?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Video element with the specified attributes.
    ///
    /// - Parameters:
    ///   - src: The URL of the video to embed
    ///   - controls: Whether to display playback controls
    ///   - autoplay: Whether to automatically begin playback
    ///   - poster: URL for an image to be shown while the video is downloading
    ///   - loop: Whether to automatically seek back to the start after reaching the end
    ///   - muted: Whether to initially silence the audio
    ///   - width: The width of the video's display area in CSS pixels
    ///   - height: The height of the video's display area in CSS pixels
    ///   - preload: Provides a hint about what content to preload
    ///   - playsinline: Whether to play the video inline rather than fullscreen
    ///   - crossorigin: How to handle cross-origin requests
    ///   - controlslist: Helps the browser select what controls to show when controls are enabled
    ///   - disablepictureinpicture: Prevents the browser from suggesting Picture-in-Picture
    ///   - disableremoteplayback: Disables remote playback capabilities
    ///   - content: The content of the element, typically source elements or fallback content
    public init(
        src: HTML_Attributes.Src? = nil,
        controls: HTML_Attributes.Controls? = nil,
        autoplay: HTML_Attributes.Autoplay? = nil,
        poster: HTML_Attributes.AttributionSrc? = nil,
        loop: HTML_Attributes.Loop? = nil,
        muted: HTML_Attributes.Muted? = nil,
        width: HTML_Attributes.Width? = nil,
        height: HTML_Attributes.Height? = nil,
        preload: HTML_Attributes.Preload? = nil,
        playsinline: HTML_Attributes.Playsinline? = nil,
        crossorigin: HTML_Attributes.Crossorigin? = nil,
        controlslist: HTML_Attributes.ControlsList? = nil,
        disablepictureinpicture: HTML_Attributes.DisablePictureInPicture? = nil,
        disableremoteplayback: HTML_Attributes.DisableRemotePlayback? = nil,
        
    ) {
        self.src = src
        self.controls = controls
        self.autoplay = autoplay
        self.poster = poster
        self.loop = loop
        self.muted = muted
        self.width = width
        self.height = height
        self.preload = preload
        self.playsinline = playsinline
        self.crossorigin = crossorigin
        self.controlslist = controlslist
        self.disablepictureinpicture = disablepictureinpicture
        self.disableremoteplayback = disableremoteplayback
        
    }
}

/// Lowercase typealias for creating Video elements with a more HTML-like syntax.
public typealias video = Video
