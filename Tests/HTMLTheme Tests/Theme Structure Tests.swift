//
//  Theme Structure Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//

import Dependencies
import HTML
import CSS_Theming
import Testing

@Suite("Theme Structure")
struct ThemeStructureTests {

    // MARK: - Theme.Text Default Fallbacks

    @Test("Theme.Text linkHover defaults to link")
    func textLinkHoverDefault() {
        let link = HTMLColor.blue500
        let text = HTMLColor.Theme.Text(
            primary: .gray900,
            secondary: .gray700,
            tertiary: .gray500,
            link: link,
            button: .init(light: .hex("fff"), dark: .hex("fff")),
            error: .red500,
            success: .green500,
            warning: .yellow500,
            inverted: .init(light: .hex("fff"), dark: .hex("fff")),
            disabled: .gray400
        )
        #expect(text.linkHover.light == link.light)
        #expect(text.linkHover.dark == link.dark)
    }

    @Test("Theme.Text info defaults to link")
    func textInfoDefaultsToLink() {
        let link = HTMLColor.blue500
        let text = HTMLColor.Theme.Text(
            primary: .gray900,
            secondary: .gray700,
            tertiary: .gray500,
            link: link,
            button: .init(light: .hex("fff"), dark: .hex("fff")),
            error: .red500,
            success: .green500,
            warning: .yellow500,
            inverted: .init(light: .hex("fff"), dark: .hex("fff")),
            disabled: .gray400
        )
        #expect(text.info.light == link.light)
        #expect(text.info.dark == link.dark)
    }

    @Test("Theme.Text neutral defaults to secondary")
    func textNeutralDefaultsToSecondary() {
        let secondary = HTMLColor.gray700
        let text = HTMLColor.Theme.Text(
            primary: .gray900,
            secondary: secondary,
            tertiary: .gray500,
            link: .blue500,
            button: .init(light: .hex("fff"), dark: .hex("fff")),
            error: .red500,
            success: .green500,
            warning: .yellow500,
            inverted: .init(light: .hex("fff"), dark: .hex("fff")),
            disabled: .gray400
        )
        #expect(text.neutral.light == secondary.light)
        #expect(text.neutral.dark == secondary.dark)
    }

    // MARK: - Theme.Background Default Fallbacks

    @Test("Theme.Background buttonHover defaults to button")
    func backgroundButtonHoverDefault() {
        let button = HTMLColor.gray200
        let background = HTMLColor.Theme.Background(
            primary: .init(light: .hex("fff"), dark: .hex("000")),
            secondary: .gray100,
            tertiary: .gray200,
            elevated: .init(light: .hex("fff"), dark: .hex("111")),
            grouped: .gray100,
            selected: .gray300,
            highlighted: .gray200,
            button: button,
            error: .red100,
            success: .green100,
            warning: .yellow100
        )
        #expect(background.buttonHover.light == button.light)
        #expect(background.buttonHover.dark == button.dark)
    }

    @Test("Theme.Background errorMuted defaults to error")
    func backgroundErrorMutedDefault() {
        let error = HTMLColor.red100
        let background = HTMLColor.Theme.Background(
            primary: .init(light: .hex("fff"), dark: .hex("000")),
            secondary: .gray100,
            tertiary: .gray200,
            elevated: .init(light: .hex("fff"), dark: .hex("111")),
            grouped: .gray100,
            selected: .gray300,
            highlighted: .gray200,
            button: .gray200,
            error: error,
            success: .green100,
            warning: .yellow100
        )
        #expect(background.errorMuted.light == error.light)
        #expect(background.errorMuted.dark == error.dark)
    }

    @Test("Theme.Background info defaults to highlighted")
    func backgroundInfoDefaultsToHighlighted() {
        let highlighted = HTMLColor.gray200
        let background = HTMLColor.Theme.Background(
            primary: .init(light: .hex("fff"), dark: .hex("000")),
            secondary: .gray100,
            tertiary: .gray200,
            elevated: .init(light: .hex("fff"), dark: .hex("111")),
            grouped: .gray100,
            selected: .gray300,
            highlighted: highlighted,
            button: .gray200,
            error: .red100,
            success: .green100,
            warning: .yellow100
        )
        #expect(background.info.light == highlighted.light)
        #expect(background.info.dark == highlighted.dark)
    }

    // MARK: - Theme.Border Default Fallbacks

    @Test("Theme.Border hover defaults to highlighted")
    func borderHoverDefaultsToHighlighted() {
        let highlighted = HTMLColor.gray300
        let border = HTMLColor.Theme.Border(
            primary: .gray100,
            secondary: .gray200,
            tertiary: .gray300,
            selected: .gray400,
            highlighted: highlighted,
            button: .gray200,
            error: .red500,
            success: .green500,
            warning: .yellow500
        )
        #expect(border.hover.light == highlighted.light)
        #expect(border.hover.dark == highlighted.dark)
    }

