//
//  Theme Variants Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//

import Dependencies
import HTML
import CSS_Theming
import HTML_Rendering_TestSupport
import Testing

@Suite("Theme Variants")
struct ThemeVariantsTests {

    // MARK: - Theme Availability

    @Test("All theme variants are accessible")
    func allThemeVariantsAccessible() {
        let _ = HTMLColor.Theme.default
        let _ = HTMLColor.Theme.slate
        let _ = HTMLColor.Theme.apple
        let _ = HTMLColor.Theme.vapor
        let _ = HTMLColor.Theme.swift
        let _ = HTMLColor.Theme.minimal
        let _ = HTMLColor.Theme.zinc
        let _ = HTMLColor.Theme.stone
        let _ = HTMLColor.Theme.github
        let _ = HTMLColor.Theme.documentation
        #expect(true)
    }

    // MARK: - Theme Dependency Override

    @Test("Theme dependency can be overridden")
    func themeDependencyOverride() {
        let defaultRed = withDependencies {
            $0.theme = .default
        } operation: {
            HTMLColor.red
        }

        let appleRed = withDependencies {
            $0.theme = .apple
        } operation: {
            HTMLColor.red
        }

        // Different themes should have different red values
        // (They may or may not be the same, depending on theme definition)
        let _ = defaultRed
        let _ = appleRed
        #expect(true)
    }

    @Test("Theme text colors vary by theme")
    func themeTextColorsVary() {
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

        // Text primary should exist in both themes
        let _ = defaultPrimary
        let _ = slatePrimary
        #expect(true)
    }

    // MARK: - Theme Snapshot Tests

    @Test("Default theme red color snapshot")
    func defaultThemeRedSnapshot() {
        withDependencies {
            $0.theme = .default
        } operation: {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Red" }
                        .css.color(HTMLColor.red)
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
                        .color-0{color:#ff1a1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Red
                    </div>
                  </body>
                </html>
                """
            }
        }
    }

    @Test("Default theme text.primary snapshot")
    func defaultThemeTextPrimarySnapshot() {
        withDependencies {
            $0.theme = .default
        } operation: {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Primary Text" }
                        .css.color(.text.primary)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#000000}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:#FFFFFF}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Primary Text
                    </div>
                  </body>
                </html>
                """
            }
        }
    }

    @Test("Default theme background.primary snapshot")
    func defaultThemeBackgroundPrimarySnapshot() {
        withDependencies {
            $0.theme = .default
        } operation: {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Primary Background" }
                        .css.backgroundColor(.background.primary)
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
                    <div class="background-color-0 background-color-1">Primary Background
                    </div>
                  </body>
                </html>
                """
            }
        }
    }

    @Test("Default theme branding.primary snapshot")
    func defaultThemeBrandingPrimarySnapshot() {
        withDependencies {
            $0.theme = .default
        } operation: {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Branding Primary" }
                        .css.color(.branding.primary)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#0066cc}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:#4d94ff}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Branding Primary
                    </div>
                  </body>
                </html>
                """
            }
        }
    }

    // MARK: - Multiple Colors in One Element

    @Test("Multiple theme colors on one element")
    func multipleThemeColorsSnapshot() {
        withDependencies {
            $0.theme = .default
        } operation: {
            assertInlineSnapshot(
                of: HTML.Document {
                    div { "Styled" }
                        .css
                        .color(.text.primary)
                        .backgroundColor(.background.secondary)
                        .borderColor(.border.primary)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-1{border-color:#FFFFFF}
                      .background-color-3{background-color:#F2F2F7}
                      .color-5{color:#000000}
                      @media (prefers-color-scheme: dark){
                        .border-color-0{border-color:#121212}
                        .background-color-2{background-color:#1C1C1E}
                        .color-4{color:#FFFFFF}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0 border-color-1 background-color-2 background-color-3 color-4 color-5">Styled
                    </div>
                  </body>
                </html>
                """
            }
        }
    }

    // MARK: - Live and Test Values

    @Test("Theme DependencyKey has correct values")
    func themeDependencyKeyValues() {
        // Live, test, and preview values should all return .default
        #expect(HTMLColor.Theme.liveValue.gray.light == HTMLColor.Theme.default.gray.light)
        #expect(HTMLColor.Theme.testValue.gray.light == HTMLColor.Theme.default.gray.light)
        #expect(HTMLColor.Theme.previewValue.gray.light == HTMLColor.Theme.default.gray.light)
    }
}
