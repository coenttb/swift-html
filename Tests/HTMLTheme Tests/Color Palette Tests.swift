//
//  Color Palette Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//

import Dependencies
import HTML
import HTMLTheme
import HTML_Renderable_TestSupport
import Testing

@Suite("Color Palette")
struct ColorPaletteTests {

    // MARK: - Dark Mode Variants

    @Test("Gray shades have distinct dark mode variants", arguments: [
        ("gray100", HTMLColor.gray100),
        ("gray500", HTMLColor.gray500),
        ("gray900", HTMLColor.gray900)
    ])
    func grayShadesDarkMode(name: String, color: HTMLColor) {
        #expect(color.light != color.dark, "Gray shade \(name) should have different light and dark values")
    }

    @Test("Blue shades have distinct dark mode variants", arguments: [
        ("blue100", HTMLColor.blue100),
        ("blue500", HTMLColor.blue500),
        ("blue900", HTMLColor.blue900)
    ])
    func blueShadesDarkMode(name: String, color: HTMLColor) {
        #expect(color.light != color.dark, "Blue shade \(name) should have different light and dark values")
    }

    @Test("Red shades have distinct dark mode variants", arguments: [
        ("red100", HTMLColor.red100),
        ("red500", HTMLColor.red500),
        ("red900", HTMLColor.red900)
    ])
    func redShadesDarkMode(name: String, color: HTMLColor) {
        #expect(color.light != color.dark, "Red shade \(name) should have different light and dark values")
    }

    @Test("Green shades have distinct dark mode variants", arguments: [
        ("green100", HTMLColor.green100),
        ("green500", HTMLColor.green500),
        ("green900", HTMLColor.green900)
    ])
    func greenShadesDarkMode(name: String, color: HTMLColor) {
        #expect(color.light != color.dark, "Green shade \(name) should have different light and dark values")
    }

    // MARK: - Reverse Method

    @Test("reverse() swaps light and dark values")
    func reverseSwapsColors() {
        let original = HTMLColor.red500
        let reversed = original.reverse()
        #expect(reversed.light == original.dark)
        #expect(reversed.dark == original.light)
    }

    @Test("reverse() is self-inverse")
    func reverseIsSelfInverse() {
        let original = HTMLColor.blue500
        let doubleReversed = original.reverse().reverse()
        #expect(doubleReversed.light == original.light)
        #expect(doubleReversed.dark == original.dark)
    }

    // MARK: - Cyan and Teal Aliases

    @Test("Cyan aliases to Teal")
    func cyanAliasesToTeal() {
        #expect(HTMLColor.cyan100.light == HTMLColor.teal100.light)
        #expect(HTMLColor.cyan100.dark == HTMLColor.teal100.dark)
        #expect(HTMLColor.cyan500.light == HTMLColor.teal500.light)
        #expect(HTMLColor.cyan500.dark == HTMLColor.teal500.dark)
        #expect(HTMLColor.cyan900.light == HTMLColor.teal900.light)
        #expect(HTMLColor.cyan900.dark == HTMLColor.teal900.dark)
    }

    // MARK: - Special Colors

    @Test("Transparent has same light and dark values")
    func transparentIsSingleColor() {
        #expect(HTMLColor.transparent.light == HTMLColor.transparent.dark)
    }

    @Test("Card and button backgrounds have distinct dark mode variants")
    func specialBackgrounds() {
        #expect(HTMLColor.cardBackground.light != HTMLColor.cardBackground.dark)
        #expect(HTMLColor.buttonBackground.light != HTMLColor.buttonBackground.dark)
    }

    @Test("buttonBackground equals cardBackground")
    func buttonBackgroundEqualsCardBackground() {
        #expect(HTMLColor.buttonBackground.light == HTMLColor.cardBackground.light)
        #expect(HTMLColor.buttonBackground.dark == HTMLColor.cardBackground.dark)
    }

    // MARK: - Snapshot Tests

    @Test("Gray500 renders with dark mode")
    func gray500Snapshot() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { "Gray" }
                    .css.backgroundColor(.gray500)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .background-color-1{background-color:#888888}
                  @media (prefers-color-scheme: dark){
                    .background-color-0{background-color:#707070}
                  }
                </style>
              </head>
              <body>
                <div class="background-color-0 background-color-1">Gray
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Blue500 renders with dark mode")
    func blue500Snapshot() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { "Blue" }
                    .css.color(.blue500)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-1{color:#3399ff}
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#004477}
                  }
                </style>
              </head>
              <body>
                <div class="color-0 color-1">Blue
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Red500 renders with dark mode")
    func red500Snapshot() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { "Red" }
                    .css.borderColor(.red500)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-color-1{border-color:#cc3333}
                  @media (prefers-color-scheme: dark){
                    .border-color-0{border-color:#ff1a1a}
                  }
                </style>
              </head>
              <body>
                <div class="border-color-0 border-color-1">Red
                </div>
              </body>
            </html>
            """
        }
    }
}
