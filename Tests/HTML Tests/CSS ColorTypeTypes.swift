//
//  Color Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import Dependencies
import HTML
import HTML_Rendering_TestSupport
import Testing

@Suite(
    "CSS Color Tests",
    .snapshots(record: nil)
)
struct CSSColorTests {
    @Test("Color opacity method works correctly")
    func testOpacityMethod() {
        let red = CSS_Standard.Color.rgb(255, 0, 0)
        let transparentRed = red.opacity(0.5)
        #expect(transparentRed.description == "rgba(255, 0, 0, 0.5)")

        let green = CSS_Standard.Color.named(.green)
        let transparentGreen = green.opacity(0.25)
        #expect(transparentGreen.description == "rgba(0, 128, 0, 0.25)")

        let blueHex = CSS_Standard.Color.hex(HexColor("#0000ff"))
        let transparentBlueHex = blueHex.opacity(0.75)
        #expect(transparentBlueHex.description == "rgba(0, 0, 255, 0.75)")

        // Test that opacity is clamped to 0-1 range
        let clampedOpacity = red.opacity(1.5)
        #expect(clampedOpacity.description == "rgba(255, 0, 0, 1)")
    }

    @Test("Color brightness adjustment methods work correctly")
    func testBrightnessAdjustment() {
        // Test RGB adjustment
        let red = CSS_Standard.Color.rgb(255, 0, 0)
        let darkerRed = red.darker(by: 0.5)
        #expect(darkerRed.description == "rgb(127, 0, 0)")

        let lighterRed = red.lighter(by: 0.2)
        #expect(lighterRed.description == "rgb(255, 51, 51)")

        // Test RGBA adjustment preserves alpha
        let transparentBlue = CSS_Standard.Color.rgba(0, 0, 255, 0.5)
        let darkerTransparentBlue = transparentBlue.darker(by: 0.2)
        #expect(darkerTransparentBlue.description == "rgba(0, 0, 204, 0.5)")

        // Test HSL adjustment affects lightness
        let green = CSS_Standard.Color.hsl(.deg(120), 100, 50)
        let darkerGreen = green.darker(by: 0.4)
        #expect(darkerGreen.description == "hsl(120deg, 100%, 30%)")

        let lighterGreen = green.lighter(by: 0.6)
        #expect(lighterGreen.description == "hsl(120deg, 100%, 80%)")

        // Test named color adjustment
        let yellow = CSS_Standard.Color.named(.yellow)
        let darkerYellow = yellow.darker(by: 0.3)
        #expect(darkerYellow.description == "rgb(178, 178, 0)")

        // Test hex color adjustment
        let hex = CSS_Standard.Color.hex(HexColor("#00FF00"))
        let darkerHex = hex.darker(by: 0.25)
        #expect(darkerHex.description == "rgb(0, 191, 0)")

        // Test adjustBrightness directly
        let purple = CSS_Standard.Color.rgb(128, 0, 128)
        let adjustedPurple = purple.adjustBrightness(by: -0.5)
        #expect(adjustedPurple.description == "rgb(64, 0, 64)")

        // Test boundary clamp
        let white = CSS_Standard.Color.rgb(255, 255, 255)
        let stillWhite = white.lighter(by: 0.5)
        #expect(stillWhite.description == "rgb(255, 255, 255)")

        let black = CSS_Standard.Color.rgb(0, 0, 0)
        let stillBlack = black.darker(by: 0.8)
        #expect(stillBlack.description == "rgb(0, 0, 0)")
    }
}
