//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 16/09/2024.
//

import Foundation

//
//  String.swift
//  pointfree-html
//
//  Created by Coen ten Thije Boonkkamp on 12/03/2025.
//

extension String {
    /// Creates a String from rendered HTML content.
    ///
    /// This initializer provides a convenient way to convert rendered HTML
    /// into a String using the specified encoding. It automatically handles
    /// the rendering process and encoding conversion.
    ///
    /// Example:
    /// ```swift
    /// let content = div {
    ///     h1 { "Hello, World!" }
    /// }
    ///
    /// do {
    ///     let htmlString = try String(content)
    ///     print(htmlString)
    /// } catch {
    ///     print("Failed to render HTML: \(error)")
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - html: The HTML content to render as a string.
    ///   - encoding: The character encoding to use when converting the rendered bytes to a string.
    ///     Defaults to UTF-8.
    ///
    /// - Throws: `HTMLPrinter.Error` if the rendered bytes cannot be converted to a string
    ///   using the specified encoding.
    public init(_ html: some HTML, encoding: String.Encoding = .utf8) throws {
        guard let string = String(bytes: html.render(), encoding: encoding)
        else { throw HTMLPrinter.Error(message: "Couldn't render HTML") }
        self = string
    }
}

extension HTMLPrinter {
    /// An error type representing HTML rendering failures.
    ///
    /// This error is thrown when there's a problem rendering HTML content
    /// or when the rendered bytes cannot be converted to a string.
    struct Error: Swift.Error {
        /// A description of what went wrong during HTML rendering.
        let message: String
    }
}

extension CustomStringConvertible where Self: HTML {
    public var description: String {
        try! String(self)
    }
}
