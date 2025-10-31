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
import PointFreeHTMLTestSupport
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
      },
      as: .html
    ) {
      """
      <!doctype html>
      <html>
        <head>
          <style>
      .border-3JxMp{border:1px solid #cc3333}
      @media (prefers-color-scheme: dark){
        .border-CRwQB2{border:1px solid rgb(163, 40, 40)}
      }

          </style>
        </head>
        <body>
      <div class="border-3JxMp border-CRwQB2">
      </div>
        </body>
      </html>
      """
    }
  }
}
