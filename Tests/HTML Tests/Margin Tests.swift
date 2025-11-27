//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/07/2025.
//

import Dependencies
import HTML
import OrderedCollections
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite(
        "Tests"
    )
    struct MarginTests {
        @Test("Margin Vertical Horizontal Test")
        func marginVerticalHorizontal() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(vertical: .px(10), horizontal: .px(20))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-0{margin:10px 20px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin Vertical Only Test")
        func marginVerticalOnly() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(vertical: .px(15))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-top-0{margin-top:15px}
                      .margin-bottom-1{margin-bottom:15px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-top-0 margin-bottom-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin Horizontal Only Test")
        func marginHorizontalOnly() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(horizontal: .px(25))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-right-0{margin-right:25px}
                      .margin-left-1{margin-left:25px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-right-0 margin-left-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin Set Variant Test")
        func marginVariants() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(
                            top: .px(10),
                            right: .px(20),
                            bottom: .px(15),
                            left: .px(25)
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-0{margin:10px 20px 15px 25px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin with Media Query")
        func marginWithMediaQuery() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(
                            top: .px(10),
                            bottom: .px(15),
                            media: .screen && .minWidth(.px(768))
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen and (min-width: 768px){
                        .margin-top-0{margin-top:10px}
                        .margin-bottom-1{margin-bottom:15px}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="margin-top-0 margin-bottom-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin with optional inputs")
        func marginWithOptionalInputs() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(
                            top: .px(10),
                            right: nil,
                            bottom: .px(10),
                            left: .px(10),
                            media: nil,
                            selector: nil,
                            pseudo: nil
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-top-0{margin-top:10px}
                      .margin-bottom-1{margin-bottom:10px}
                      .margin-left-2{margin-left:10px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-top-0 margin-bottom-1 margin-left-2">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin all sides equal optimization")
        func marginAllSidesEqual() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(
                            top: .px(15),
                            right: .px(15),
                            bottom: .px(15),
                            left: .px(15)
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-0{margin:15px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin vertical horizontal optimization")
        func marginVerticalHorizontalOptimization() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(
                            top: .px(10),
                            right: .px(20),
                            bottom: .px(10),
                            left: .px(20)
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-0{margin:10px 20px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin horizontal equal optimization")
        func marginHorizontalEqual() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(
                            right: .px(12),
                            left: .px(12)
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-0{margin:0px 12px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin single side")
        func marginSingleSide() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(top: .px(8))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .margin-top-0{margin-top:8px}
                    </style>
                  </head>
                  <body>
                    <div class="margin-top-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Margin no values provided")
        func marginNoValues() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .margin(vertical: nil, horizontal: nil)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                  </head>
                  <body>
                    <div>
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
