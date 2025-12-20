//
//  CSS Tests.swift
//  swift-html
//
//  Tests for CSS fluent chaining pattern.
//


import Foundation
import HTML
import HTML_Rendering_TestSupport
import OrderedCollections
import Testing

extension SnapshotTests {
    @Suite("CSS Tests")
    struct CSSTests {

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
                      .margin-0{margin:8px}
                      .padding-1{padding:16px}
                      .display-2{display:flex}
                    </style>
                  </head>
                  <body>
                    <div class="margin-0 padding-1 display-2">Styled content
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("CSS conforms to HTML.View - usable in result builder")
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
                      .color-2{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:#3399ff}
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
                      .background-color-1{background-color:#FFFFFF}
                      .border-radius-2{border-radius:8px}
                      .padding-3{padding:24px}
                      .justify-content-4{justify-content:center}
                      .align-items-5{align-items:center}
                      .flex-direction-6{flex-direction:column}
                      .display-7{display:flex}
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:#1a1a1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 background-color-1 border-radius-2 padding-3 justify-content-4 align-items-5 flex-direction-6 display-7">Card
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
                    .padding(.px(8))
                    .media(.minWidth(.px(768))) {
                        $0.display(.flex)
                            .padding(.px(16))
                    }
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .padding-2{padding:8px}
                      .display-3{display:block}
                      @media (min-width: 768px){
                        .padding-0{padding:16px}
                        .display-1{display:flex}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="padding-0 display-1 padding-2 display-3">Responsive
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
                      .padding-0{padding:16px}
                      .display-1{display:flex}
                    </style>
                  </head>
                  <body>
                    <div class="padding-0 display-1" data-testid="mixed-element">Mixed
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
                      .z-index-0{z-index:10}
                      .left-1{left:auto}
                      .bottom-2{bottom:auto}
                      .right-3{right:0px}
                      .top-4{top:0px}
                      .position-5{position:absolute}
                    </style>
                  </head>
                  <body>
                    <div class="z-index-0 left-1 bottom-2 right-3 top-4 position-5">Positioned
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
                      .text-decoration-0{text-decoration:underline}
                      .text-align-1{text-align:center}
                      .line-height-2{line-height:1.5}
                      .font-weight-3{font-weight:bold}
                      .font-size-4{font-size:16px}
                    </style>
                  </head>
                  <body>
                    <p class="text-decoration-0 text-align-1 line-height-2 font-weight-3 font-size-4">Styled text
                    </p>
                  </body>
                </html>
                """
            }
        }
    }
}
