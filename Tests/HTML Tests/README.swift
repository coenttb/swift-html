//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/07/2025.
//

import CSS
import CSS_Standard
import HTML
import HTML_Rendering_TestSupport
import Testing

extension SnapshotTests {
    @Suite("README Tests")
    struct READMETests {
        @Test("Example 1")
        func testingExample1() {

            let page = HTML.Document {
                div {
                    h1 { "Welcome to swift-html" }
                        .css
                        .color(HTMLColor(light: .red, dark: .red))
                        .fontSize(.rem(2.5))

                    p { "Build beautiful, type-safe web pages with Swift" }
                        .css
                        .color(.gray800)
                        .lineHeight(1.6)

                    a(href: "https://github.com/coenttb/swift-html") {
                        "Get Started →"
                    }
                    .css
                    .padding(.rem(1))
                    .css.backgroundColor(HTMLColor(light: .yellow, dark: .yellow))
                    .color(.white)
                    .borderRadius(.px(8))
                    .textDecoration(TextDecoration.none)
                }
                .css
                .padding(.rem(2))
                .maxWidth(.px(800))
                .margin(.auto)
            } head: {
                title { "swift-html - Type-safe HTML in Swift" }
                meta(charset: .utf8)
                meta(name: .viewport, content: "width=device-width, initial-scale=1")
            }

            assertInlineSnapshot(
                of: page,
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <title>swift-html - Type-safe HTML in Swift
                    </title>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <style>
                      .margin-0{margin:auto}
                      .max-width-1{max-width:800px}
                      .padding-2{padding:2rem}
                      .font-size-3{font-size:2.5rem}
                      .color-4{color:#cc3333}
                      .line-height-5{line-height:1.6}
                      .color-7{color:#d0d0d0}
                      .text-decoration-8{text-decoration:none}
                      .border-radius-9{border-radius:8px}
                      .color-10{color:#fff}
                      .background-color-11{background-color:#cccc33}
                      .padding-12{padding:1rem}
                      @media (prefers-color-scheme: dark){
                        .color-6{color:#303030}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="margin-0 max-width-1 padding-2">
                      <h1 class="font-size-3 color-4">Welcome to swift-html
                      </h1>
                      <p class="line-height-5 color-6 color-7">Build beautiful, type-safe web pages with Swift
                      </p><a class="text-decoration-8 border-radius-9 color-10 background-color-11 padding-12" href="https://github.com/coenttb/swift-html">Get Started →</a>
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Testing Example 1")
        func testingTestingExample1() {
            assertInlineSnapshot(
                of: HTML_Standard.Button.submit { "Submit Form" },
                as: .html
            ) {
                """
                <button type="submit">Submit Form</button>
                """
            }
        }
    }
}
