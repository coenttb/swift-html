//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 27/07/2024.
//

import Foundation

extension BaseHTMLDocument {
    struct Header: HTML {
        let title: String
        @HTMLBuilder let styles: Styles
        @HTMLBuilder let favicons: Favicons
        @HTMLBuilder let scripts: Scripts
        
        public init(
            title: String,
            @HTMLBuilder styles: () -> Styles,
            @HTMLBuilder favicons: () -> Favicons,
            @HTMLBuilder scripts: () -> Scripts
        ) {
            self.title = title
            self.styles = styles()
            self.favicons = favicons()
            self.scripts = scripts()
        }
        
        public var body: some HTML {
            tag("title") { HTMLText(title) }
            meta()
                .attribute("charset", "UTF-8")
            meta()
                .attribute("name", "theme-color")
                .attribute("content", "#121212")
            meta()
                .attribute("name", "viewport")
                .attribute("content", "width=device-width, initial-scale=1.0, viewport-fit=cover")
            styles
            favicons
            scripts
            meta()
                .attribute("name", "title")
                .attribute("content", title)
            meta()
                .attribute("property", "og:title")
                .attribute("content", title)
            meta()
                .attribute("name", "twitter:title")
                .attribute("content", title)
        }
    }

}