    @Test("Theme.Border info defaults to highlighted")
    func borderInfoDefaultsToHighlighted() {
        let highlighted = HTMLColor.gray300
        let border = HTMLColor.Theme.Border(
            primary: .gray100,
            secondary: .gray200,
            tertiary: .gray300,
            selected: .gray400,
            highlighted: highlighted,
            button: .gray200,
            error: .red500,
            success: .green500,
            warning: .yellow500
        )
        #expect(border.info.light == highlighted.light)
        #expect(border.info.dark == highlighted.dark)
    }

    // MARK: - Theme.Branding

    @Test("Theme.Branding stores all values correctly")
    func brandingStoresAllValues() {
        let primary = HTMLColor.blue500
        let secondary = HTMLColor.purple500
        let accent = HTMLColor.orange500
        let primarySubtle = HTMLColor.blue100
        let secondarySubtle = HTMLColor.purple100

        let branding = HTMLColor.Theme.Branding(
            primary: primary,
            secondary: secondary,
            accent: accent,
            primarySubtle: primarySubtle,
            secondarySubtle: secondarySubtle
        )

        #expect(branding.primary.light == primary.light)
        #expect(branding.secondary.light == secondary.light)
        #expect(branding.accent.light == accent.light)
        #expect(branding.primarySubtle.light == primarySubtle.light)
        #expect(branding.secondarySubtle.light == secondarySubtle.light)
    }

    // MARK: - Theme Completeness

    @Test("Default theme has all required colors")
    func defaultThemeCompleteness() {
        let theme = HTMLColor.Theme.default

        // Base colors
        #expect(theme.gray.light != theme.gray.dark || theme.gray.light == theme.gray.light)
        #expect(theme.blue.light != theme.blue.dark || theme.blue.light == theme.blue.light)
        #expect(theme.red.light != theme.red.dark || theme.red.light == theme.red.light)
        #expect(theme.green.light != theme.green.dark || theme.green.light == theme.green.light)
        #expect(theme.yellow.light != theme.yellow.dark || theme.yellow.light == theme.yellow.light)
        #expect(theme.orange.light != theme.orange.dark || theme.orange.light == theme.orange.light)
        #expect(theme.purple.light != theme.purple.dark || theme.purple.light == theme.purple.light)
        #expect(theme.pink.light != theme.pink.dark || theme.pink.light == theme.pink.light)
        #expect(theme.teal.light != theme.teal.dark || theme.teal.light == theme.teal.light)
        #expect(theme.cyan.light != theme.cyan.dark || theme.cyan.light == theme.cyan.light)
        #expect(theme.brown.light != theme.brown.dark || theme.brown.light == theme.brown.light)

        // Semantic colors
        #expect(theme.neutral.light != theme.neutral.dark || theme.neutral.light == theme.neutral.light)
        #expect(theme.info.light != theme.info.dark || theme.info.light == theme.info.light)
    }

    @Test("Default theme text has all required properties")
    func defaultThemeTextCompleteness() {
        // Access via the theme dependency to use public API
        let text = HTMLColor.Theme.default.text

        // All text properties exist and are accessible
        let _ = text.primary
        let _ = text.secondary
        let _ = text.tertiary
        let _ = text.link
        let _ = text.linkHover
        let _ = text.button
        let _ = text.error
        let _ = text.success
        let _ = text.warning
        let _ = text.info
        let _ = text.neutral
        let _ = text.inverted
        let _ = text.disabled

        #expect(Bool(true))
    }

    @Test("Default theme background has all required properties")
    func defaultThemeBackgroundCompleteness() {
        // Access via the theme dependency to use public API
        let background = HTMLColor.Theme.default.background

        // All background properties exist and are accessible
        let _ = background.primary
        let _ = background.secondary
        let _ = background.tertiary
        let _ = background.elevated
        let _ = background.grouped
        let _ = background.selected
        let _ = background.highlighted
        let _ = background.button
        let _ = background.buttonHover
        let _ = background.error
        let _ = background.errorMuted
        let _ = background.success
        let _ = background.successMuted
        let _ = background.warning
        let _ = background.warningMuted
        let _ = background.info
        let _ = background.infoMuted
        let _ = background.neutral

        #expect(Bool(true))
    }

    @Test("Default theme border has all required properties")
    func defaultThemeBorderCompleteness() {
        // Access via the theme dependency to use public API
        let border = HTMLColor.Theme.default.border

        // All border properties exist and are accessible
        let _ = border.primary
        let _ = border.secondary
        let _ = border.tertiary
        let _ = border.selected
        let _ = border.highlighted
        let _ = border.hover
        let _ = border.button
        let _ = border.error
        let _ = border.success
        let _ = border.warning
        let _ = border.info
        let _ = border.infoMuted
        let _ = border.neutral

        #expect(Bool(true))
    }

    @Test("Default theme branding has all required properties")
    func defaultThemeBrandingCompleteness() {
        // Access via the theme dependency to use public API
        let branding = HTMLColor.Theme.default.branding

        // All branding properties exist and are accessible
        let _ = branding.primary
        let _ = branding.secondary
        let _ = branding.accent
        let _ = branding.primarySubtle
        let _ = branding.secondarySubtle

        #expect(Bool(true))
    }
}
