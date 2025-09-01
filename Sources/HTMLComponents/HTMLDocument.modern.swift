//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/07/2024.
//

import Foundation
import HTML

// Version without custom head content
extension HTMLDocument where Body: HTML, Head == _ModernHead<EmptyHTML> {
    public static func modern(
        @HTMLBuilder body: () -> Body
    ) -> HTMLDocument<Body, _ModernHead<EmptyHTML>> {
        HTMLDocument(
            body: body,
            head: { _ModernHead(customHead: EmptyHTML.init) }
        )
    }
}

// Version with custom head content
extension HTMLDocument where Body: HTML {
    public static func modern<CustomHead: HTML>(
        @HTMLBuilder body: () -> Body,
        @HTMLBuilder head customHead: @escaping () -> CustomHead
    ) -> HTMLDocument<Body, _ModernHead<CustomHead>> where Head == _ModernHead<CustomHead> {
        HTMLDocument(
            body: body,
            head: { _ModernHead(customHead: customHead) }
        )
    }
}

public struct _ModernHead<CustomHead: HTML>: HTML {
    let customHead: () -> CustomHead
    
    public init(customHead: @escaping () -> CustomHead) {
        self.customHead = customHead
    }
    
    public var body: some HTML {
        HTMLGroup {
            customHead()
            meta(charset: .utf8)()
            BaseStyles()
            
            Style {"""

            body, html {
                background: \(HTMLColor.theme.background.primary.light.description);
            }

            @media (prefers-color-scheme: dark) {
                body, html {
                    background: \(HTMLColor.theme.background.primary.dark.description);
                }
            }

            """}
        }
    }
}

// EmptyHTML for when no custom head is provided
public struct EmptyHTML: HTML {
    public init() {}
    public var body: some HTML {
        HTMLText("")
    }
}
