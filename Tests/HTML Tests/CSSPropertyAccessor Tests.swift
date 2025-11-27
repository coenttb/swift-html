//
//  CSSPropertyAccessor Tests.swift
//  swift-html
//
//  Tests for CSSPropertyAccessor fluent chaining pattern.
//

import Dependencies
import Foundation
import HTML
import OrderedCollections
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("CSSPropertyAccessor Tests")
    struct CSSPropertyAccessorTests {

        @Test("Fluent chaining without repeated .css calls")
        func fluentChaining() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        "Styled content"
                    }
                    .css
                    .display(.flex)
                    .padding(.px(16))
                    .margin(.px(8))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .display-0{display:flex}
                      .padding-1{padding:16px}
                      .margin-2{margin:8px}
                    </style>
                  </head>
                  <body>
                    <div class="display-0 padding-1 margin-2">Styled content
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("CSSPropertyAccessor conforms to HTML.View - usable in result builder")
        func htmlViewConformance() {
            struct TestView: HTML.View {
                var body: some HTML.View {
                    div {
                        "Test"
                    }
                    .css
                    .color(.init(light: .red, dark: .blue))
                    .fontSize(.px(14))
                }
            }

            assertInlineSnapshot(
                of: HTML.Document {
                    TestView()
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .font-size-0{font-size:14px}
                      .color-1{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-2{color:#3399ff}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="font-size-0 color-1 color-2">Test
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Multiple CSS properties chained fluently")
        func multiplePropertiesChained() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        "Card"
                    }
                    .css
                    .display(.flex)
                    .flexDirection(.column)
                    .alignItems(.center)
                    .justifyContent(.center)
                    .padding(.px(24))
                    .borderRadius(.px(8))
                    .css.backgroundColor(HTMLColor(light: .white, dark: .hex("1a1a1a")))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .display-0{display:flex}
                      .flex-direction-1{flex-direction:column}
                      .align-items-2{align-items:center}
                      .justify-content-3{justify-content:center}
                      .padding-4{padding:24px}
                      .border-radius-5{border-radius:8px}
                      .background-color-6{background-color:#FFFFFF}
                      @media (prefers-color-scheme: dark){
                        .background-color-7{background-color:#1a1a1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="display-0 flex-direction-1 align-items-2 justify-content-3 padding-4 border-radius-5 background-color-6 background-color-7">Card
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("CSS namespace with media queries")
        func cssWithMediaQueries() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        "Responsive"
                    }
                    .css
                    .display(.block)
                    .display(.flex, media: .minWidth(.px(768)))
                    .padding(.px(8))
                    .padding(.px(16), media: .minWidth(.px(768)))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .display-0{display:block}
                      .padding-2{padding:8px}
                      @media (min-width: 768px){
                        .display-1{display:flex}
                        .padding-3{padding:16px}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="display-0 display-1 padding-2 padding-3">Responsive
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Mixing .css namespace with direct method calls")
        func mixingCssNamespaceWithDirectCalls() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        "Mixed"
                    }
                    .attribute("data-testid", "mixed-element")
                    .css
                    .display(.flex)
                    .padding(.px(16))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .display-0{display:flex}
                      .padding-1{padding:16px}
                    </style>
                  </head>
                  <body>
                    <div class="display-0 padding-1" data-testid="mixed-element">Mixed
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Position properties via CSS namespace")
        func positionProperties() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        "Positioned"
                    }
                    .css
                    .position(.absolute)
                    .top(.px(0))
                    .right(.px(0))
                    .bottom(.auto)
                    .left(.auto)
                    .zIndex(.init(10))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .position-0{position:absolute}
                      .top-1{top:0px}
                      .right-2{right:0px}
                      .bottom-3{bottom:auto}
                      .left-4{left:auto}
                      .z-index-5{z-index:10}
                    </style>
                  </head>
                  <body>
                    <div class="position-0 top-1 right-2 bottom-3 left-4 z-index-5">Positioned
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Typography properties via CSS namespace")
        func typographyProperties() {
            assertInlineSnapshot(
                of: HTML.Document {
                    p {
                        "Styled text"
                    }
                    .css
                    .fontSize(.px(16))
                    .fontWeight(.bold)
                    .lineHeight(1.5)
                    .textAlign(.center)
                    .textDecoration(.underline)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .font-size-0{font-size:16px}
                      .font-weight-1{font-weight:bold}
                      .line-height-2{line-height:1.5}
                      .text-align-3{text-align:center}
                      .text-decoration-4{text-decoration:underline}
                    </style>
                  </head>
                  <body>
                    <p class="font-size-0 font-weight-1 line-height-2 text-align-3 text-decoration-4">Styled text
                    </p>
                  </body>
                </html>
                """
            }
        }
    }
}
