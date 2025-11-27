//
//  Color Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import Dependencies
import HTML
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("Color Tests")
    struct ColorTests {
        @Test("General")
        func general1() {
            assertInlineSnapshot(
                of: HTML.Document {
                    ContentDivision {
                        H1 { "Type-safe HTML" }
                            .css.color(light: .named(.blue), dark: .named(.red))
                            .fontSize(.px(24))
                        Paragraph { "With type-safe CSS!" }
                            .marginTop(.px(10))

                        Video(src: "/public/video/example.mp4", autoplay: true) {}
                    }
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .font-size-0{font-size:24px}
                      .color-1{color:blue}
                      .margin-top-3{margin-top:10px}
                      @media (prefers-color-scheme: dark){
                        .color-2{color:red}
                      }
                    </style>
                  </head>
                  <body>
                    <div>
                      <h1 class="font-size-0 color-1 color-2">Type-safe HTML
                      </h1>
                      <p class="margin-top-3">With type-safe CSS!
                      </p>
                      <video autoplay src="/public/video/example.mp4">
                      </video>
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("General2")
        func general2() {
            assertInlineSnapshot(
                of: HTML.Document {
                    p { "Hello World" }
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
                    </style>
                  </head>
                  <body>
                    <p class="color-0">Hello World
                    </p>
                  </body>
                </html>
                """
            }
        }

        @Test("Color initializes with standard color")
        func colorInitializesWithStandardColor() {
            let color = CSS_Standard.Color.WithDarkMode.Color(light: .hex("FF0000"))
            #expect(color.light.description == "#FF0000")
        }

        @Test("Color initializes with light and dark colors")
        func colorInitializesWithLightAndDarkColors() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            #expect(color.light.description == "#FF0000")
            #expect(color.dark.description == "#00FF00")
        }

        @Test("Color falls back to darker version when dark is omitted")
        func colorFallsBackToDarker() {
            let color = CSS_Standard.Color.WithDarkMode.Color(light: .hex("FF0000"))
            #expect(color.dark != color.light)
        }

        @Test("Color description includes media queries")
        func colorDescriptionIncludesMediaQueries() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            let description = color.description
            #expect(description.contains("@media (prefers-color-scheme: light)"))
            #expect(description.contains("#FF0000"))
            #expect(description.contains("@media (prefers-color-scheme: dark)"))
            #expect(description.contains("#00FF00"))
        }

        @Test("Color description includes dark mode even when not explicitly provided")
        func colorDescriptionIncludesDarkModeWhenNotExplicit() {
            let color = CSS_Standard.Color.WithDarkMode.Color(light: .hex("FF0000"), dark: nil)
            let description = color.description
            #expect(description.contains("@media (prefers-color-scheme: light)"))
            #expect(description.contains("#FF0000"))
            #expect(description.contains("@media (prefers-color-scheme: dark)"))
            // The dark mode color is automatically generated, so we just check it exists
            #expect(description.contains("rgb") || description.contains("#"))
        }

        @Test("Map transforms both light and dark colors")
        func mapTransformsBothColors() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            let transformed = color.map { _ in .hex("0000FF") }
            #expect(transformed.light.description == "#0000FF")
            #expect(transformed.dark.description == "#0000FF")
        }

        @Test("FlatMap transforms colors more complexly")
        func flatMapTransformsColorsComplexly() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            let transformed = color.flatMap { _ in
                CSS_Standard.Color.WithDarkMode.Color(
                    light: .hex("0000FF"),
                    dark: .hex("FF00FF")
                )
            }
            #expect(transformed.light.description == "#0000FF")
            #expect(transformed.dark.description == "#FF00FF")
        }

        @Test("AdjustBrightness changes color brightness")
        func adjustBrightnessChangesColorBrightness() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            let brightened = color.adjustBrightness(by: 0.2)
            #expect(brightened.light != color.light)
            #expect(brightened.dark != color.dark)
        }

        @Test("Darker makes colors darker")
        func darkerMakesColorsDarker() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            let darkened = color.darker(by: 0.3)
            #expect(darkened.light != color.light)
            #expect(darkened.dark != color.dark)
        }

        @Test("Lighter makes colors lighter")
        func lighterMakesColorsLighter() {
            let color = CSS_Standard.Color.WithDarkMode.Color(
                light: .hex("FF0000"),
                dark: .hex("00FF00")
            )
            let lightened = color.lighter(by: 0.3)
            #expect(lightened.light != color.light)
            #expect(lightened.dark != color.dark)
        }

        @Test("WithDarkMode global type works correctly")
        func withDarkModeGlobalTypeWorksCorrectly() {
            let global = CSS_Standard.Color.WithDarkMode.initial
            #expect(global.description == "initial")
        }

        @Test("WithDarkMode enum description passes through correct values")
        func withDarkModeEnumDescriptionPassesValues() {
            let colorCase = CSS_Standard.Color.WithDarkMode.color(
                .init(light: .hex("FF0000"), dark: .hex("00FF00"))
            )
            let globalCase = CSS_Standard.Color.WithDarkMode.inherit

            #expect(colorCase.description.contains("@media"))
            #expect(colorCase.description.contains("#FF0000"))
            #expect(globalCase.description == "inherit")
        }

        @Test("HTML color method with pseudo-class parameter")
        func htmlColorMethodWithPseudoClassParameter() {

            let test = HTML.Document {
                div {}
                    .color(.hex("FF0000"), pseudo: .hover)
            }

            let html = String(bytes: test.render(), encoding: .utf8)!
            #expect(html.contains(":hover"))
            #expect(html.contains("color:#FF0000"))

        }

        @Test("Color adjustBrightness method works for color case")
        func ColorAdjustBrightnessForColorCase() {
            let color = CSS_Standard.Color.color(.hex("FF0000"))
            let brightened = color.adjustBrightness(by: 0.2)

            #expect(brightened.description != color.description)
        }

        @Test("Color adjustBrightness method preserves global case")
        func ColorAdjustBrightnessPreservesGlobalCase() {
            let global = CSS_Standard.Color.inherit
            let adjusted = global.adjustBrightness(by: 0.2)

            #expect(adjusted.description == global.description)
            #expect(adjusted.description == "inherit")
        }

        @Test("HTML element renders with named color properly")
        func htmlElementWithNamedColorRendersCorrectly() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {}.color(.red)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:red}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("HTML color with Color renders properly")
        func htmlColorMethodWithColorWorks() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {}
                        .color(CSS_Standard.Color.color(.hex("FF0000")))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#FF0000}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("HTML element with light/dark colors renders properly")
        func htmlElementWithLightDarkColorsAppliesBoth() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {}
                        .css.color(light: .hex("FF0000"), dark: .hex("00FF00"))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#FF0000}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:#00FF00}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("HTML color with media query renders properly")
        func htmlColorMethodWithMediaQueryParameter() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {}
                        .color(.blue, media: .print)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .color-0{color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test("HTML element rendering with multiple properties in media query")
        func htmlElementRenderingWithMultiplePropertiesInMediaQuery() {
            assertInlineSnapshot(
                of: HTML.Document {
                    div {}
                        .backgroundColor(.blue, media: Media.screen && .maxWidth(.px(768)))
                        .color(.yellow, media: Media.screen && .maxWidth(.px(768)))
                        .padding(.px(20), media: Media.screen && .maxWidth(.px(768)))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen and (max-width: 768px){
                        .background-color-0{background-color:blue}
                        .color-1{color:yellow}
                        .padding-2{padding:20px}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 color-1 padding-2">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Suite("Dark Mode conveniences Tests")
        struct DarkModeConveniences {
            @Test("AccentColor with light/dark renders properly")
            func accentColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.accentColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .accent-color-0{accent-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .accent-color-1{accent-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="accent-color-0 accent-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("AccentColor with HTMLColor renders properly")
            func accentColorHTMLColorRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .accentColor(.red)
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .accent-color-0{accent-color:red}
                        </style>
                      </head>
                      <body>
                        <div class="accent-color-0">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BackgroundColor with light/dark renders properly")
            func backgroundColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.backgroundColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .background-color-0{background-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .background-color-1{background-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="background-color-0 background-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BackgroundColor with HTMLColor renders properly")
            func backgroundColorHTMLColorRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .backgroundColor(.yellow)
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .background-color-0{background-color:yellow}
                        </style>
                      </head>
                      <body>
                        <div class="background-color-0">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderBlockColor with light/dark renders properly")
            func borderBlockColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderBlockColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-block-color-0{border-block-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-block-color-1{border-block-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-block-color-0 border-block-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderBlockEndColor with light/dark renders properly")
            func borderBlockEndColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderBlockEndColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-block-end-color-0{border-block-end-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-block-end-color-1{border-block-end-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-block-end-color-0 border-block-end-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderBlockStartColor with light/dark renders properly")
            func borderBlockStartColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderBlockStartColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-block-start-color-0{border-block-start-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-block-start-color-1{border-block-start-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-block-start-color-0 border-block-start-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderBottomColor with light/dark renders properly")
            func borderBottomColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderBottomColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-bottom-color-0{border-bottom-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-bottom-color-1{border-bottom-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-bottom-color-0 border-bottom-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderColor with light/dark renders properly")
            func borderColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-color-0{border-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-color-1{border-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-color-0 border-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderInlineColor with light/dark renders properly")
            func borderInlineColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderInlineColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-inline-color-0{border-inline-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-inline-color-1{border-inline-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-inline-color-0 border-inline-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderInlineEndColor with light/dark renders properly")
            func borderInlineEndColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderInlineEndColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-inline-end-color-0{border-inline-end-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-inline-end-color-1{border-inline-end-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-inline-end-color-0 border-inline-end-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderInlineStartColor with light/dark renders properly")
            func borderInlineStartColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderInlineStartColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-inline-start-color-0{border-inline-start-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-inline-start-color-1{border-inline-start-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-inline-start-color-0 border-inline-start-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderLeftColor with light/dark renders properly")
            func borderLeftColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderLeftColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-left-color-0{border-left-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-left-color-1{border-left-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-left-color-0 border-left-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderRightColor with light/dark renders properly")
            func borderRightColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderRightColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-right-color-0{border-right-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-right-color-1{border-right-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-right-color-0 border-right-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("BorderTopColor with light/dark renders properly")
            func borderTopColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.borderTopColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .border-top-color-0{border-top-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .border-top-color-1{border-top-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="border-top-color-0 border-top-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("CaretColor with light/dark renders properly")
            func caretColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.caretColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .caret-color-0{caret-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .caret-color-1{caret-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="caret-color-0 caret-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("ColumnRuleColor with light/dark renders properly")
            func columnRuleColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.columnRuleColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .column-rule-color-0{column-rule-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .column-rule-color-1{column-rule-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="column-rule-color-0 column-rule-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("FloodColor with light/dark renders properly")
            func floodColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.floodColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .flood-color-0{flood-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .flood-color-1{flood-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="flood-color-0 flood-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("Fill with light/dark renders properly")
            func fillLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.fill(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .fill-0{fill:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .fill-1{fill:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="fill-0 fill-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("Fill with HTMLColor renders properly")
            func fillHTMLColorRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .fill(.red)
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .fill-0{fill:red}
                        </style>
                      </head>
                      <body>
                        <div class="fill-0">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("LightingColor with light/dark renders properly")
            func lightingColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.lightingColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .lighting-color-0{lighting-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .lighting-color-1{lighting-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="lighting-color-0 lighting-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("OutlineColor with light/dark renders properly")
            func outlineColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.outlineColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .outline-color-0{outline-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .outline-color-1{outline-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="outline-color-0 outline-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("StopColor with light/dark renders properly")
            func stopColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.stopColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .stop-color-0{stop-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .stop-color-1{stop-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="stop-color-0 stop-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("Stroke with light/dark renders properly")
            func strokeLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.stroke(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .stroke-0{stroke:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .stroke-1{stroke:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="stroke-0 stroke-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("TextDecorationColor with light/dark renders properly")
            func textDecorationColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.textDecorationColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .text-decoration-color-0{text-decoration-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .text-decoration-color-1{text-decoration-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="text-decoration-color-0 text-decoration-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("TextEmphasisColor with light/dark renders properly")
            func textEmphasisColorLightDarkRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.textEmphasisColor(light: .hex("FF0000"), dark: .hex("00FF00"))
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .text-emphasis-color-0{text-emphasis-color:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .text-emphasis-color-1{text-emphasis-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="text-emphasis-color-0 text-emphasis-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            // MARK: - Dark Mode Color Convenience Method Tests with Pseudo Classes

            @Test("Fill with pseudo class renders properly")
            func fillWithPseudoClassRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.fill(light: .hex("FF0000"), dark: .hex("00FF00"), pseudo: .hover)
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          .fill-0:hover{fill:#FF0000}
                          @media (prefers-color-scheme: dark){
                            .fill-1:hover{fill:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="fill-0 fill-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("Stroke with selector renders properly")
            func strokeWithSelectorRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.stroke(
                                light: .hex("FF0000"),
                                dark: .hex("00FF00"),
                                selector: "child:span"
                            )
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          child:span .stroke-0{stroke:#FF0000}
                          @media (prefers-color-scheme: dark){
                            child:span .stroke-1{stroke:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="stroke-0 stroke-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            @Test("OutlineColor with media query renders properly")
            func outlineColorWithMediaQueryRendersCorrectly() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .css.outlineColor(
                                light: .hex("FF0000"),
                                dark: .hex("00FF00"),
                                media: .print
                            )
                    },
                    as: .html
                ) {
                    """
                    <!doctype html>
                    <html>
                      <head>
                        <style>
                          @media print{
                            .outline-color-0{outline-color:#FF0000}
                          }
                          @media (prefers-color-scheme: dark) and print{
                            .outline-color-1{outline-color:#00FF00}
                          }
                        </style>
                      </head>
                      <body>
                        <div class="outline-color-0 outline-color-1">
                        </div>
                      </body>
                    </html>
                    """
                }
            }

            // MARK: - Dark Mode Color Convenience Method Tests with nil values

            @Test("Fill with nil HTMLColor renders nothing")
            func fillWithNilHTMLColorRendersNothing() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .fill(nil)
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

            @Test("TextDecorationColor with nil HTMLColor renders nothing")
            func textDecorationColorWithNilHTMLColorRendersNothing() {
                assertInlineSnapshot(
                    of: HTML.Document {
                        div {}
                            .textDecorationColor(nil)
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
    }  // end ColorTests
}  // end extension SnapshotTests

// MARK: - Dark Mode Color Convenience Method Tests

extension HTMLColor {
    static let test_red = HTMLColor(light: .red, dark: .red.darker(by: 0.2))
    static let test_yellow = HTMLColor(light: .yellow, dark: .yellow.darker(by: 0.2))
}
