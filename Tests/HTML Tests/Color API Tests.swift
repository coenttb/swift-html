//
//  Color API Tests.swift
//  swift-html
//
//  Tests demonstrating the color API design patterns:
//  - CSS_Standard.Color.Value: No dark mode output (explicit type needed)
//  - HTMLColor/DarkModeColor: With dark mode support (auto-darkened or explicit)
//  - CSS_Standard.Global: No dark mode output
//  - light == dark optimization: No redundant @media block
//

import Dependencies
import HTML
import HTML_Rendering_TestSupport
import Testing

extension SnapshotTests {
    @Suite("Color API Tests")
    struct ColorAPITests {

        // MARK: - Themed Colors (With Dark Mode)
        // Note: .red, .blue, .green, .gray800 etc. resolve to themed DarkModeColor values
        // which automatically have dark mode variants

        @Test("Themed color (test_red) produces dark mode styles")
        func themedColorWithDarkMode() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Themed color" }
                        .css
                        .color(.test_red)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:rgb(163, 40, 40)}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Themed color
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - Themed gray800 (With Dark Mode)

        @Test("gray800 produces dark mode styles (themed color)")
        func gray800WithDarkMode() {
            // .gray800 resolves to DarkModeColor.gray800 which has explicit dark variant
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Gray 800" }
                        .css.color(.gray800)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#d0d0d0}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:#303030}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Gray 800
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("HTMLColor with explicit light/dark produces both styles")
        func htmlColorExplicitLightDark() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Explicit colors" }
                        .css
                        .color(HTMLColor(light: .red, dark: .blue))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:#3399ff}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Explicit colors
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("HTMLColor with light only auto-darkens")
        func htmlColorAutoDarken() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Auto-darkened" }
                        .css.color(DarkModeColor(light: .hex("ff0000")))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#ff0000}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:rgb(204, 0, 0)}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Auto-darkened
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - light == dark Optimization

        @Test("HTMLColor with same light and dark produces single style")
        func htmlColorSameLightDark() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Same both modes" }
                        .css.color(HTMLColor(light: .red, dark: .red))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#cc3333}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">Same both modes
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - CSS_Standard.Global

        @Test("Global inherit produces single style")
        func globalInherit() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Inherited color" }
                        .css.color(.inherit)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">Inherited color
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Global initial produces single style")
        func globalInitial() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Initial color" }
                        .css.color(.initial)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:initial}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">Initial color
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - backgroundColor with themed colors (With Dark Mode)

        @Test("backgroundColor with themed blue has dark mode")
        func backgroundColorThemedBlue() {
            // .blue resolves to DarkModeColor.blue which has dark mode variant
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Background" }
                        .css.backgroundColor(.blue)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-1{background-color:#3399ff}
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:#004477}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 background-color-1">Background
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("backgroundColor with HTMLColor has dark mode")
        func backgroundColorHTMLColor() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Background" }
                        .css.backgroundColor(HTMLColor(light: .white, dark: .black))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-1{background-color:#FFFFFF}
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:#121212}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 background-color-1">Background
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - borderColor with themed colors (With Dark Mode)

        @Test("borderColor with themed green has dark mode")
        func borderColorThemedGreen() {
            // .green resolves to DarkModeColor.green which has dark mode variant
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Border" }
                        .css.borderColor(.green)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-1{border-color:#33cc33}
                      @media (prefers-color-scheme: dark){
                        .border-color-0{border-color:#008800}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0 border-color-1">Border
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("borderColor with HTMLColor has dark mode")
        func borderColorHTMLColor() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Border" }
                        .css.borderColor(HTMLColor(light: .gray800, dark: .gray200))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-1{border-color:#d0d0d0}
                      @media (prefers-color-scheme: dark){
                        .border-color-0{border-color:#3a3a3a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0 border-color-1">Border
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - fill with themed colors (With Dark Mode)

        @Test("fill with themed purple has dark mode")
        func fillThemedPurple() {
            // .purple resolves to DarkModeColor.purple which has dark mode variant
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Fill" }
                        .css.fill(.purple)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .fill-1{fill:#a300cc}
                      @media (prefers-color-scheme: dark){
                        .fill-0{fill:#6e0088}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="fill-0 fill-1">Fill
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - outlineColor

        @Test("outlineColor with global value")
        func outlineColorGlobal() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Outline" }
                        .css.outlineColor(.inherit)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .outline-color-0{outline-color:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="outline-color-0">Outline
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
