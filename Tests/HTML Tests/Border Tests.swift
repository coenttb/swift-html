//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//


import Foundation
import HTML
import HTML_Rendering_TestSupport
import OrderedCollections
import Testing

extension SnapshotTests {
    @Suite("Border Tests")
    struct BorderTests {
        @Test("Border with light- and darkmode color for all sides")
        func borderAllSides() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        HTML.Empty()
                    }
                    .css.border(
                        Border.Side.all,
                        width: .px(1),
                        style: .solid,
                        color: .init(light: .red, dark: .blue)
                    )
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-1{border:1px solid #cc3333}
                      @media (prefers-color-scheme: dark){
                        .border-0{border:1px solid #3399ff}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-0 border-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Border with light- and darkmode color for some sides")
        func borderSomeSides() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        HTML.Empty()
                    }
                    .css.border(
                        [.right, .left, .bottom],
                        width: .px(1),
                        style: .solid,
                        color: .init(
                            light: .red,
                            dark: .blue
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
                      .border-left-1{border-left:1px solid #cc3333}
                      .border-bottom-3{border-bottom:1px solid #cc3333}
                      .border-right-5{border-right:1px solid #cc3333}
                      @media (prefers-color-scheme: dark){
                        .border-left-0{border-left:1px solid #3399ff}
                        .border-bottom-2{border-bottom:1px solid #3399ff}
                        .border-right-4{border-right:1px solid #3399ff}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-left-0 border-left-1 border-bottom-2 border-bottom-3 border-right-4 border-right-5">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Border with light- and darkmode color for some sides using variadic")
        func borderSomeSidesVariadic() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {
                        HTML.Empty()
                    }
                    .css.border(
                        .right,
                        .left,
                        .bottom,
                        width: .px(1),
                        style: .solid,
                        color: .init(
                            light: .red,
                            dark: .blue
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
                      .border-left-1{border-left:1px solid #cc3333}
                      .border-bottom-3{border-bottom:1px solid #cc3333}
                      .border-right-5{border-right:1px solid #cc3333}
                      @media (prefers-color-scheme: dark){
                        .border-left-0{border-left:1px solid #3399ff}
                        .border-bottom-2{border-bottom:1px solid #3399ff}
                        .border-right-4{border-right:1px solid #3399ff}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-left-0 border-left-1 border-bottom-2 border-bottom-3 border-right-4 border-right-5">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
