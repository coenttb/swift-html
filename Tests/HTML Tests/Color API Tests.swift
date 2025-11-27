//
//  Color API Tests.swift
//  swift-html
//
//  Tests demonstrating the color API design patterns:
//  - CSS_Standard.Color.Value: No dark mode output
//  - HTMLColor: With dark mode support (auto-darkened or explicit)
//  - CSS_Standard.Global: No dark mode output
//  - light == dark optimization: No redundant @media block
//

import Dependencies
import HTML
import HTMLTheme
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("Color API Tests")
    struct ColorAPITests {

        // MARK: - CSS_Standard.Color.Value (No Dark Mode)

        @Test("Color.Value produces single style without dark mode")
        func colorValueNoDarkMode() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Raw color value" }
                        .css.color(.red)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:rgb(163, 40, 40)}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Raw color value
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("Color.Value with gray800 produces single style")
        func colorValueGray800NoDarkMode() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Gray text" }
                        .css.color(.gray800)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#d0d0d0}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:#303030}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Gray text
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - HTMLColor (With Dark Mode)

        @Test("HTMLColor from theme produces light and dark styles")
        func htmlColorFromTheme() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Themed color" }
                        .css.color(.gray800)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#d0d0d0}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:#303030}
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

        @Test("HTMLColor with explicit light/dark produces both styles")
        func htmlColorExplicitLightDark() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Explicit colors" }
                        .css.color(HTMLColor(light: .red, dark: .blue))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:#3399ff}
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
                        .css.color(DarkModeColor.autoAdaptive(light: .hex("ff0000")))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#ff0000}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:rgb(204, 0, 0)}
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

        // MARK: - backgroundColor

        @Test("backgroundColor with Color.Value has no dark mode")
        func backgroundColorValueNoDarkMode() {
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
                      .background-color-0{background-color:#3399ff}
                      @media (prefers-color-scheme: dark){
                        .background-color-1{background-color:#004477}
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
                      .background-color-0{background-color:#FFFFFF}
                      @media (prefers-color-scheme: dark){
                        .background-color-1{background-color:#121212}
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

        // MARK: - borderColor

        @Test("borderColor with Color.Value has no dark mode")
        func borderColorValueNoDarkMode() {
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
                      .border-color-0{border-color:#33cc33}
                      @media (prefers-color-scheme: dark){
                        .border-color-1{border-color:#008800}
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
                      .border-color-0{border-color:#d0d0d0}
                      @media (prefers-color-scheme: dark){
                        .border-color-1{border-color:#3a3a3a}
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

        // MARK: - fill

        @Test("fill with Color.Value has no dark mode")
        func fillValueNoDarkMode() {
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
                      .fill-0{fill:#a300cc}
                      @media (prefers-color-scheme: dark){
                        .fill-1{fill:#6e0088}
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

        // MARK: - stroke

        @Test("stroke with Color.Value has no dark mode")
        func strokeValueNoDarkMode() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Stroke" }
                        .css.stroke(.orange)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .stroke-0{stroke:#cc6600}
                      @media (prefers-color-scheme: dark){
                        .stroke-1{stroke:#ff8c1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="stroke-0 stroke-1">Stroke
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

        // MARK: - Combined Usage

        @Test("Multiple color properties with mixed types")
        func combinedColorProperties() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Mixed colors" }
                        .css.color(.red)  // Color.Value - no dark
                        .css.backgroundColor(HTMLColor.gray800)  // HTMLColor - with dark
                        .css.borderColor(.inherit)  // Global - no dark
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-0{border-color:inherit}
                      .background-color-1{background-color:#d0d0d0}
                      .color-3{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .background-color-2{background-color:#303030}
                        .color-4{color:rgb(163, 40, 40)}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0 background-color-1 background-color-2 color-3 color-4">Mixed colors
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
