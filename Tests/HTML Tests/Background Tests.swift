//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import Dependencies
import Foundation
import HTML
import HTML_Rendering_TestSupport
import OrderedCollections
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
                      .border-1{border:1px solid #cc3333}
                      @media (prefers-color-scheme: dark){
                        .border-0{border:1px solid #ff1a1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-0 border-1">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
