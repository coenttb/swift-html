//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import HTML

package struct BaseHTMLDocument<
    Styles: HTML,
    Favicons: HTML,
    Scripts: HTML,
    Body: HTML
> {
    let title: String
    let description: String?
    @HTMLBuilder let styles: Styles
    @HTMLBuilder let favicons: Favicons
    @HTMLBuilder let scripts: Scripts
    @HTMLBuilder let _body: Body
    
    public init(
        title: String,
        description: String?,
        @HTMLBuilder styles: () -> Styles,
        @HTMLBuilder favicons: () -> Favicons,
        @HTMLBuilder scripts: () -> Scripts,
        @HTMLBuilder body: () -> Body
    ) {
        self.title = title
        self.styles = styles()
        self.favicons = favicons()
        self.scripts = scripts()
        self.description = description
        self._body = body()
    }
}

extension BaseHTMLDocument: HTMLDocument {
    public var head: some HTML {
        BaseHTMLDocument.Header(
            title: self.title,
            styles: { styles },
            favicons: {favicons},
            scripts: {scripts}
        )
    }
    
    package var body: some HTML {
        _body
    }
}
