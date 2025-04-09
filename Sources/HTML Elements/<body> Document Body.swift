///
/// <body> Document Body.swift
/// swift-html
///
/// Represents the HTML body element containing all the content of a document.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML body element (`<body>`), which contains all the content
/// that appears on a webpage.
///
/// The `Body` struct provides a type-safe way to create the HTML body element,
/// which is a required part of every HTML document. There can be only one body
/// element in a document, and it must be a child of the html element.
///
/// ## Example
///
/// ```swift
/// html {
///   head {
///     title { "Document Title" }
///   }
///   body {
///     header {
///       heading1 { "Welcome to My Website" }
///     }
///     main {
///       paragraph { "This is the main content of the page." }
///     }
///     footer {
///       paragraph { "© 2025 My Website" }
///     }
///   }
/// }
/// ```
///
/// ## Event Handlers
///
/// While the body element supports event handler attributes in HTML,
/// it's generally recommended to use JavaScript event listeners instead.
///
/// ## Best Practices
///
/// - There must be only one body element per document
/// - The body must be a child of the html element
/// - All visible content of the page should be inside the body
/// - Use CSS for styling instead of deprecated attributes like bgcolor
/// - Use JavaScript event listeners instead of HTML event handler attributes
///
/// - Note: When rendered, this generates the HTML `<body>` element that contains
///   all the visible content of the webpage.
public struct Body: Element {
    public static var tag: String { "body" }
    
    /// Function to call after the user has printed the document.
    @available(*, deprecated, message: "Use JavaScript addEventListener('afterprint') instead")
    public var onAfterPrint: String?
    
    /// Function to call when the user requests printing of the document.
    @available(*, deprecated, message: "Use JavaScript addEventListener('beforeprint') instead")
    public var onBeforePrint: String?
    
    /// Function to call when the document is about to be unloaded.
    @available(*, deprecated, message: "Use JavaScript addEventListener('beforeunload') instead")
    public var onBeforeUnload: String?
    
    /// Function to call when the document loses focus.
    @available(*, deprecated, message: "Use JavaScript addEventListener('blur') instead")
    public var onBlur: String?
    
    /// Function to call when the document fails to load properly.
    @available(*, deprecated, message: "Use JavaScript addEventListener('error') instead")
    public var onError: String?
    
    /// Function to call when the document receives focus.
    @available(*, deprecated, message: "Use JavaScript addEventListener('focus') instead")
    public var onFocus: String?
    
    /// Function to call when the fragment identifier part of the document's current address has changed.
    @available(*, deprecated, message: "Use JavaScript addEventListener('hashchange') instead")
    public var onHashChange: String?
    
    /// Function to call when the preferred languages changed.
    @available(*, deprecated, message: "Use JavaScript addEventListener('languagechange') instead")
    public var onLanguageChange: String?
    
    /// Function to call when the document has finished loading.
    @available(*, deprecated, message: "Use JavaScript addEventListener('load') instead")
    public var onLoad: String?
    
    /// Function to call when the document has received a message.
    @available(*, deprecated, message: "Use JavaScript addEventListener('message') instead")
    public var onMessage: String?
    
    /// Function to call when the document has received a message that cannot be deserialized.
    @available(*, deprecated, message: "Use JavaScript addEventListener('messageerror') instead")
    public var onMessageError: String?
    
    /// Function to call when network communication has failed.
    @available(*, deprecated, message: "Use JavaScript addEventListener('offline') instead")
    public var onOffline: String?
    
    /// Function to call when network communication has been restored.
    @available(*, deprecated, message: "Use JavaScript addEventListener('online') instead")
    public var onOnline: String?
    
    /// Function to call when navigating across documents, when the previous document is about to unload.
    @available(*, deprecated, message: "Use JavaScript addEventListener('pageswap') instead")
    public var onPageSwap: String?
    
    /// Function to call when the browser hides the current page in the process of presenting a different page from the session's history.
    @available(*, deprecated, message: "Use JavaScript addEventListener('pagehide') instead")
    public var onPageHide: String?
    
    /// Function to call when a document is first rendered, either when loading a fresh document from the network or activating a document.
    @available(*, deprecated, message: "Use JavaScript addEventListener('pagereveal') instead")
    public var onPageReveal: String?
    
    /// Function to call when the browser displays the window's document due to navigation.
    @available(*, deprecated, message: "Use JavaScript addEventListener('pageshow') instead")
    public var onPageShow: String?
    
    /// Function to call when the user has navigated session history.
    @available(*, deprecated, message: "Use JavaScript addEventListener('popstate') instead")
    public var onPopState: String?
    
