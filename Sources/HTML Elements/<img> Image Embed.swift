import Foundation
import HTML_Attributes

public struct Image: Element {
    public static var tag: String { "image" }
    
    public var src: Src?
    public var alt: Alt?
    public var loading: Image.Loading?
    
    public init(
        src: Src? = nil,
        alt: Alt? = nil,
        loading: Image.Loading? = nil
    ) {
        self.src = src
        self.alt = alt
        self.loading = loading
    }
}

extension Image {
    public init?(base64EncodedFromURL url: URL, description: String) {
        guard
            let imageData = try? Foundation.Data(contentsOf: url) else {
            return nil
        }
        
        let base64String = imageData.base64EncodedString()
        let mimeType = Image.mimeTypeForImage(relativeURL: url.relativeString)
        
        self.init(src: "data:\(mimeType);base64,\(base64String)", alt: .init(description))
    }
    
    private static func mimeTypeForImage(relativeURL: String) -> String {
        let pathExtension = (relativeURL as NSString).pathExtension.lowercased()
        switch pathExtension {
        case "jpg", "jpeg":
            return "image/jpeg"
        case "png":
            return "image/png"
        case "gif":
            return "image/gif"
        case "svg":
            return "image/svg+xml"
        default:
            return "application/octet-stream"
        }
    }
}

extension Image {
    public init?(baseURL: URL, base64EncodedFromURL relativeURL: String, description: String) {
        guard let fullURL = URL(string: relativeURL, relativeTo: baseURL) else {
            return nil
        }
        
        self.init(base64EncodedFromURL: fullURL, description: description)
    }
}


extension Image {
    /// Represents the CSS `loading` attribute that specifies how the browser should load an image.
    ///
    /// The `loading` attribute affects when and how resources like images and iframes
    /// are loaded relative to their visibility in the viewport. This can significantly
    /// impact page performance and data usage.
    ///
    /// ```
    ///    Loading behavior:
    ///
    ///    eager (default):            lazy:
    ///    +--------------+            +--------------+
    ///    | Image loads  |            | Placeholder  |
    ///    | immediately  |            | until near   |
    ///    | when page    |            | viewport     |
    ///    | is rendered  |            |              |
    ///    +--------------+            +--------------+
    ///                                      |
    ///                                      v
    ///                                +--------------+
    ///                                | Image loads  |
    ///                                | when user    |
    ///                                | scrolls near |
    ///                                | viewport     |
    ///                                +--------------+
    /// ```
    ///
    /// Example usage:
    /// ```swift
    /// let lazyLoading = Loading.lazy
    /// // HTML attribute: loading="lazy"
    ///
    /// let eagerLoading = Loading.eager
    /// // HTML attribute: loading="eager"
    /// ```
    ///
    /// - Note: This is primarily used as an HTML attribute rather than a CSS property,
    ///   but it's included in this library for completeness when working with HTML elements.
    ///
    /// - SeeAlso: [MDN Web Docs: loading attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-loading)
    public enum Loading: String, Attribute, CaseIterable, Sendable, Equatable {
        public static let attribute: String = "loading"
        
        /// Defers loading of the resource until it reaches a calculated distance from the viewport.
        /// Useful for conserving bandwidth and improving initial page load time.
        case lazy
        
        /// Loads the resource immediately, regardless of where it's located on the page (default browser behavior).
        case eager
    }

}
