//
//  Color Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import Dependencies
import Foundation
import HTML
import PointFreeHTMLTestSupport
import Testing

@Suite(
  "Color Tests",
  .snapshots(record: .missing)
)
struct ColorTests {
  @Test("General")
  func general1() {
    assertInlineSnapshot(
      of: HTMLDocument {
        ContentDivision {
          H1 { "Type-safe HTML" }
            .color(light: .named(.blue), dark: .named(.red))
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
      .font-size-t6pNK3{font-size:24px}
      .color-jiDhg4{color:blue}
      .margin-top-Fqw6a1{margin-top:10px}
      @media (prefers-color-scheme: dark){
        .color-hhm4d1{color:red}
      }

          </style>
        </head>
        <body>
      <div>
        <h1 class="font-size-t6pNK3 color-jiDhg4 color-hhm4d1">Type-safe HTML
        </h1>
        <p class="margin-top-Fqw6a1">With type-safe CSS!
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
      of: HTMLDocument {
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
      .color-ILzRW1{color:#cc3333}
      @media (prefers-color-scheme: dark){
        .color-CA97y2{color:rgb(163, 40, 40)}
      }

          </style>
        </head>
        <body>
      <p class="color-ILzRW1 color-CA97y2">Hello World
      </p>
        </body>
      </html>
      """
    }
  }

  @Test("Color initializes with standard color")
  func colorInitializesWithStandardColor() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(light: .hex("FF0000"))
    #expect(color.light.description == "#FF0000")
  }

  @Test("Color initializes with light and dark colors")
  func colorInitializesWithLightAndDarkColors() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
      light: .hex("FF0000"),
      dark: .hex("00FF00")
    )
    #expect(color.light.description == "#FF0000")
    #expect(color.dark.description == "#00FF00")
  }

  @Test("Color falls back to darker version when dark is omitted")
  func colorFallsBackToDarker() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(light: .hex("FF0000"))
    #expect(color.dark != color.light)
  }

  @Test("Color description includes media queries")
  func colorDescriptionIncludesMediaQueries() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
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
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(light: .hex("FF0000"), dark: nil)
    let description = color.description
    #expect(description.contains("@media (prefers-color-scheme: light)"))
    #expect(description.contains("#FF0000"))
    #expect(description.contains("@media (prefers-color-scheme: dark)"))
    // The dark mode color is automatically generated, so we just check it exists
    #expect(description.contains("rgb") || description.contains("#"))
  }

  @Test("Map transforms both light and dark colors")
  func mapTransformsBothColors() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
      light: .hex("FF0000"),
      dark: .hex("00FF00")
    )
    let transformed = color.map { _ in .hex("0000FF") }
    #expect(transformed.light.description == "#0000FF")
    #expect(transformed.dark.description == "#0000FF")
  }

  @Test("FlatMap transforms colors more complexly")
  func flatMapTransformsColorsComplexly() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
      light: .hex("FF0000"),
      dark: .hex("00FF00")
    )
    let transformed = color.flatMap { _ in
      CSSPropertyTypes.Color.WithDarkMode.Color(light: .hex("0000FF"), dark: .hex("FF00FF"))
    }
    #expect(transformed.light.description == "#0000FF")
    #expect(transformed.dark.description == "#FF00FF")
  }

  @Test("AdjustBrightness changes color brightness")
  func adjustBrightnessChangesColorBrightness() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
      light: .hex("FF0000"),
      dark: .hex("00FF00")
    )
    let brightened = color.adjustBrightness(by: 0.2)
    #expect(brightened.light != color.light)
    #expect(brightened.dark != color.dark)
  }

  @Test("Darker makes colors darker")
  func darkerMakesColorsDarker() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
      light: .hex("FF0000"),
      dark: .hex("00FF00")
    )
    let darkened = color.darker(by: 0.3)
    #expect(darkened.light != color.light)
    #expect(darkened.dark != color.dark)
  }

  @Test("Lighter makes colors lighter")
  func lighterMakesColorsLighter() {
    let color = CSSPropertyTypes.Color.WithDarkMode.Color(
      light: .hex("FF0000"),
      dark: .hex("00FF00")
    )
    let lightened = color.lighter(by: 0.3)
    #expect(lightened.light != color.light)
    #expect(lightened.dark != color.dark)
  }

  @Test("WithDarkMode global type works correctly")
  func withDarkModeGlobalTypeWorksCorrectly() {
    let global = CSSPropertyTypes.Color.WithDarkMode.initial
    #expect(global.description == "initial")
  }

  @Test("WithDarkMode enum description passes through correct values")
  func withDarkModeEnumDescriptionPassesValues() {
    let colorCase = CSSPropertyTypes.Color.WithDarkMode.color(
      .init(light: .hex("FF0000"), dark: .hex("00FF00"))
    )
    let globalCase = CSSPropertyTypes.Color.WithDarkMode.inherit

    #expect(colorCase.description.contains("@media"))
    #expect(colorCase.description.contains("#FF0000"))
    #expect(globalCase.description == "inherit")
  }

  @Test("HTML color method with pseudo-class parameter")
  func htmlColorMethodWithPseudoClassParameter() {

    let test = HTMLDocument {
      div {}
        .color(.hex("FF0000"), pseudo: .hover)
    }

    let html = String(bytes: test.render(), encoding: .utf8)!
    #expect(html.contains(":hover"))
    #expect(html.contains("color:#FF0000"))

  }

  @Test("Color adjustBrightness method works for color case")
  func ColorAdjustBrightnessForColorCase() {
    let color = CSSPropertyTypes.Color.color(.hex("FF0000"))
    let brightened = color.adjustBrightness(by: 0.2)

    #expect(brightened.description != color.description)
  }

  @Test("Color adjustBrightness method preserves global case")
  func ColorAdjustBrightnessPreservesGlobalCase() {
    let global = CSSPropertyTypes.Color.inherit
    let adjusted = global.adjustBrightness(by: 0.2)

    #expect(adjusted.description == global.description)
    #expect(adjusted.description == "inherit")
  }

  @Test("HTML element renders with named color properly")
  func htmlElementWithNamedColorRendersCorrectly() {
    assertInlineSnapshot(
      of: HTMLDocument {
        div {}.color(.red)
      },
      as: .html
    ) {
      """
      <!doctype html>
      <html>
        <head>
          <style>
      .color-ILzRW1{color:#cc3333}
      @media (prefers-color-scheme: dark){
        .color-CA97y2{color:rgb(163, 40, 40)}
      }

          </style>
        </head>
        <body>
      <div class="color-ILzRW1 color-CA97y2">
      </div>
        </body>
      </html>
      """
    }
  }

  @Test("HTML color with Color renders properly")
  func htmlColorMethodWithColorWorks() {
    assertInlineSnapshot(
      of: HTMLDocument {
        div {}
          .color(CSSPropertyTypes.Color.color(.hex("FF0000")))
      },
      as: .html
    ) {
      """
      <!doctype html>
      <html>
        <head>
          <style>
      .color-bQ3ZC1{color:#FF0000}

          </style>
        </head>
        <body>
      <div class="color-bQ3ZC1">
      </div>
        </body>
      </html>
      """
    }
  }

  @Test("HTML element with light/dark colors renders properly")
  func htmlElementWithLightDarkColorsAppliesBoth() {
    assertInlineSnapshot(
      of: HTMLDocument {
        div {}
          .color(light: .hex("FF0000"), dark: .hex("00FF00"))
      },
      as: .html
    ) {
      """
      <!doctype html>
      <html>
        <head>
          <style>
      .color-bQ3ZC1{color:#FF0000}
      @media (prefers-color-scheme: dark){
        .color-mvQv5{color:#00FF00}
      }

          </style>
        </head>
        <body>
      <div class="color-bQ3ZC1 color-mvQv5">
      </div>
        </body>
      </html>
      """
    }
  }

  @Test("HTML color with media query renders properly")
  func htmlColorMethodWithMediaQueryParameter() {
    assertInlineSnapshot(
      of: HTMLDocument {
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
        .color-oD7XM1{color:blue}
      }

          </style>
        </head>
        <body>
      <div class="color-oD7XM1">
      </div>
        </body>
      </html>
      """
    }
  }

  @Test("HTML element rendering with multiple properties in media query")
  func htmlElementRenderingWithMultiplePropertiesInMediaQuery() {
    assertInlineSnapshot(
      of: HTMLDocument {
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
        .padding-JBzfL{padding:20px}
        .color-KNOs04{color:#cccc33}
        .background-color-eGELe4{background-color:blue}
      }
      @media (prefers-color-scheme: dark) and screen and (max-width: 768px){
        .color-Ih6hb3{color:rgb(163, 163, 40)}
      }

          </style>
        </head>
        <body>
      <div class="padding-JBzfL color-KNOs04 color-Ih6hb3 background-color-eGELe4">
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
        of: HTMLDocument {
          div {}
            .accentColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .accent-color-bQ3ZC1{accent-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .accent-color-mvQv5{accent-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="accent-color-bQ3ZC1 accent-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("AccentColor with HTMLColor renders properly")
    func accentColorHTMLColorRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
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
        .accent-color-ILzRW1{accent-color:#cc3333}
        @media (prefers-color-scheme: dark){
          .accent-color-CA97y2{accent-color:rgb(163, 40, 40)}
        }

            </style>
          </head>
          <body>
        <div class="accent-color-ILzRW1 accent-color-CA97y2">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BackgroundColor with light/dark renders properly")
    func backgroundColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .backgroundColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .background-color-bQ3ZC1{background-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .background-color-mvQv5{background-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="background-color-bQ3ZC1 background-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BackgroundColor with HTMLColor renders properly")
    func backgroundColorHTMLColorRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
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
        .background-color-mIOKK3{background-color:#cccc33}
        @media (prefers-color-scheme: dark){
          .background-color-P2tkR3{background-color:rgb(163, 163, 40)}
        }

            </style>
          </head>
          <body>
        <div class="background-color-mIOKK3 background-color-P2tkR3">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderBlockColor with light/dark renders properly")
    func borderBlockColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderBlockColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-block-color-bQ3ZC1{border-block-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-block-color-mvQv5{border-block-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-block-color-bQ3ZC1 border-block-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderBlockEndColor with light/dark renders properly")
    func borderBlockEndColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderBlockEndColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-block-end-color-bQ3ZC1{border-block-end-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-block-end-color-mvQv5{border-block-end-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-block-end-color-bQ3ZC1 border-block-end-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderBlockStartColor with light/dark renders properly")
    func borderBlockStartColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderBlockStartColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-block-start-color-bQ3ZC1{border-block-start-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-block-start-color-mvQv5{border-block-start-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-block-start-color-bQ3ZC1 border-block-start-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderBottomColor with light/dark renders properly")
    func borderBottomColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderBottomColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-bottom-color-bQ3ZC1{border-bottom-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-bottom-color-mvQv5{border-bottom-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-bottom-color-bQ3ZC1 border-bottom-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderColor with light/dark renders properly")
    func borderColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-color-bQ3ZC1{border-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-color-mvQv5{border-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-color-bQ3ZC1 border-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderInlineColor with light/dark renders properly")
    func borderInlineColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderInlineColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-inline-color-bQ3ZC1{border-inline-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-inline-color-mvQv5{border-inline-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-inline-color-bQ3ZC1 border-inline-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderInlineEndColor with light/dark renders properly")
    func borderInlineEndColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderInlineEndColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-inline-end-color-bQ3ZC1{border-inline-end-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-inline-end-color-mvQv5{border-inline-end-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-inline-end-color-bQ3ZC1 border-inline-end-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderInlineStartColor with light/dark renders properly")
    func borderInlineStartColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderInlineStartColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-inline-start-color-bQ3ZC1{border-inline-start-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-inline-start-color-mvQv5{border-inline-start-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-inline-start-color-bQ3ZC1 border-inline-start-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderLeftColor with light/dark renders properly")
    func borderLeftColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderLeftColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-left-color-bQ3ZC1{border-left-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-left-color-mvQv5{border-left-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-left-color-bQ3ZC1 border-left-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderRightColor with light/dark renders properly")
    func borderRightColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderRightColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-right-color-bQ3ZC1{border-right-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-right-color-mvQv5{border-right-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-right-color-bQ3ZC1 border-right-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("BorderTopColor with light/dark renders properly")
    func borderTopColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .borderTopColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .border-top-color-bQ3ZC1{border-top-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .border-top-color-mvQv5{border-top-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="border-top-color-bQ3ZC1 border-top-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("CaretColor with light/dark renders properly")
    func caretColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .caretColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .caret-color-bQ3ZC1{caret-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .caret-color-mvQv5{caret-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="caret-color-bQ3ZC1 caret-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("ColumnRuleColor with light/dark renders properly")
    func columnRuleColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .columnRuleColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .column-rule-color-bQ3ZC1{column-rule-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .column-rule-color-mvQv5{column-rule-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="column-rule-color-bQ3ZC1 column-rule-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("FloodColor with light/dark renders properly")
    func floodColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .floodColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .flood-color-bQ3ZC1{flood-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .flood-color-mvQv5{flood-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="flood-color-bQ3ZC1 flood-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("Fill with light/dark renders properly")
    func fillLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .fill(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .fill-bQ3ZC1{fill:#FF0000}
        @media (prefers-color-scheme: dark){
          .fill-mvQv5{fill:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="fill-bQ3ZC1 fill-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("Fill with HTMLColor renders properly")
    func fillHTMLColorRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
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
        .fill-ILzRW1{fill:#cc3333}
        @media (prefers-color-scheme: dark){
          .fill-CA97y2{fill:rgb(163, 40, 40)}
        }

            </style>
          </head>
          <body>
        <div class="fill-ILzRW1 fill-CA97y2">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("LightingColor with light/dark renders properly")
    func lightingColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .lightingColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .lighting-color-bQ3ZC1{lighting-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .lighting-color-mvQv5{lighting-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="lighting-color-bQ3ZC1 lighting-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("OutlineColor with light/dark renders properly")
    func outlineColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .outlineColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .outline-color-bQ3ZC1{outline-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .outline-color-mvQv5{outline-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="outline-color-bQ3ZC1 outline-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("StopColor with light/dark renders properly")
    func stopColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .stopColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .stop-color-bQ3ZC1{stop-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .stop-color-mvQv5{stop-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="stop-color-bQ3ZC1 stop-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("Stroke with light/dark renders properly")
    func strokeLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .stroke(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .stroke-bQ3ZC1{stroke:#FF0000}
        @media (prefers-color-scheme: dark){
          .stroke-mvQv5{stroke:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="stroke-bQ3ZC1 stroke-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("TextDecorationColor with light/dark renders properly")
    func textDecorationColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .textDecorationColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .text-decoration-color-bQ3ZC1{text-decoration-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .text-decoration-color-mvQv5{text-decoration-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="text-decoration-color-bQ3ZC1 text-decoration-color-mvQv5">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("TextEmphasisColor with light/dark renders properly")
    func textEmphasisColorLightDarkRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .textEmphasisColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .text-emphasis-color-bQ3ZC1{text-emphasis-color:#FF0000}
        @media (prefers-color-scheme: dark){
          .text-emphasis-color-mvQv5{text-emphasis-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="text-emphasis-color-bQ3ZC1 text-emphasis-color-mvQv5">
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
        of: HTMLDocument {
          div {}
            .fill(light: .hex("FF0000"), dark: .hex("00FF00"), pseudo: .hover)
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .fill-egMjx3:hover{fill:#FF0000}
        @media (prefers-color-scheme: dark){
          .fill-NiFSX3:hover{fill:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="fill-egMjx3 fill-NiFSX3">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("Stroke with selector renders properly")
    func strokeWithSelectorRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .stroke(light: .hex("FF0000"), dark: .hex("00FF00"), selector: "child:span")
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        child:span .stroke-EfSja1{stroke:#FF0000}
        @media (prefers-color-scheme: dark){
          child:span .stroke-OTUZ23{stroke:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="stroke-EfSja1 stroke-OTUZ23">
        </div>
          </body>
        </html>
        """
      }
    }

    @Test("OutlineColor with media query renders properly")
    func outlineColorWithMediaQueryRendersCorrectly() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .outlineColor(light: .hex("FF0000"), dark: .hex("00FF00"), media: .print)
        },
        as: .html
      ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        @media print{
          .outline-color-SXYRf2{outline-color:#FF0000}
        }
        @media (prefers-color-scheme: dark) and print{
          .outline-color-5vbC71{outline-color:#00FF00}
        }

            </style>
          </head>
          <body>
        <div class="outline-color-SXYRf2 outline-color-5vbC71">
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
        of: HTMLDocument {
          div {}
            .fill(nil)
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

    @Test("TextDecorationColor with nil HTMLColor renders nothing")
    func textDecorationColorWithNilHTMLColorRendersNothing() {
      assertInlineSnapshot(
        of: HTMLDocument {
          div {}
            .textDecorationColor(nil)
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
}

// MARK: - Dark Mode Color Convenience Method Tests

extension HTMLColor {
  static let red = HTMLColor(light: .red, dark: .red.darker(by: 0.2))
  static let yellow = HTMLColor(light: .yellow, dark: .yellow.darker(by: 0.2))
}
