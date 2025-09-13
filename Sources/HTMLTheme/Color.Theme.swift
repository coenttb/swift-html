//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 12/03/2025.
//

import Dependencies
import Foundation
import HTML

extension HTMLColor {
    public struct Theme: Sendable {
        public var gray: HTMLColor
        public var blue: HTMLColor
        public var green: HTMLColor
        public var purple: HTMLColor
        public var red: HTMLColor
        public var yellow: HTMLColor
        public var orange: HTMLColor
        public var teal: HTMLColor
        public var cyan: HTMLColor
        public var pink: HTMLColor
        public var brown: HTMLColor
        public var black: HTMLColor
        public var offBlack: HTMLColor
        public var white: HTMLColor
        public var offWhite: HTMLColor
        public var neutral: HTMLColor
        public var info: HTMLColor
        public var text: HTMLColor.Theme.Text
        public var background: HTMLColor.Theme.Background
        public var border: HTMLColor.Theme.Border
        public var branding: HTMLColor.Theme.Branding
    }
}

extension HTMLColor.Theme {
    public struct Text: Sendable {
        public var primary: HTMLColor
        public var secondary: HTMLColor
        public var tertiary: HTMLColor

        public var link: HTMLColor
        public var linkHover: HTMLColor
        public var button: HTMLColor

        public var error: HTMLColor
        public var success: HTMLColor
        public var warning: HTMLColor
        public var info: HTMLColor
        public var neutral: HTMLColor

        public var inverted: HTMLColor
        public var disabled: HTMLColor

        public init(
            primary: HTMLColor,
            secondary: HTMLColor,
            tertiary: HTMLColor,
            link: HTMLColor,
            linkHover: HTMLColor? = nil,
            button: HTMLColor,
            error: HTMLColor,
            success: HTMLColor,
            warning: HTMLColor,
            info: HTMLColor? = nil,
            neutral: HTMLColor? = nil,
            inverted: HTMLColor,
            disabled: HTMLColor
        ) {
            self.primary = primary
            self.secondary = secondary
            self.tertiary = tertiary
            self.link = link
            self.linkHover = linkHover ?? link
            self.button = button
            self.error = error
            self.success = success
            self.warning = warning
            self.info = info ?? link
            self.neutral = neutral ?? secondary
            self.inverted = inverted
            self.disabled = disabled
        }
    }
}



extension HTMLColor.Theme {
    public struct Background: Sendable {
        public var primary: HTMLColor
        public var secondary: HTMLColor
        public var tertiary: HTMLColor

        public var elevated: HTMLColor
        public var grouped: HTMLColor

        public var selected: HTMLColor
        public var highlighted: HTMLColor

        public var button: HTMLColor
        public var buttonHover: HTMLColor
        
        public var error: HTMLColor
        public var errorMuted: HTMLColor
        public var success: HTMLColor
        public var successMuted: HTMLColor
        public var warning: HTMLColor
        public var warningMuted: HTMLColor
        public var info: HTMLColor
        public var infoMuted: HTMLColor
        public var neutral: HTMLColor

        public init(
            primary: HTMLColor,
            secondary: HTMLColor,
            tertiary: HTMLColor,
            elevated: HTMLColor,
            grouped: HTMLColor,
            selected: HTMLColor,
            highlighted: HTMLColor,
            button: HTMLColor,
            buttonHover: HTMLColor? = nil,
            error: HTMLColor,
            errorMuted: HTMLColor? = nil,
            success: HTMLColor,
            successMuted: HTMLColor? = nil,
            warning: HTMLColor,
            warningMuted: HTMLColor? = nil,
            info: HTMLColor? = nil,
            infoMuted: HTMLColor? = nil,
            neutral: HTMLColor? = nil
        ) {
            self.primary = primary
            self.secondary = secondary
            self.tertiary = tertiary
            self.elevated = elevated
            self.grouped = grouped
            self.selected = selected
            self.highlighted = highlighted
            self.button = button
            self.buttonHover = buttonHover ?? button
            self.error = error
            self.errorMuted = errorMuted ?? error
            self.success = success
            self.successMuted = successMuted ?? success
            self.warning = warning
            self.warningMuted = warningMuted ?? warning
            self.info = info ?? highlighted
            self.infoMuted = infoMuted ?? highlighted
            self.neutral = neutral ?? secondary
        }
    }
}

extension HTMLColor.Theme {
    public struct Border: Sendable {
        public var primary: HTMLColor
        public var secondary: HTMLColor
        public var tertiary: HTMLColor

        public var selected: HTMLColor
        public var highlighted: HTMLColor
        public var hover: HTMLColor

        public var button: HTMLColor
        
