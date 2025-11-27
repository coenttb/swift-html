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
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("Tests")
    struct PaddingTests {
        @Test("Border Test")
        func border() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
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
                      .border-0{border:1px solid #cc3333}
                    </style>
                  </head>
                  <body>
                    <div class="border-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Padding Vertical Horizontal Test")
        func paddingVerticalHorizontal() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .padding(vertical: .px(10), horizontal: .px(20))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .padding-0{padding:10px 20px}
                    </style>
                  </head>
                  <body>
                    <div class="padding-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Padding Set Variant Test")
        func paddingVariants() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .padding(
                            .top(.px(10)),
                            .right(.px(20)),
                            .bottom(.px(15)),
                            .left(.px(25))
                        )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .padding-0{padding:10px 20px 15px 25px}
                    </style>
                  </head>
                  <body>
                    <div class="padding-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Padding with Media Query")
        func paddingWithMediaQuery() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .padding(
                            [
                                .top(.px(10)),
                                .bottom(.px(15)),
                            ],
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
                        .padding-bottom-0{padding-bottom:15px}
                        .padding-top-1{padding-top:10px}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="padding-bottom-0 padding-top-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Padding with optional inputs")
        func paddingWithOptionalInputs() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { HTML.Empty() }
                        .padding(
                            top: .px(10),
                            bottom: .px(10),
                            left: .px(10),
                            right: nil,
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
                      .padding-left-0{padding-left:10px}
                      .padding-bottom-1{padding-bottom:10px}
                      .padding-top-2{padding-top:10px}
                    </style>
                  </head>
                  <body>
                    <div class="padding-left-0 padding-bottom-1 padding-top-2">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
