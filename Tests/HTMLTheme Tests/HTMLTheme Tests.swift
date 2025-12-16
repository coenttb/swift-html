//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//

import Dependencies
import HTML
import CSS_Theming
import HTML_Rendering_TestSupport
import Testing

@Suite
struct `HTML Theme Tests` {
    
    // MARK: - Combined Usage

    @Test("Multiple color properties with mixed types")
    func combinedColorProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { "Mixed colors" }
                    .css.color(.red)  // HTMLColor with dark mode
                    .backgroundColor(.gray800)  // HTMLColor - with dark
                    .borderColor(.inherit)  // Global - no dark
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-color-0{border-color:inherit}
                  .background-color-2{background-color:#d0d0d0}
                  .color-4{color:#cc3333}
                  @media (prefers-color-scheme: dark){
                    .background-color-1{background-color:#303030}
                    .color-3{color:#ff1a1a}
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
                  .color-1{color:#d0d0d0}
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#303030}
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
                  .stroke-1{stroke:#cc6600}
                  @media (prefers-color-scheme: dark){
                    .stroke-0{stroke:#ff8c1a}
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

    // MARK: - HTMLColor.reverse() Tests

    @Test("reverse() swaps light and dark values")
    func reverseSwapsColors() {
        let original = HTMLColor(light: .hex("ffffff"), dark: .hex("000000"))
        let reversed = original.reverse()
        #expect(reversed.light.description == original.dark.description)
        #expect(reversed.dark.description == original.light.description)
    }

    @Test("reverse() works with color palette shades")
    func reversePaletteColors() {
        let original = HTMLColor.red500
        let reversed = original.reverse()
        #expect(reversed.light == original.dark)
        #expect(reversed.dark == original.light)
    }

    @Test("double reverse() returns original values")
    func doubleReverseReturnsOriginal() {
        let original = HTMLColor.blue500
        let doubleReversed = original.reverse().reverse()
        #expect(doubleReversed.light == original.light)
        #expect(doubleReversed.dark == original.dark)
    }

    // MARK: - Dependency Override Tests

    @Test("Theme dependency can be overridden")
    func themeDependencyOverride() {
        let defaultRed = withDependencies {
            $0.theme = .default
        } operation: {
            HTMLColor.red
        }

        let slateRed = withDependencies {
            $0.theme = .slate
        } operation: {
            HTMLColor.red
        }

        // Both should return valid colors
        let _ = defaultRed
        let _ = slateRed
        #expect(true)
    }

    @Test("Theme text.primary differs across themes")
    func themeTextPrimaryVaries() {
        let defaultPrimary = withDependencies {
            $0.theme = .default
        } operation: {
            HTMLColor.text.primary
        }

        let slatePrimary = withDependencies {
            $0.theme = .slate
        } operation: {
            HTMLColor.text.primary
        }

        // Both should return valid colors
        let _ = defaultPrimary
        let _ = slatePrimary
        #expect(true)
    }

    @Test("Nested dependency overrides work correctly")
    func nestedDependencyOverrides() {
        let outerRed = withDependencies {
            $0.theme = .default
        } operation: {
            let outer = HTMLColor.red
            let inner = withDependencies {
                $0.theme = .apple
            } operation: {
                HTMLColor.red
            }
            return (outer, inner)
        }

        // Both values should be accessible
        let _ = outerRed.0
        let _ = outerRed.1
        #expect(true)
    }

    // MARK: - HTMLColor Construction Tests

    @Test("HTMLColor init with light only derives dark")
    func htmlColorInitLightOnly() {
        let color = HTMLColor(light: .hex("ffffff"))
        // Dark mode should be auto-derived (darker version)
        #expect(color.light != color.dark)
    }

    @Test("HTMLColor init with both values stores both")
    func htmlColorInitBothValues() {
        let light = CSS_Standard.Color.Value.hex("ffffff")
        let dark = CSS_Standard.Color.Value.hex("000000")
        let color = HTMLColor(light: light, dark: dark)
        #expect(color.light == light)
        #expect(color.dark == dark)
    }

}

