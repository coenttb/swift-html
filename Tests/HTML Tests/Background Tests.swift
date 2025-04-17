//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML
import Testing
import Foundation
import Dependencies
import HTMLTestSupport
import OrderedCollections

@Suite(
    "Background Tests",
    .snapshots(record: .failed)
)
struct BackgroundTests {
    @Test("Background")
    func background() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div(){ HTMLEmpty() }
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
            <html lang="en">
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
