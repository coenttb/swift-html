//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/07/2025.
//

import Dependencies
import Foundation
import HTML
import PointFreeHTMLTestSupport
import OrderedCollections
import Testing

@Suite(
    "Tests",
    .snapshots(record: nil)
)
struct MarginTests {
    @Test("Margin Vertical Horizontal Test")
    func marginVerticalHorizontal() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .margin(vertical: .px(10), horizontal: .px(20))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .margin-UnnKO3{margin:10px 20px}

                </style>
              </head>
              <body>
            <div class="margin-UnnKO3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin Vertical Only Test")
    func marginVerticalOnly() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .margin(vertical: .px(15))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .margin-bottom-8DJ5t4{margin-bottom:15px}
            .margin-top-8DJ5t4{margin-top:15px}

                </style>
              </head>
              <body>
            <div class="margin-bottom-8DJ5t4 margin-top-8DJ5t4">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin Horizontal Only Test")
    func marginHorizontalOnly() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .margin(horizontal: .px(25))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .margin-left-dbugm3{margin-left:25px}
            .margin-right-dbugm3{margin-right:25px}

                </style>
              </head>
              <body>
            <div class="margin-left-dbugm3 margin-right-dbugm3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin Set Variant Test")
    func marginVariants() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .margin-3kdGx2{margin:10px 20px 15px 25px}

                </style>
              </head>
              <body>
            <div class="margin-3kdGx2">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin with Media Query")
    func marginWithMediaQuery() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
              .margin-bottom-3cc9g1{margin-bottom:15px}
              .margin-top-7AQLU3{margin-top:10px}
            }

                </style>
              </head>
              <body>
            <div class="margin-bottom-3cc9g1 margin-top-7AQLU3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin with optional inputs")
    func marginWithOptionalInputs() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .margin-left-Fqw6a1{margin-left:10px}
            .margin-bottom-Fqw6a1{margin-bottom:10px}
            .margin-top-Fqw6a1{margin-top:10px}

                </style>
              </head>
              <body>
            <div class="margin-left-Fqw6a1 margin-bottom-Fqw6a1 margin-top-Fqw6a1">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin all sides equal optimization")
    func marginAllSidesEqual() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .margin-8DJ5t4{margin:15px}

                </style>
              </head>
              <body>
            <div class="margin-8DJ5t4">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin vertical horizontal optimization")
    func marginVerticalHorizontalOptimization() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .margin-UnnKO3{margin:10px 20px}

                </style>
              </head>
              <body>
            <div class="margin-UnnKO3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin horizontal equal optimization")
    func marginHorizontalEqual() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
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
            .margin-yRPDN3{margin:0px 12px}

                </style>
              </head>
              <body>
            <div class="margin-yRPDN3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin single side")
    func marginSingleSide() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .margin(top: .px(8))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .margin-top-GcgQe4{margin-top:8px}

                </style>
              </head>
              <body>
            <div class="margin-top-GcgQe4">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin no values provided")
    func marginNoValues() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div { HTMLEmpty() }
                    .margin(vertical: nil, horizontal: nil)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>

                </style>
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
