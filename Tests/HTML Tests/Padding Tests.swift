//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML
import Testing
import Foundation
import Dependencies
import HTMLTestSupport
import OrderedCollections

@Suite(
    "Tests",
    .snapshots(record: .failed)
)
struct PaddingTests {
    @Test("Border Test")
    func border() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div(){ HTMLEmpty() }
                    .border(
                        .init(
                            width: .length(1.px),
                            style: .solid,
                            color: .red
                        )
                    )
            }
            ,
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .border-cAjok1{border:1px solid red}

                </style>
              </head>
              <body>
            <div class="border-cAjok1">
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
                div(){ HTMLEmpty() }
                    .padding(vertical: .px(10), horizontal: .px(20))
            }
            ,
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
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
                div(){ HTMLEmpty() }
                    .padding(
                        .top(.px(10)),
                        .right(.px(20)),
                        .bottom(.px(15)),
                        .left(.px(25))
                    )
            }
            ,
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
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
                div(){ HTMLEmpty() }
                    .padding(
                        [
                            .top(.px(10)),
                            .bottom(.px(15))
                        ],
                        media: .screen && .minWidth(.px(768))
                    )
            }
            ,
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
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
}
