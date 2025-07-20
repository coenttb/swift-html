//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import Dependencies
import Foundation
import HTML
import PointFreeHTMLTestSupport
import OrderedCollections
import Testing

@Suite(
    "Background Tests",
    .snapshots(record: nil)
)
struct BackgroundTests {
    @Test("Background")
    func background() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .border(
                        .init(
                            width: .length(1.px),
                            style: .solid,
                            color: .red
                        )
                    )
            }
            ,
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .border-cAjok1{border:1px solid red}

                </style>
              </head>
              <body>
            <div class="border-cAjok1">
            </div>
              </body>
            </html>
            """
        }
    }
}
