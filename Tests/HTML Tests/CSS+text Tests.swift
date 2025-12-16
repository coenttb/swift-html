//
//  CSS+text Tests.swift
//  swift-html
//
//  Tests for the CSS.text() convenience method.
//

import HTML
import HTML_Rendering_TestSupport
import Testing

@Suite("CSS+text Tests")
struct CSSTextTests {

    @Test("text with align only")
    func textAlignOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Centered text" }
                    .css.text(align: .center)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-align-0{text-align:center}
                </style>
              </head>
              <body>
                <p class="text-align-0">Centered text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with decoration only")
    func textDecorationOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Underlined text" }
                    .css.text(decoration: .underline)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-decoration-0{text-decoration:underline}
                </style>
              </head>
              <body>
                <p class="text-decoration-0">Underlined text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with transform only")
    func textTransformOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Uppercase text" }
                    .css.text(transform: .uppercase)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-transform-0{text-transform:uppercase}
                </style>
              </head>
              <body>
                <p class="text-transform-0">Uppercase text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with overflow only")
    func textOverflowOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Ellipsis text" }
                    .css.text(overflow: .ellipsis)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-overflow-0{text-overflow:ellipsis}
                </style>
              </head>
              <body>
                <p class="text-overflow-0">Ellipsis text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with multiple properties")
    func textMultipleProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Styled text" }
                    .css.text(
                        align: .center,
                        decoration: .underline,
                        transform: .uppercase
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-transform-0{text-transform:uppercase}
                  .text-decoration-1{text-decoration:underline}
                  .text-align-2{text-align:center}
                </style>
              </head>
              <body>
                <p class="text-transform-0 text-decoration-1 text-align-2">Styled text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with all properties")
    func textAllProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Fully styled text" }
                    .css.text(
                        align: .center,
                        decoration: .underline,
                        transform: .uppercase,
                        overflow: .ellipsis
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-overflow-0{text-overflow:ellipsis}
                  .text-transform-1{text-transform:uppercase}
                  .text-decoration-2{text-decoration:underline}
                  .text-align-3{text-align:center}
                </style>
              </head>
              <body>
                <p class="text-overflow-0 text-transform-1 text-decoration-2 text-align-3">Fully styled text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with no properties returns base unchanged")
    func textNoProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Plain text" }
                    .css.text()
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
              </head>
              <body>
                <p>Plain text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text chains with other CSS properties")
    func textChainsWithOtherProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Chained text" }
                    .css
                    .text(
                        align: .center,
                        transform: .uppercase
                    )
                    .color(.red)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-0{color:red}
                  .text-transform-1{text-transform:uppercase}
                  .text-align-2{text-align:center}
                </style>
              </head>
              <body>
                <p class="color-0 text-transform-1 text-align-2">Chained text
                </p>
              </body>
            </html>
            """
        }
    }
}
