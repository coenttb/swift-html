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
    "Tests",
    .snapshots(record: nil)
)
struct PaddingTests {
    @Test("Border Test")
    func border() {
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

    @Test("Padding Vertical Horizontal Test")
    func paddingVerticalHorizontal() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .padding(vertical: .px(10), horizontal: .px(20))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .padding-UnnKO3{padding:10px 20px}

                </style>
              </head>
              <body>
            <div class="padding-UnnKO3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Padding Set Variant Test")
    func paddingVariants() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .padding-3kdGx2{padding:10px 20px 15px 25px}

                </style>
              </head>
              <body>
            <div class="padding-3kdGx2">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Padding with Media Query")
    func paddingWithMediaQuery() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .padding(
                        [
                            .top(.px(10)),
                            .bottom(.px(15))
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
              .padding-bottom-3cc9g1{padding-bottom:15px}
              .padding-top-7AQLU3{padding-top:10px}
            }

                </style>
              </head>
              <body>
            <div class="padding-bottom-3cc9g1 padding-top-7AQLU3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Padding with optional inputs")
    func paddingWithOptionalInputs() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .padding-left-Fqw6a1{padding-left:10px}
            .padding-bottom-Fqw6a1{padding-bottom:10px}
            .padding-top-Fqw6a1{padding-top:10px}

                </style>
              </head>
              <body>
            <div class="padding-left-Fqw6a1 padding-bottom-Fqw6a1 padding-top-Fqw6a1">
            </div>
              </body>
            </html>
            """
        }
    }
}
