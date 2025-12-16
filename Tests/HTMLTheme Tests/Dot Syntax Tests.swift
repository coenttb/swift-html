//
//  Dot Syntax Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//

import Dependencies
import HTML
import CSS_Theming
import Testing

/// Compilation verification tests for dot syntax.
/// If these tests compile, the API surface is correct.
/// IMPORTANT: These tests use `.color(.text.primary)` NOT `.color(HTMLColor.text.primary)`
/// to verify that the compiler can infer the type from context.
@Suite("Dot Syntax Compilation")
struct DotSyntaxTests {

    @Test("Named color shades compile with dot syntax - inferred type")
    func namedColorShades() {
        let _ = div {}
            .css
            .color(.red500)
            .backgroundColor(.gray100)
            .borderColor(.blue900)
        #expect(true)
    }

    @Test("All color families compile with inferred dot syntax")
    func allColorFamilies() {
        let _ = div {}.css.color(.gray500)
        let _ = div {}.css.color(.blue500)
        let _ = div {}.css.color(.red500)
        let _ = div {}.css.color(.green500)
        let _ = div {}.css.color(.yellow500)
        let _ = div {}.css.color(.orange500)
        let _ = div {}.css.color(.purple500)
        let _ = div {}.css.color(.pink500)
        let _ = div {}.css.color(.teal500)
        let _ = div {}.css.color(.cyan500)
        let _ = div {}.css.color(.brown500)
        #expect(true)
    }

    @Test("Theme semantic colors compile with inferred dot syntax")
    func themeSemanticColors() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}
                .css
                .color(.text.primary)
                .backgroundColor(.background.secondary)
                .borderColor(.border.primary)
            #expect(true)
        }
    }

    @Test("Color methods chain correctly")
    func colorMethodsChain() {
        let _ = HTMLColor.red500.reverse()
        let original = HTMLColor.red500
        let reversed = original.reverse()
        #expect(reversed.light == original.dark)
        #expect(reversed.dark == original.light)
    }

    @Test("Theme dependency access compiles with inferred type")
    func themeDependencyAccess() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}.css.color(.theme.red)
            let _ = div {}.css.color(.red)
            let _ = div {}.css.color(.text.primary)
            let _ = div {}.css.backgroundColor(.background.secondary)
            let _ = div {}.css.borderColor(.border.primary)
            let _ = div {}.css.color(.branding.primary)
            #expect(true)
        }
    }

    @Test("Special colors compile with inferred type")
    func specialColors() {
        let _ = div {}.css.backgroundColor(.transparent)
        let _ = div {}.css.backgroundColor(.cardBackground)
        let _ = div {}.css.backgroundColor(.buttonBackground)
        #expect(true)
    }

    @Test("Theme-dependent colors compile with inferred type")
    func themeDependentColors() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}.css.color(.gray)
            let _ = div {}.css.color(.black)
            let _ = div {}.css.color(.offBlack)
            let _ = div {}.css.color(.white)
            let _ = div {}.css.color(.offWhite)
            let _ = div {}.css.color(.cyan)
            let _ = div {}.css.color(.teal)
            let _ = div {}.css.color(.pink)
            let _ = div {}.css.color(.brown)
            let _ = div {}.css.color(.orange)
            let _ = div {}.css.color(.green)
            let _ = div {}.css.color(.purple)
            let _ = div {}.css.color(.blue)
            let _ = div {}.css.color(.red)
            let _ = div {}.css.color(.yellow)
            let _ = div {}.css.color(.neutral)
            let _ = div {}.css.color(.info)
            #expect(true)
        }
    }

    @Test("Nested text theme types compile with inferred type")
    func nestedTextThemeTypes() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}.css.color(.text.primary)
            let _ = div {}.css.color(.text.secondary)
            let _ = div {}.css.color(.text.tertiary)
            let _ = div {}.css.color(.text.link)
            let _ = div {}.css.color(.text.linkHover)
            let _ = div {}.css.color(.text.button)
            let _ = div {}.css.color(.text.error)
            let _ = div {}.css.color(.text.success)
            let _ = div {}.css.color(.text.warning)
            let _ = div {}.css.color(.text.info)
            let _ = div {}.css.color(.text.neutral)
            let _ = div {}.css.color(.text.inverted)
            let _ = div {}.css.color(.text.disabled)
            #expect(true)
        }
    }

    @Test("Nested background theme types compile with inferred type")
    func nestedBackgroundThemeTypes() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}.css.backgroundColor(.background.primary)
            let _ = div {}.css.backgroundColor(.background.secondary)
            let _ = div {}.css.backgroundColor(.background.tertiary)
            let _ = div {}.css.backgroundColor(.background.elevated)
            let _ = div {}.css.backgroundColor(.background.grouped)
            let _ = div {}.css.backgroundColor(.background.selected)
            let _ = div {}.css.backgroundColor(.background.highlighted)
            let _ = div {}.css.backgroundColor(.background.button)
            let _ = div {}.css.backgroundColor(.background.buttonHover)
            let _ = div {}.css.backgroundColor(.background.error)
            let _ = div {}.css.backgroundColor(.background.errorMuted)
            let _ = div {}.css.backgroundColor(.background.success)
            let _ = div {}.css.backgroundColor(.background.successMuted)
            let _ = div {}.css.backgroundColor(.background.warning)
            let _ = div {}.css.backgroundColor(.background.warningMuted)
            let _ = div {}.css.backgroundColor(.background.info)
            let _ = div {}.css.backgroundColor(.background.infoMuted)
            let _ = div {}.css.backgroundColor(.background.neutral)
            #expect(true)
        }
    }

    @Test("Nested border theme types compile with inferred type")
    func nestedBorderThemeTypes() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}.css.borderColor(.border.primary)
            let _ = div {}.css.borderColor(.border.secondary)
            let _ = div {}.css.borderColor(.border.tertiary)
            let _ = div {}.css.borderColor(.border.selected)
            let _ = div {}.css.borderColor(.border.highlighted)
            let _ = div {}.css.borderColor(.border.hover)
            let _ = div {}.css.borderColor(.border.button)
            let _ = div {}.css.borderColor(.border.error)
            let _ = div {}.css.borderColor(.border.success)
            let _ = div {}.css.borderColor(.border.warning)
            let _ = div {}.css.borderColor(.border.info)
            let _ = div {}.css.borderColor(.border.infoMuted)
            let _ = div {}.css.borderColor(.border.neutral)
            #expect(true)
        }
    }

    @Test("Nested branding theme types compile with inferred type")
    func nestedBrandingThemeTypes() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}.css.color(.branding.primary)
            let _ = div {}.css.color(.branding.secondary)
            let _ = div {}.css.color(.branding.accent)
            let _ = div {}.css.color(.branding.primarySubtle)
            let _ = div {}.css.color(.branding.secondarySubtle)
            #expect(true)
        }
    }

    @Test("Chained styling with inferred types compiles")
    func chainedStylingInferredTypes() {
        withDependencies {
            $0.theme = .default
        } operation: {
            let _ = div {}
                .css
                .color(.text.primary)
                .backgroundColor(.background.primary)
                .borderColor(.border.primary)
                .color(.branding.accent)
            #expect(true)
        }
    }
}