    /// Function to call when the document has been resized.
    @available(*, deprecated, message: "Use JavaScript addEventListener('resize') instead")
    public var onResize: String?
    
    /// Function to call when a JavaScript Promise is handled late.
    @available(*, deprecated, message: "Use JavaScript addEventListener('rejectionhandled') instead")
    public var onRejectionHandled: String?
    
    /// Function to call when the storage area has changed.
    @available(*, deprecated, message: "Use JavaScript addEventListener('storage') instead")
    public var onStorage: String?
    
    /// Function to call when a JavaScript Promise that has no rejection handler is rejected.
    @available(*, deprecated, message: "Use JavaScript addEventListener('unhandledrejection') instead")
    public var onUnhandledRejection: String?
    
    /// Function to call when the document is going away.
    @available(*, deprecated, message: "Use JavaScript addEventListener('unload') instead")
    public var onUnload: String?
    
    /// Creates a new Body element with the specified content and event handlers.
    ///
    /// - Parameters:
    ///   - content: The content to be contained within the body element
    public init(
        
    ) {
        
    }
    
    /// Creates a new Body element with the specified content and event handlers.
    ///
    /// - Parameters:
    ///   - onAfterPrint: Function to call after printing the document
    ///   - onBeforePrint: Function to call when printing is requested
    ///   - onBeforeUnload: Function to call before document unload
    ///   - onBlur: Function to call when document loses focus
    ///   - onError: Function to call on document load error
    ///   - onFocus: Function to call when document receives focus
    ///   - onHashChange: Function to call when URL fragment changes
    ///   - onLanguageChange: Function to call when preferred languages change
    ///   - onLoad: Function to call when document has finished loading
    ///   - onMessage: Function to call when document receives a message
    ///   - onMessageError: Function to call on message error
    ///   - onOffline: Function to call when network connection is lost
    ///   - onOnline: Function to call when network connection is restored
    ///   - onPageSwap: Function to call during navigation between documents
    ///   - onPageHide: Function to call when page is hidden
    ///   - onPageReveal: Function to call when document is first rendered
    ///   - onPageShow: Function to call when page is shown
    ///   - onPopState: Function to call during history navigation
    ///   - onResize: Function to call when document is resized
    ///   - onRejectionHandled: Function to call when a Promise is handled late
    ///   - onStorage: Function to call when storage area changes
    ///   - onUnhandledRejection: Function to call on unhandled Promise rejection
    ///   - onUnload: Function to call when document is unloaded
    @available(*, deprecated, message: "Use JavaScript event listeners instead of HTML event handler attributes")
    public init(
        onAfterPrint: String? = nil,
        onBeforePrint: String? = nil,
        onBeforeUnload: String? = nil,
        onBlur: String? = nil,
        onError: String? = nil,
        onFocus: String? = nil,
        onHashChange: String? = nil,
        onLanguageChange: String? = nil,
        onLoad: String? = nil,
        onMessage: String? = nil,
        onMessageError: String? = nil,
        onOffline: String? = nil,
        onOnline: String? = nil,
        onPageSwap: String? = nil,
        onPageHide: String? = nil,
        onPageReveal: String? = nil,
        onPageShow: String? = nil,
        onPopState: String? = nil,
        onResize: String? = nil,
        onRejectionHandled: String? = nil,
        onStorage: String? = nil,
        onUnhandledRejection: String? = nil,
        onUnload: String? = nil
    ) {
        self.onAfterPrint = onAfterPrint
        self.onBeforePrint = onBeforePrint
        self.onBeforeUnload = onBeforeUnload
        self.onBlur = onBlur
        self.onError = onError
        self.onFocus = onFocus
        self.onHashChange = onHashChange
        self.onLanguageChange = onLanguageChange
        self.onLoad = onLoad
        self.onMessage = onMessage
        self.onMessageError = onMessageError
        self.onOffline = onOffline
        self.onOnline = onOnline
        self.onPageSwap = onPageSwap
        self.onPageHide = onPageHide
        self.onPageReveal = onPageReveal
        self.onPageShow = onPageShow
        self.onPopState = onPopState
        self.onResize = onResize
        self.onRejectionHandled = onRejectionHandled
        self.onStorage = onStorage
        self.onUnhandledRejection = onUnhandledRejection
        self.onUnload = onUnload
    }
}

/// Lowercase typealias for creating Body elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `body` identifier when creating
/// HTML body elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// body {
///   heading1 { "Welcome to My Website" }
///   paragraph { "This is the content of my webpage." }
/// }
/// ```
public typealias body = Body
