//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/07/2024.
//

import Foundation
import HTML

// Version without custom head content
extension HTML.Document where Body: HTML.View, Head == _ModernHead<Empty> {
    public static func modern(
        @HTML.Builder body: () -> Body
    ) -> HTML.Document<Body, _ModernHead<Empty>> {
        HTML.Document(
            body: body,
            head: { _ModernHead(customHead: Empty()) }
        )
    }
}

// Version with custom head content
extension HTML.Document where Body: HTML.View {
    public static func modern<CustomHead: HTML.View>(
        @HTML.Builder body: () -> Body,
        @HTML.Builder head customHead: () -> CustomHead
    ) -> HTML.Document<Body, _ModernHead<CustomHead>> where Head == _ModernHead<CustomHead> {
        HTML.Document(
            body: body,
            head: { _ModernHead(customHead: customHead()) }
        )
    }
}

public struct _ModernHead<CustomHead: HTML.View>: HTML.View {
    let customHead: CustomHead

    public init(customHead: CustomHead) {
        self.customHead = customHead
    }

    public var body: some HTML.View {
        HTML.Group {
            customHead
            meta(charset: .utf8)()
            BaseStyles()

            Style {
                """

                body, html {
                    background: \(HTMLColor.theme.background.primary.light.description);
                }

                @media (prefers-color-scheme: dark) {
                    body, html {
                        background: \(HTMLColor.theme.background.primary.dark.description);
                    }
                }

                """
            }
        }
    }
}

// Empty for when no custom head is provided
public struct Empty: HTML.View {
    public init() {}
    public var body: some HTML.View {
        HTML.Text("")
    }
}
