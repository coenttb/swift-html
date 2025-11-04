//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/07/2025.
//

import Dependencies
import Foundation
import HTML
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
  @Suite("README Tests")
  struct READMETests {
  @Test("Example 1")
  func testingExample1() {

    let page = HTMLDocument {
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
      .margin-u7yQf2{margin:auto}
      .max-width-GQwWN3{max-width:800px}
      .padding-hS6a7{padding:2rem}
      .font-size-Wr637{font-size:2.5rem}
      .color-ILzRW1{color:#cc3333}
      .line-height-0Yl5l{line-height:1.6}
      .color-Qt8ai2{color:#d0d0d0}
      .text-decoration-Wl0y44{text-decoration:none}
      .border-radius-GcgQe4{border-radius:8px}
      .color-rWVh14{color:white}
      .background-color-mIOKK3{background-color:#cccc33}
      .padding-dnNPN1{padding:1rem}
      @media (prefers-color-scheme: dark){
        .color-CA97y2{color:rgb(163, 40, 40)}
        .color-VPSOa4{color:#3a3a3a}
        .background-color-P2tkR3{background-color:rgb(163, 163, 40)}
      }

          </style>
        </head>
        <body>
      <div class="margin-u7yQf2 max-width-GQwWN3 padding-hS6a7">
        <h1 class="font-size-Wr637 color-ILzRW1 color-CA97y2">Welcome to swift-html
        </h1>
        <p class="line-height-0Yl5l color-Qt8ai2 color-VPSOa4">Build beautiful, type-safe web pages with Swift
        </p><a class="text-decoration-Wl0y44 border-radius-GcgQe4 color-rWVh14 background-color-mIOKK3 background-color-P2tkR3 padding-dnNPN1" href="https://github.com/coenttb/swift-html">Get Started →</a>
      </div>
        </body>
      </html>
      """
    }
  }

  @Test("Testing Example 1")
  func testingTestingExample1() {
    assertInlineSnapshot(
      of: HTMLElementTypes.Button.submit { "Submit Form" },
      as: .html
    ) {
      """
      <button type="submit">Submit Form</button>
      """
    }
  }
  }
}
