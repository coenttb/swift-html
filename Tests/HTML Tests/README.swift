//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/07/2025.
//

import Dependencies
import HTML
import CSS_Rendering
import CSS_Standard
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("README Tests")
    struct READMETests {
        @Test("Example 1")
        func testingExample1() {

            let page = HTML.Document {
                div {
                    h1 { "Welcome to swift-html" }
                        .color(.red)
                        .fontSize(.rem(2.5))

                    p { "Build beautiful, type-safe web pages with Swift" }
                        .color(light: .gray800, dark: .gray200)
                        .lineHeight(1.6)

                    a(href: "https://github.com/coenttb/swift-html") {
                        "Get Started →"
                    }
                    .padding(.rem(1))
                    .backgroundColor(.yellow)
                    .color(.white)
                    .borderRadius(.px(8))
                    .textDecoration(TextDecoration.none)
                }
                .padding(.rem(2))
                .maxWidth(.px(800))
                .margin(.auto)
            } head: {
                title { "swift-html - Type-safe HTML in Swift" }
                meta(charset: .utf8)()
                meta(name: .viewport, content: "width=device-width, initial-scale=1")()
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
                      .padding-0{padding:2rem}
                      .max-width-1{max-width:800px}
                      .margin-2{margin:auto}
                      .font-size-3{font-size:2.5rem}
                      .color-4{color:#cc3333}
                      .color-6{color:#d0d0d0}
                      .line-height-8{line-height:1.6}
                      .color-9{color:white}
                      .border-radius-10{border-radius:8px}
                      .text-decoration-11{text-decoration:none}
                      .padding-12{padding:1rem}
                      .background-color-13{background-color:#cccc33}
                      @media (prefers-color-scheme: dark){
                        .color-5{color:rgb(163, 40, 40)}
                        .color-7{color:#3a3a3a}
                        .background-color-14{background-color:rgb(163, 163, 40)}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="padding-0 max-width-1 margin-2">
                      <h1 class="font-size-3 color-4 color-5">Welcome to swift-html
                      </h1>
                      <p class="color-6 color-7 line-height-8">Build beautiful, type-safe web pages with Swift
                      </p><a class="color-9 border-radius-10 text-decoration-11 padding-12 background-color-13 background-color-14" href="https://github.com/coenttb/swift-html">Get Started →</a>
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
