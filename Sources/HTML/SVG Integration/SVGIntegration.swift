//
//  SVGIntegration.swift
//  swift-html
//
//  Bridge to integrate swift-svg with swift-html
//

import RFC_4648
import WHATWG_HTML_Elements
import WHATWG_HTML_MediaAttributes
// Import SVG module but we need to be careful about naming
import SVG
import SVGPrinter
import SVGTypes

// MARK: - Foundation-free percent encoding for SVG data URLs
private func percentEncodeSVG(_ string: String) -> String {
    var result = ""
    for byte in string.utf8 {
        // Keep alphanumeric and SVG-safe characters
        if (byte >= 48 && byte <= 57) ||  // 0-9
           (byte >= 65 && byte <= 90) ||   // A-Z
           (byte >= 97 && byte <= 122) ||  // a-z
           byte == 45 || byte == 46 || byte == 95 || byte == 126 ||  // - . _ ~
           byte == 33 || byte == 39 || byte == 40 || byte == 41 || byte == 42 ||  // ! ' ( ) *
           byte == 60 || byte == 62 || byte == 61 || byte == 47 || byte == 58 {  // < > = / :
            result.append(Character(UnicodeScalar(byte)))
        } else {
            result.append("%")
            let hex = String(byte, radix: 16, uppercase: true)
            if hex.count == 1 { result.append("0") }
            result.append(contentsOf: hex)
        }
    }
    return result
}

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

//
//
// func img<Content: SVG>(
//    svg content: Content,
//    alt: String,
//    base64: Bool = false
// ) -> some HTML {
//    let svgString = content.render()
//
//    let src: String
//    if base64 {
//        // let data = Data(svgString.utf8)
//        let base64String = String(base64Encoding: Array(svgString.utf8))
//        src = "data:image/svg+xml;base64,\(base64String)"
//    } else {
//        // URL encode the SVG for direct embedding
//        let encoded = percentEncodeSVG()
//        src = "data:image/svg+xml;charset=utf-8,\(encoded)"
//    }
//
//    return HTML_Standard_Elements.Image(src: Src(src), alt: Alt(alt))
// }
//

extension WHATWG_HTML_Elements.Image {
    public init<Content: SVG>(
        svg: Content,
        alt: WHATWG_HTML_MediaAttributes.Alt?,
        base64: Bool = true,
        loading: WHATWG_HTML_MediaAttributes.Loading? = .eager
    ) {
        let svgString = svg.render()

        let src: WHATWG_HTML_MediaAttributes.Src = {
            if base64 {
                // let data = Data(svgString.utf8)
                let base64String = String(base64Encoding: Array(svgString.utf8))
                return "data:image/svg+xml;base64,\(base64String)"
            } else {
                // URL encode the SVG for direct embedding
                let encoded = percentEncodeSVG(svgString)
                return "data:image/svg+xml;charset=utf-8,\(encoded)"
            }
        }()

        self = .init(
            src: src,
            alt: alt,
            loading: loading
        )
    }
}
