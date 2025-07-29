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
    "Border Tests",
    .snapshots(record: nil)
)
struct BorderTests {
    @Test("Border with light- and darkmode color for all sides")
    func borderAllSides() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div {
                    HTMLEmpty()
                }
                .border(
                    Border.Side.all,
                    width: .px(1),
                    style: .solid,
                    color: .init(light: .red, dark: .blue),
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
            .border-3JxMp{border:1px solid #cc3333}
            @media (prefers-color-scheme: dark){
              .border-Slrts3{border:1px solid #3399ff}
            }

                </style>
              </head>
              <body>
            <div class="border-3JxMp border-Slrts3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Border with light- and darkmode color for some sides")
    func borderSomeSides() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div {
                    HTMLEmpty()
                }
                .border(
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
            .border-right-3JxMp{border-right:1px solid #cc3333}
            .border-bottom-3JxMp{border-bottom:1px solid #cc3333}
            .border-left-3JxMp{border-left:1px solid #cc3333}
            @media (prefers-color-scheme: dark){
              .border-right-Slrts3{border-right:1px solid #3399ff}
              .border-bottom-Slrts3{border-bottom:1px solid #3399ff}
              .border-left-Slrts3{border-left:1px solid #3399ff}
            }

                </style>
              </head>
              <body>
            <div class="border-right-3JxMp border-right-Slrts3 border-bottom-3JxMp border-bottom-Slrts3 border-left-3JxMp border-left-Slrts3">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("Border with light- and darkmode color for some sides using variadic")
    func borderSomeSidesVariadic() {
        assertInlineSnapshot(
            of: HTMLDocument {
                div {
                    HTMLEmpty()
                }
                .border(
                    .right, .left, .bottom,
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
            .border-right-3JxMp{border-right:1px solid #cc3333}
            .border-bottom-3JxMp{border-bottom:1px solid #cc3333}
            .border-left-3JxMp{border-left:1px solid #cc3333}
            @media (prefers-color-scheme: dark){
              .border-right-Slrts3{border-right:1px solid #3399ff}
              .border-bottom-Slrts3{border-bottom:1px solid #3399ff}
              .border-left-Slrts3{border-left:1px solid #3399ff}
            }

                </style>
              </head>
              <body>
            <div class="border-right-3JxMp border-right-Slrts3 border-bottom-3JxMp border-bottom-Slrts3 border-left-3JxMp border-left-Slrts3">
            </div>
              </body>
            </html>
            """
        }
    }
}
