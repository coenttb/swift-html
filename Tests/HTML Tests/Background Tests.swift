//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import Dependencies
import Foundation
import HTML
import OrderedCollections
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("Background Tests")
    struct BackgroundTests {
        @Test("Background")
        func background() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .css
                        .border(
                            .init(
                                width: .length(1.px),
                                style: .solid,
                                color: .red
                            )
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-0{border:1px solid red}
                    </style>
                  </head>
                  <body>
                    <div class="border-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
