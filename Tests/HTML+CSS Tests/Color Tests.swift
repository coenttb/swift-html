//
//  Color Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import Foundation
import Testing
import HTML_CSS
import PointFreeHTML
import Properties
import Types
import Dependencies
import DependenciesTestSupport
import InlineSnapshotTesting

@Suite(
    "Color Tests"
)
struct ColorTests {
    @Test("Color initializes with standard color")
    func colorInitializesWithStandardColor() {
        div()
            .color(.red)
        
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"))
        #expect(color.light.description == "#FF0000")
    }
    
    @Test("Color initializes with light and dark colors")
    func colorInitializesWithLightAndDarkColors() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        #expect(color.light.description == "#FF0000")
        #expect(color.dark.description == "#00FF00")
    }
    
    @Test("Color falls back to darker version when dark is omitted")
    func colorFallsBackToDarker() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"))
        #expect(color.dark != color.light)
    }
    
    @Test("Color description includes media queries")
    func colorDescriptionIncludesMediaQueries() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        let description = color.description
        #expect(description.contains("@media (prefers-color-scheme: light)"))
        #expect(description.contains("#FF0000"))
        #expect(description.contains("@media (prefers-color-scheme: dark)"))
        #expect(description.contains("#00FF00"))
    }
    
    @Test("Color description includes dark mode even when not explicitly provided")
    func colorDescriptionIncludesDarkModeWhenNotExplicit() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: nil)
        let description = color.description
        #expect(description.contains("@media (prefers-color-scheme: light)"))
        #expect(description.contains("#FF0000"))
        #expect(description.contains("@media (prefers-color-scheme: dark)"))
        // The dark mode color is automatically generated, so we just check it exists
        #expect(description.contains("rgb") || description.contains("#"))
    }
    
    @Test("Map transforms both light and dark colors")
    func mapTransformsBothColors() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        let transformed = color.map { _ in .hex("0000FF") }
        #expect(transformed.light.description == "#0000FF")
        #expect(transformed.dark.description == "#0000FF")
    }
    
    @Test("FlatMap transforms colors more complexly")
    func flatMapTransformsColorsComplexly() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        let transformed = color.flatMap { _ in 
            Properties.ColorProperty.WithDarkMode.Color(light: .hex("0000FF"), dark: .hex("FF00FF"))
        }
        #expect(transformed.light.description == "#0000FF")
        #expect(transformed.dark.description == "#FF00FF")
    }
    
    @Test("AdjustBrightness changes color brightness")
    func adjustBrightnessChangesColorBrightness() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        let brightened = color.adjustBrightness(by: 0.2)
        #expect(brightened.light != color.light)
        #expect(brightened.dark != color.dark)
    }
    
    @Test("Darker makes colors darker")
    func darkerMakesColorsDarker() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        let darkened = color.darker(by: 0.3)
        #expect(darkened.light != color.light)
        #expect(darkened.dark != color.dark)
    }
    
    @Test("Lighter makes colors lighter")
    func lighterMakesColorsLighter() {
        let color = Properties.ColorProperty.WithDarkMode.Color(light: .hex("FF0000"), dark: .hex("00FF00"))
        let lightened = color.lighter(by: 0.3)
        #expect(lightened.light != color.light)
        #expect(lightened.dark != color.dark)
    }
    
    @Test("WithDarkMode global type works correctly")
    func withDarkModeGlobalTypeWorksCorrectly() {
        let global = Properties.ColorProperty.WithDarkMode.initial
        #expect(global.description == "initial")
    }
    
    @Test("WithDarkMode enum description passes through correct values")
    func withDarkModeEnumDescriptionPassesValues() {
        let colorCase = Properties.ColorProperty.WithDarkMode.color(.init(light: .hex("FF0000"), dark: .hex("00FF00")))
        let globalCase = Properties.ColorProperty.WithDarkMode.inherit
        
        #expect(colorCase.description.contains("@media"))
        #expect(colorCase.description.contains("#FF0000"))
        #expect(globalCase.description == "inherit")
    }
    
    @Test("HTML color method with pseudo-class parameter")
    func htmlColorMethodWithPseudoClassParameter() {
        struct Test: HTMLDocument {
            var head: some HTML { HTMLEmpty() }
            var body: some HTML {
                div()
                    .color(.hex("FF0000"), pseudo: .hover)
            }
        }
        
        let html = String.init(bytes: Test().render(), encoding: .utf8)!
        #expect(html.contains(":hover"))
        #expect(html.contains("color:#FF0000"))
        
        
    }
    
    @Test("ColorProperty adjustBrightness method works for color case")
    func colorPropertyAdjustBrightnessForColorCase() {
        let color = Properties.ColorProperty.color(.hex("FF0000"))
        let brightened = color.adjustBrightness(by: 0.2)
        
        #expect(brightened.description != color.description)
    }
    
    @Test("ColorProperty adjustBrightness method preserves global case")
    func colorPropertyAdjustBrightnessPreservesGlobalCase() {
        let global = Properties.ColorProperty.inherit
        let adjusted = global.adjustBrightness(by: 0.2)
        
        #expect(adjusted.description == global.description)
        #expect(adjusted.description == "inherit")
    }
    
    @Test("HTML element renders with named color properly")
    func htmlElementWithNamedColorRendersCorrectly() {
        assertInlineSnapshot(
            of: div().color(.red),
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .color-dMYaj4{color:red}

                </style>
              </head>
              <body>
            <div class="color-dMYaj4">
            </div>
              </body>
            </html>
            """
        }
    }
    
    @Test("HTML color with ColorProperty renders properly")
    func htmlColorMethodWithColorPropertyWorks() {
        assertInlineSnapshot(
            of: div().color(Properties.ColorProperty.color(.hex("FF0000"))),
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
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
            of: div().color(light: .hex("FF0000"), dark: .hex("00FF00")),
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .color-af5sv1{color:@media (prefers-color-scheme: light) { #FF0000 } @media (prefers-color-scheme: dark) { #00FF00 }}

                </style>
              </head>
              <body>
            <div class="color-af5sv1">
            </div>
              </body>
            </html>
            """
        }
    }
    
    @Test("HTML color with media query renders properly")
    func htmlColorMethodWithMediaQueryParameter() {
        assertInlineSnapshot(
            of: div().color(.hex("FF0000"), media: .print),
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            @media print{
              .color-lcCen3{color:#FF0000}
            }

                </style>
              </head>
              <body>
            <div class="color-lcCen3">
            </div>
              </body>
            </html>
            """
        }
    }
}
