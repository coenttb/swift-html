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
import InlineSnapshotTesting

@Suite(
    "Tests",
    .snapshots(record: nil)
)
struct Tests {
    @Test("asd")
    func asd() {
        assertInlineSnapshot(
            of: label(for: "test") {
                input(name: "test", type: .text(.init()))
            }
                .color(.red),
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .color-dMYaj4{color:red}

                </style>
              </head>
              <body><label class="color-dMYaj4" for="test"><input type="text" name="test"></label>
              </body>
            </html>
            """
        }
    }
}
