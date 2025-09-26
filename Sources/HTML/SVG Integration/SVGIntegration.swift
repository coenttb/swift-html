//
//  SVGIntegration.swift
//  swift-html
//
//  Bridge to integrate swift-svg with swift-html
//

import SVGPrinter
import SVGTypes
// Import SVG module but we need to be careful about naming
import SVG
import HTMLElementTypes

/// Bridge to embed type-safe SVG content in HTML documents.
///
/// `InlineSVG` allows you to use the swift-svg library's type-safe DSL
/// within HTML documents, providing compile-time validation and better
/// developer experience compared to raw SVG strings.
///
/// Example:
/// ```swift
/// div {
///     h1 { "My Page" }
///
///     InlineSVG {
///         svg(width: 100, height: 100) {
///             circle(cx: 50, cy: 50, r: 40) {
///                 fill("red")
///                 stroke("black", width: 3)
///             }
///         }
///     }
/// }
/// ```
public struct InlineSVG: HTML {
    /// The SVG content to embed
    private let content: any SVG

    /// Creates a new inline SVG element from SVG content.
    ///
    /// - Parameter content: A closure that returns SVG content using the SVG DSL.
    public init<Content: SVG>(@SVGBuilder _ content: () -> Content) {
        self.content = content()
    }

    /// Creates a new inline SVG element from already created SVG content.
    ///
    /// - Parameter content: SVG content
    public init<Content: SVG>(_ content: Content) {
        self.content = content
    }

    /// Renders the SVG content as HTML.
    public var body: some HTML {
        // Render the SVG to a string and embed as raw HTML
        HTMLRaw(content.render())
    }
}

// MARK: - Convenience Functions

/// Creates an inline SVG element from a pre-rendered SVG string.
///
/// This function provides a migration path for existing raw SVG strings
/// while encouraging the use of type-safe SVG where possible.
///
/// - Parameter svgString: A string containing valid SVG markup.
/// - Returns: An HTML element containing the SVG.
public func svg(_ svgString: String) -> some HTML {
    HTMLRaw(svgString)
}

// MARK: - Image Extensions for SVG

import Foundation
//
//
//func img<Content: SVG>(
//    svg content: Content,
//    alt: String,
//    base64: Bool = false
//) -> some HTML {
//    let svgString = content.render()
//
//    let src: String
//    if base64 {
//        let data = Data(svgString.utf8)
//        let base64String = data.base64EncodedString()
//        src = "data:image/svg+xml;base64,\(base64String)"
//    } else {
//        // URL encode the SVG for direct embedding
//        let encoded = svgString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? svgString
//        src = "data:image/svg+xml;charset=utf-8,\(encoded)"
//    }
//
//    return HTMLElementTypes.Image(src: Src(src), alt: Alt(alt))
//}
//

extension HTMLElementTypes.Image {
    public init<Content: SVG>(
        svg: Content,
        alt: Alt?,
        base64: Bool = true,
        loading: Loading? = .eager
    ){
        let svgString = svg.render()

        var src: Src {
            if base64 {
                let data = Data(svgString.utf8)
                let base64String = data.base64EncodedString()
                return "data:image/svg+xml;base64,\(base64String)"
            } else {
                // URL encode the SVG for direct embedding
                let encoded = svgString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? svgString
                return "data:image/svg+xml;charset=utf-8,\(encoded)"
            }
        }
        
        self = .init(
            src: src,
            alt: alt,
            loading: loading
        )
    }
}