        public var error: HTMLColor
        public var success: HTMLColor
        public var warning: HTMLColor
        public var info: HTMLColor
        public var infoMuted: HTMLColor
        public var neutral: HTMLColor
        

        public init(
            primary: HTMLColor,
            secondary: HTMLColor,
            tertiary: HTMLColor,
            selected: HTMLColor,
            highlighted: HTMLColor,
            hover: HTMLColor? = nil,
            button: HTMLColor,
            error: HTMLColor,
            success: HTMLColor,
            warning: HTMLColor,
            info: HTMLColor? = nil,
            infoMuted: HTMLColor? = nil,
            neutral: HTMLColor? = nil
        ) {
            self.primary = primary
            self.secondary = secondary
            self.tertiary = tertiary
            self.selected = selected
            self.highlighted = highlighted
            self.hover = hover ?? highlighted
            self.button = button
            self.error = error
            self.success = success
            self.warning = warning
            self.info = info ?? highlighted
            self.infoMuted = infoMuted ?? highlighted
            self.neutral = neutral ?? secondary
        }
    }
}




extension HTMLColor.Theme {
    public struct Branding: Sendable {
        public var primary: HTMLColor
        public var secondary: HTMLColor
        public var accent: HTMLColor
        public var primarySubtle: HTMLColor
        public var secondarySubtle: HTMLColor

        public init(
            primary: HTMLColor,
            secondary: HTMLColor,
            accent: HTMLColor,
            primarySubtle: HTMLColor,
            secondarySubtle: HTMLColor
        ) {
            self.primary = primary
            self.secondary = secondary
            self.accent = accent
            self.primarySubtle = primarySubtle
            self.secondarySubtle = secondarySubtle
        }
    }
}

extension HTMLColor {
    public static var theme: HTMLColor.Theme {
        @Dependency(\.theme) var color
        return color
    }
}

extension HTMLColor {
    public static var text: HTMLColor.Theme.Text {
        @Dependency(\.theme.text) var text
        return text
    }
}

extension HTMLColor {
    public static var background: HTMLColor.Theme.Background {
        @Dependency(\.theme.background) var background
        return background
    }
}

extension HTMLColor {
    public static var border: HTMLColor.Theme.Border {
        @Dependency(\.theme.border) var border
        return border
    }
}

extension HTMLColor {
    public static var branding: HTMLColor.Theme.Branding {
        @Dependency(\.theme.branding) var branding
        return branding
    }
}

extension HTMLColor.Theme: DependencyKey {
    public static var liveValue: Self { .default }
    public static var testValue: Self { liveValue }
    public static var previewValue: Self { liveValue }
}

extension DependencyValues {
    public var theme: HTMLColor.Theme {
        get { self[HTMLColor.Theme.self] }
        set { self[HTMLColor.Theme.self] = newValue }
    }
}

extension HTMLColor {
    public static var gray: Self {
        @Dependency(\.theme.gray) var gray
        return gray
    }
    public static var black: Self {
        @Dependency(\.theme.black) var black
        return black
    }
    public static var offBlack: Self {
        @Dependency(\.theme.offBlack) var offBlack
        return offBlack
    }
    public static var white: Self {
        @Dependency(\.theme.white) var white
        return white
    }
    public static var offWhite: Self {
        @Dependency(\.theme.offWhite) var offWhite
        return offWhite
    }
    public static var cyan: Self {
        @Dependency(\.theme.cyan) var cyan
        return cyan
    }
    public static var teal: Self {
        @Dependency(\.theme.teal) var teal
        return teal
    }
    public static var pink: Self {
        @Dependency(\.theme.pink) var pink
        return pink
    }
    public static var brown: Self {
        @Dependency(\.theme.brown) var brown
        return brown
    }

    public static var orange: Self {
        @Dependency(\.theme.orange) var orange
        return orange
    }
    public static var green: Self {
        @Dependency(\.theme.green) var green
        return green
    }
    public static var purple: Self {
        @Dependency(\.theme.purple) var purple
        return purple
    }
    public static var blue: Self {
        @Dependency(\.theme.blue) var blue
        return blue
    }
    public static var red: Self {
        @Dependency(\.theme.red) var red
        return red
    }
    public static var yellow: Self {
        @Dependency(\.theme.yellow) var yellow
        return yellow
    }
    public static var neutral: Self {
        @Dependency(\.theme.neutral) var neutral
        return neutral
    }
    public static var info: Self {
        @Dependency(\.theme.info) var info
        return info
    }
    
    public static let transparent: Self = .init(light: .transparent, dark: .transparent)
}

extension HTMLColor {
    public static let cardBackground: Self = .init(light: .rgb(red: 245, green: 246, blue: 248), dark: .rgb(red: 25, green: 25, blue: 27))
}

extension HTMLColor {
    public static let buttonBackground: Self = .cardBackground
}


