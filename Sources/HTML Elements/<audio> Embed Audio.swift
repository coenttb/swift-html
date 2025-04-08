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




/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/audio
 */
// <audio>: The Embed Audio element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <audio>
// HTML
// element is used to embed sound content in documents. It may contain one or more audio sources, represented using the
// src
// attribute or the
// <source>
// element: the browser will choose the most suitable one. It can also be the destination for streamed media, using a
// MediaStream
// .
// Try it
// <figure>
//  <figcaption>Listen to the T-Rex:</figcaption>
//  <audio controls src="/shared-assets/audio/t-rex-roar.mp3"></audio>
//  <a href="/shared-assets/audio/t-rex-roar.mp3"> Download audio </a>
// </figure>
// figure {
//  margin: 0;
// }
// The above example shows basic usage of the
// <audio>
// element. In a similar manner to the
// <img>
// element, we include a path to the media we want to embed inside the
// src
// attribute; we can include other attributes to specify information such as whether we want it to autoplay and loop, whether we want to show the browser's default audio controls, etc.
// The content inside the opening and closing
// <audio></audio>
// tags is shown as a fallback in browsers that don't support the element.
// Attributes
// This element's attributes include the
// global attributes
// .
// autoplay
// A Boolean attribute: if specified, the audio will automatically begin playback as soon as it can do so, without waiting for the entire audio file to finish downloading.
// Note:
// Sites that automatically play audio (or videos with an audio track) can be an unpleasant experience for users, so should be avoided when possible. If you must offer autoplay functionality, you should make it opt-in (requiring a user to specifically enable it). However, this can be useful when creating media elements whose source will be set at a later time, under user control. See our
// autoplay guide
// for additional information about how to properly use autoplay.
// controls
// If this attribute is present, the browser will offer controls to allow the user to control audio playback, including volume, seeking, and pause/resume playback.
// controlslist
// The
// controlslist
// attribute, when specified, helps the browser select what controls to show for the
// audio
// element whenever the browser shows its own set of controls (that is, when the
// controls
// attribute is specified).
// The allowed values are
// nodownload
// ,
// nofullscreen
// and
// noremoteplayback
// .
// crossorigin
// This
// enumerated
// attribute indicates whether to use CORS to fetch the related audio file.
// CORS-enabled resources
// can be reused in the
// <canvas>
// element without being
// tainted
// . The allowed values are:
// anonymous
// Sends a cross-origin request without a credential. In other words, it sends the
// Origin:
// HTTP header without a cookie, X.509 certificate, or performing HTTP Basic authentication. If the server does not give credentials to the origin site (by not setting the
// Access-Control-Allow-Origin:
// HTTP header), the resource will be
// tainted
// , and its usage restricted.
// use-credentials
// Sends a cross-origin request with a credential. In other words, it sends the
// Origin:
// HTTP header with a cookie, a certificate, or performing HTTP Basic authentication. If the server does not give credentials to the origin site (through
// Access-Control-Allow-Credentials:
// HTTP header), the resource will be
// tainted
// and its usage restricted.
// When not present, the resource is fetched without a CORS request (i.e., without sending the
// Origin:
// HTTP header), preventing its non-tainted use in
// <canvas>
// elements. If invalid, it is handled as if the enumerated keyword
// anonymous
// was used. See
// CORS settings attributes
// for additional information.
// disableremoteplayback
// A Boolean attribute used to disable the capability of remote playback in devices that are attached using wired (HDMI, DVI, etc.) and wireless technologies (Miracast, Chromecast, DLNA, AirPlay, etc.). See
// this proposed specification
// for more information.
// In Safari, you can use
// x-webkit-airplay="deny"
// as a fallback.
// loop
// A Boolean attribute: if specified, the audio player will automatically seek back to the start upon reaching the end of the audio.
// muted
// A Boolean attribute that indicates whether the audio will be initially silenced. Its default value is
// false
// .
// preload
// This
// enumerated
// attribute is intended to provide a hint to the browser about what the author thinks will lead to the best user experience. It may have one of the following values:
// none
// : Indicates that the audio should not be preloaded.
// metadata
// : Indicates that only audio metadata (e.g., length) is fetched.
// auto
// : Indicates that the whole audio file can be downloaded, even if the user is not expected to use it.
// empty string
// : A synonym of the
// auto
// value.
// The default value is different for each browser. The spec advises it to be set to
// metadata
// .
// Note:
// The
// autoplay
// attribute has precedence over
// preload
// . If
// autoplay
// is specified, the browser would obviously need to start downloading the audio for playback.
// The browser is not forced by the specification to follow the value of this attribute; it is a mere hint.
// src
// The URL of the audio to embed. This is subject to
// HTTP access controls
// . This is optional; you may instead use the
// <source>
// element within the audio block to specify the audio to embed.
// Events
// Event name
// Fired when
// audioprocess
// The input buffer of a
// ScriptProcessorNode
// is
//  ready to be processed.
// canplay
// The browser can play the media, but estimates that not enough data has
//  been loaded to play the media up to its end without having to stop for
//  further buffering of content.
// canplaythrough
// The browser estimates it can play the media up to its end without
//  stopping for content buffering.
// complete
// The rendering of an
// OfflineAudioContext
// is
//  terminated.
// durationchange
// The
// duration
// attribute has been updated.
// emptied
// The media has become empty; for example, this event is sent if the media
//  has already been loaded (or partially loaded), and the
// HTMLMediaElement.load
// method is called to
//  reload it.
// ended
// Playback has stopped because the end of the media was reached.
// loadeddata
// The first frame of the media has finished loading.
// loadedmetadata
// The metadata has been loaded.
// loadstart
// Fired when the browser has started to load the resource.
// pause
// Playback has been paused.
// play
// Playback has begun.
// playing
// Playback is ready to start after having been paused or delayed due to
//  lack of data.
// ratechange
// The playback rate has changed.
// seeked
// A
// seek
// operation completed.
// seeking
// A
// seek
// operation began.
// stalled
// The user agent is trying to fetch media data, but data is unexpectedly
//  not forthcoming.
// suspend
// Media data loading has been suspended.
// timeupdate
// The time indicated by the
// currentTime
// attribute has been
//  updated.
// volumechange
// The volume has changed.
// waiting
// Playback has stopped because of a temporary lack of data
// Usage notes
// Browsers don't all support the same
// file types
// and
// audio codecs
// ; you can provide multiple sources inside nested
// <source>
// elements, and the browser will then use the first one it understands:
// html
// <audio controls>
//  <source src="myAudio.mp3" type="audio/mpeg" />
//  <source src="myAudio.ogg" type="audio/ogg" />
//  <p>
//  Download <a href="myAudio.mp3" download="myAudio.mp3">MP3</a> or
//  <a href="myAudio.ogg" download="myAudio.ogg">OGG</a> audio.
//  </p>
// </audio>
// The audio source can be set to any valid
// URL
// , including HTTP(S) URLs and
// Data URLs
// . When using HTTP(S) URLs, be aware that the browser's caching behavior will affect how often the file is requested from the server. Data URLs embed the audio data directly in the HTML, which can be useful for small audio files but isn't recommended for larger files as it increases the HTML file size.
// When using
// <source>
// elements, the browser attempts to load each source sequentially. If a source fails (e.g., due to an invalid URL or unsupported format), the next source is attempted, and so on. An
// error
// event fires on the
// <audio>
// element after all sources have failed;
// error
// events are not fired on each individual
// <source>
// element.
// You can also use the
// Web Audio API
// to directly generate and manipulate audio streams from JavaScript code rather than streaming pre-existing audio files. You can set the
// srcObject
// in JavaScript to a
// MediaStream
// object. This is commonly used for live audio streams or real-time audio processing.
// js
// const audioElement = document.querySelector("audio");
// navigator.mediaDevices
//  .getUserMedia({ audio: true })
//  .then((stream) => {
//  audioElement.srcObject = stream;
//  })
//  .catch((error) => {
//  console.error("Error accessing the microphone", error);
//  });
// Note that
// MediaStream
// sources have limitations: they are not seekable and only support a limited set of codecs.
// We offer a substantive and thorough
// guide to media file types
// and the
// audio codecs that can be used within them
// . Also available is
// a guide to the codecs supported for video
// .
// Other usage notes:
// If you don't specify the
// controls
// attribute, the audio player won't include the browser's default controls. You can, however, create your own custom controls using JavaScript and the
// HTMLMediaElement
// API.
// To allow precise control over your audio content,
// HTMLMediaElement
// s fire many different
// events
// . This also provides a way to monitor the audio's fetching process so you can watch for errors or detect when enough is available to begin to play or manipulate it.
// <audio>
// elements can't have subtitles or captions associated with them in the same way that
// <video>
// elements can. See
// WebVTT and Audio
// by Ian Devlin for some useful information and workarounds.
// To test the fallback content on browsers that support the element, you can replace
// <audio>
// with a non-existing element like
// <notanaudio>
// .
// A good general source of information on using HTML
// <audio>
// is the
// HTML video and audio
// beginner's tutorial.
// Styling with CSS
// The
// <audio>
// element has no intrinsic visual output of its own unless the
// controls
// attribute is specified, in which case the browser's default controls are shown.
// The default controls have a
// display
// value of
// inline
// by default, and it is often a good idea to set the value to
// block
// to improve control over positioning and layout, unless you want it to sit within a text block or similar.
// You can style the default controls with properties that affect the block as a single unit, so for example you can give it a
// border
// and
// border-radius
// ,
// padding
// ,
// margin
// , etc. You can't however style the individual components inside the audio player (e.g., change the button size or icons, change the font, etc.), and the controls are different across the different browsers.
// To get a consistent look and feel across browsers, you'll need to create custom controls; these can be marked up and styled in whatever way you want, and then JavaScript can be used along with the
// HTMLMediaElement
// API to wire up their functionality.
// Video player styling basics
// provides some useful styling techniques â it is written in the context of
// <video>
// , but much of it is equally applicable to
// <audio>
// .
// Detecting addition and removal of tracks
// You can detect when tracks are added to and removed from an
// <audio>
// element using the
// addtrack
// and
// removetrack
// events. However, these events aren't sent directly to the
// <audio>
// element itself. Instead, they're sent to the track list object within the
// <audio>
// element's
// HTMLMediaElement
// that corresponds to the type of track that was added to the element:
// HTMLMediaElement.audioTracks
// An
// AudioTrackList
// containing all of the media element's audio tracks. You can add a listener for
// addtrack
// to this object to be alerted when new audio tracks are added to the element.
// HTMLMediaElement.videoTracks
// Add an
// addtrack
// listener to this
// VideoTrackList
// object to be informed when video tracks are added to the element.
// HTMLMediaElement.textTracks
// Add an
// addtrack
// event listener to this
// TextTrackList
// to be notified when new text tracks are added to the element.
// Note:
// Even though it's an
// <audio>
// element, it still has video and text track lists, and can in fact be used to present video, although the user interface implications can be odd.
// For example, to detect when audio tracks are added to or removed from an
// <audio>
// element, you can use code like this:
// js
// const elem = document.querySelector("audio");
// elem.audioTrackList.onaddtrack = (event) => {
//  trackEditor.addTrack(event.track);
// };
// elem.audioTrackList.onremovetrack = (event) => {
//  trackEditor.removeTrack(event.track);
// };
// This code watches for audio tracks to be added to and removed from the element, and calls a hypothetical function on a track editor to register and remove the track from the editor's list of available tracks.
// You can also use
// addEventListener()
// to listen for the
// addtrack
// and
// removetrack
// events.
// Accessibility
// Audio with spoken dialog should provide both captions and transcripts that accurately describe its content. Captions, which are specified using
// WebVTT
// , allow people who are hearing impaired to understand an audio recording's content as the recording is being played, while transcripts allow people who need additional time to be able to review the recording's content at a pace and format that is comfortable for them.
// If automatic captioning services are used, it is important to review the generated content to ensure it accurately represents the source audio.
// The
// <audio>
// element doesn't directly support WebVTT. You will have to find a library or framework that provides the capability for you, or write the code to display captions yourself. One option is to play your audio using a
// <video>
// element, which does support WebVTT.
// In addition to spoken dialog, subtitles and transcripts should also identify music and sound effects that communicate important information. This includes emotion and tone. For example, in the WebVTT below, note the use of square brackets to provide tone and emotional insight to the viewer; this can help establish the mood otherwise provided using music, nonverbal sounds and crucial sound effects, and so forth.
// 1
// 00:00:00 --> 00:00:45
// [Energetic techno music]
// 2
// 00:00:46 --> 00:00:51
// Welcome to the Time Keeper's podcast! In this episode we're discussing which Swisswatch is a wrist switchwatch?
// 16
// 00:00:52 --> 00:01:02
// [Laughing] Sorry! I mean, which wristwatch is a Swiss wristwatch?
// Also it's a good practice to provide some content (such as the direct download link) as a fallback for viewers who use a browser in which the
// <audio>
// element is not supported:
// html
// <audio controls>
//  <source src="myAudio.mp3" type="audio/mpeg" />
//  <source src="myAudio.ogg" type="audio/ogg" />
//  <p>
//  Download <a href="myAudio.mp3">MP3</a> or
//  <a href="myAudio.ogg" download="myAudio.ogg">OGG</a> audio.
//  </p>
// </audio>
// Web Video Text Tracks Format (WebVTT)
// WebAIM: Captions, Transcripts, and Audio Descriptions
// MDN Understanding WCAG, Guideline 1.2 explanations
// Understanding Success Criterion 1.2.1 | W3C Understanding WCAG 2.0
// Understanding Success Criterion 1.2.2 | W3C Understanding WCAG 2.0
// Examples
// Basic usage
// The following example shows basic usage of the
// <audio>
// element to play an OGG file. It will autoplay due to the
// autoplay
// attributeâif the page has permission to do soâand also includes fallback content.
// html
// <!-- Basic audio playback -->
// <audio src="AudioTest.ogg" autoplay>
//  <a href="AudioTest.ogg" download="AudioTest.ogg">Download OGG audio</a>.
// </audio>
// For details on when autoplay works, how to get permission to use autoplay, and how and when it's appropriate to use autoplay, see our
// autoplay guide
// .
// <audio> element with <source> element
// This example specifies which audio track to embed using the
// src
// attribute on a nested
// <source>
// element rather than directly on the
// <audio>
// element. It is always useful to include the file's MIME type inside the
// type
// attribute, as the browser is able to instantly tell if it can play that file, and not waste time on it if not.
// html
// <audio controls>
//  <source src="foo.wav" type="audio/wav" />
//  <a href="foo.wav" download="foo.wav">Download WAV audio</a>.
// </audio>
// <audio> with multiple <source> elements
// This example includes multiple
// <source>
// elements. The browser tries to load the first source element (Opus) if it is able to play it; if not it falls back to the second (Vorbis) and finally back to MP3:
// html
// <audio controls>
//  <source src="foo.opus" type="audio/ogg; codecs=opus" />
//  <source src="foo.ogg" type="audio/ogg; codecs=vorbis" />
//  <source src="foo.mp3" type="audio/mpeg" />
// </audio>
// Technical summary
// Content categories
// Flow content
// , phrasing content, embedded content. If it has a
// controls
// attribute: interactive
//  content and palpable content.
// Permitted content
// If the element has a
// src
// attribute: zero or more
// <track>
// elements
//  followed by transparent content that contains no
// <audio>
// or
// <video>
// media elements.
// Else: zero or more
// <source>
// elements followed by zero or more
// <track>
// elements followed by transparent content that contains no
// <audio>
// or
// <video>
// media elements.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts embedded content.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// application
// DOM interface
// HTMLAudioElement
// Specifications
// Specification
// HTML
// #
// the-audio-element
// Browser compatibility
// See also
// Web media technologies
// Media container formats (file types)
// Guide to audio codecs used on the web
// Web Audio API
// HTMLAudioElement
// <source>
// <video>
// Learning area: HTML video and audio
// Cross-browser audio basics