///
/// <audio> Embed Audio.swift
/// swift-html
///
/// Represents the HTML audio element for embedding sound content.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML audio element (`<audio>`), which is used to embed sound content in documents.
///
/// The `Audio` struct provides a type-safe way to create HTML audio elements that can play
/// various audio formats. It supports multiple sources, controls, autoplay, and other audio
/// playback features. The content within the audio element serves as fallback for browsers
/// that don't support HTML audio.
///
/// ## Examples
///
/// ```swift
/// // Basic audio with controls
/// audio(
///     src: "audio-file.mp3",
///     controls: true
/// ) {
///     "Your browser does not support the audio element."
/// }
///
/// // Audio with multiple sources for better browser compatibility
/// audio(
///     controls: true,
///     loop: true
/// ) {
///     source(src: "audio-file.mp3", type: "audio/mpeg")
///     source(src: "audio-file.ogg", type: "audio/ogg")
///     paragraph {
///         "Download "
///         anchor(href: "audio-file.mp3", download: true) { "MP3" }
///         " or "
///         anchor(href: "audio-file.ogg", download: true) { "OGG" }
///         " audio file."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Provide multiple audio formats for better browser compatibility
/// - Include fallback content for browsers that don't support audio
/// - Use the controls attribute to allow users to control playback
/// - Avoid autoplay for better user experience
/// - Provide transcripts for accessibility
/// - Consider preload settings for performance optimization
///
/// - Note: When rendered, this generates an HTML `<audio>` element with the appropriate
///   attributes and content based on the configuration.
public struct Audio<HTML>: Element {
    public static var tag: String { "audio" }
    
    /// The URL of the audio file to embed.
    ///w
    /// This attribute is subject to HTTP access controls. You can either use this
    /// attribute or provide `<source>` elements as children of the audio element.
    public var src: Src?
    
    /// Indicates whether the browser should show playback controls.
    ///
    /// When present, the browser will offer controls to allow the user to control
    /// audio playback, including volume, seeking, and pause/resume playback.
    public var controls: Controls?
    
    /// Indicates whether the audio should automatically begin playback.
    ///
    /// When present, the audio will automatically begin playback as soon as it can,
    /// without waiting for the entire audio file to finish downloading.
    ///
    /// - Note: Use autoplay with caution as it can create an unpleasant user experience.
    /// Many browsers now block autoplay by default unless the audio is muted.
    public var autoplay: Autoplay?
    
    /// Indicates whether the audio will loop.
    ///
    /// When present, the audio player will automatically seek back to the start
    /// upon reaching the end of the audio.
    public var loop: Loop?
    
    /// Indicates whether the audio should be initially muted.
    ///
    /// When present, the audio will be initially silenced. Its default value is false.
    public var muted: Muted?
    
    /// Provides a hint to the browser about preloading strategy.
    ///
    /// This attribute tells the browser what the author thinks will lead to the best
    /// user experience regarding resource preloading.
    public var preload: Preload?
    
    /// Indicates whether to use CORS to fetch the related audio file.
    ///
    /// This is particularly important if you intend to use the audio in a canvas element.
    public var crossorigin: Crossorigin?
    
    /// Specifies which controls to show in the audio player.
    ///
    /// Only relevant when the controls attribute is present. Helps the browser select
    /// what controls to show for the audio element.
    public var controlslist: ControlsList?
    
    /// Disables remote playback of the audio stream.
    ///
    /// When present, disables the capability of remote playback in devices that are
    /// attached using wired or wireless technologies.
    public var disableremoteplayback: DisableRemotePlayback?
    
    /// The content of the audio element, which can include source elements for
    /// different formats and fallback content for browsers that don't support audio.
    ///
    /// If the browser doesn't support the audio element, this content will be displayed instead.
    public var content: () -> HTML
    
    /// Creates a new Audio element with the specified attributes and content.
    ///
    /// - Parameters:
    ///   - src: URL of the audio file to embed
    ///   - controls: Whether to show playback controls
    ///   - autoplay: Whether the audio should automatically begin playback
    ///   - loop: Whether the audio should loop
    ///   - muted: Whether the audio should be initially muted
    ///   - preload: Hint about preloading strategy
    ///   - crossorigin: CORS settings for the audio resource
    ///   - controlslist: Which controls to show in the audio player
    ///   - disableremoteplayback: Whether to disable remote playback
    ///   - content: Fallback content or sources for different formats
    public init(
        src: Src? = nil,
        controls: Controls? = nil,
        autoplay: Autoplay? = nil,
        loop: Loop? = nil,
        muted: Muted? = nil,
        preload: Preload? = nil,
        crossorigin: Crossorigin? = nil,
        controlslist: ControlsList? = nil,
        disableremoteplayback: DisableRemotePlayback? = nil,
        content: @escaping () -> HTML
    ) {
        self.src = src
        self.controls = controls
        self.autoplay = autoplay
        self.loop = loop
        self.muted = muted
        self.preload = preload
        self.crossorigin = crossorigin
        self.controlslist = controlslist
        self.disableremoteplayback = disableremoteplayback
        self.content = content
    }
}

// MARK: - Audio-specific Types

extension Audio {
    /// Preload options for the audio element.
    ///
    /// These values provide hints to the browser about what the author thinks will
    /// lead to the best user experience regarding resource preloading.
    public enum Preload: String {
        /// Indicates that the audio should not be preloaded.
        case none
        
        /// Indicates that only audio metadata (e.g., length) is fetched.
        case metadata
        
        /// Indicates that the whole audio file can be downloaded, even if the user
        /// is not expected to use it.
        case auto
    }
    
    /// Controlslist options for the audio element.
    ///
    /// These values help the browser select what controls to show for the audio element
    /// when the controls attribute is specified.
    public struct ControlsList {
        /// Hides the download button.
        public var nodownload: Bool
        
        /// Hides the fullscreen button.
        public var nofullscreen: Bool
        
        /// Disables the capability to perform remote playback of the audio.
        public var noremoteplayback: Bool
        
        /// Creates a controlslist with the specified options.
        ///
        /// - Parameters:
        ///   - nodownload: Whether to hide the download button
        ///   - nofullscreen: Whether to hide the fullscreen button
        ///   - noremoteplayback: Whether to disable remote playback
        public init(
            nodownload: Bool = false,
            nofullscreen: Bool = false,
            noremoteplayback: Bool = false
        ) {
            self.nodownload = nodownload
            self.nofullscreen = nofullscreen
            self.noremoteplayback = noremoteplayback
        }
        
        /// Returns the string representation of the controlslist.
        public var description: String {
            var values: [String] = []
            
            if nodownload { values.append("nodownload") }
            if nofullscreen { values.append("nofullscreen") }
            if noremoteplayback { values.append("noremoteplayback") }
            
            return values.joined(separator: " ")
        }
    }
}

/// Lowercase typealias for creating Audio elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `audio` identifier when creating
/// HTML audio elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// audio(controls: true) {
///     source(src: "audio.mp3", type: "audio/mpeg")
///     "Your browser does not support the audio element."
/// }
/// ```
public typealias audio = Audio
