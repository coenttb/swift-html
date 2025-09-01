//
//  Color.Theme.apple.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var apple: Self {
        .init(
            gray: .init(light: .hex("8e8e93"), dark: .hex("8e8e93")),
            blue: .init(light: .hex("007aff"), dark: .hex("0a84ff")),
            green: .init(light: .hex("34c759"), dark: .hex("30d158")),
            purple: .init(light: .hex("5856d6"), dark: .hex("5e5ce6")),
            red: .init(light: .hex("ff3b30"), dark: .hex("ff453a")),
            yellow: .init(light: .hex("ffcc00"), dark: .hex("ffd60a")),
            orange: .init(light: .hex("ff9500"), dark: .hex("ff9f0a")),
            teal: .init(light: .hex("5ac8fa"), dark: .hex("64d2ff")),
            cyan: .init(light: .hex("5ac8fa"), dark: .hex("64d2ff")),
            pink: .init(light: .hex("ff2d55"), dark: .hex("ff375f")),
            brown: .init(light: .hex("a2845e"), dark: .hex("ac8e68")),
            black: .init(light: .hex("000000"), dark: .hex("000000")),
            offBlack: .init(light: .hex("1c1c1e"), dark: .hex("1c1c1e")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("f2f2f7"), dark: .hex("f2f2f7")),
            text: .apple,
            background: .apple,
            border: .apple,
            branding: .apple
        )
    }
}

extension HTMLColor.Theme.Text {
    static var apple: Self {
        .init(
            primary: .init(light: .hex("000000"), dark: .hex("ffffff")),
            secondary: .init(light: .hex("3c3c43").opacity(0.6), dark: .hex("ebebf5").opacity(0.6)),
            tertiary: .init(light: .hex("3c3c43").opacity(0.3), dark: .hex("ebebf5").opacity(0.3)),
            link: .init(light: .hex("007aff"), dark: .hex("0a84ff")),
            button: .init(light: .hex("007aff"), dark: .hex("0a84ff")),
            error: .init(light: .hex("ff3b30"), dark: .hex("ff453a")),
            success: .init(light: .hex("34c759"), dark: .hex("30d158")),
            warning: .init(light: .hex("ff9500"), dark: .hex("ff9f0a")),
            inverted: .init(light: .hex("ffffff"), dark: .hex("000000")),
            disabled: .init(light: .hex("3c3c43").opacity(0.2), dark: .hex("ebebf5").opacity(0.2))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var apple: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("000000")),
            secondary: .init(light: .hex("f2f2f7"), dark: .hex("1c1c1e")),
            tertiary: .init(light: .hex("ffffff"), dark: .hex("2c2c2e")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("1c1c1e")),
            grouped: .init(light: .hex("f2f2f7"), dark: .hex("000000")),
            selected: .init(light: .hex("d1d1d6"), dark: .hex("3a3a3c")),
            highlighted: .init(light: .hex("007aff").opacity(0.15), dark: .hex("0a84ff").opacity(0.15)),
            button: .init(light: .hex("007aff"), dark: .hex("0a84ff")),
            error: .init(light: .hex("ffebe9"), dark: .hex("3a0f0c")),
            success: .init(light: .hex("e6f4ea"), dark: .hex("0d2f1f")),
            warning: .init(light: .hex("fff4e5"), dark: .hex("3a2003"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var apple: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("000000")),
            secondary: .init(light: .hex("f2f2f7"), dark: .hex("1c1c1e")),
            tertiary: .init(light: .hex("ffffff"), dark: .hex("2c2c2e")),
            selected: .init(light: .hex("d1d1d6"), dark: .hex("3a3a3c")),
            highlighted: .init(light: .hex("007aff").opacity(0.15), dark: .hex("0a84ff").opacity(0.15)),
            button: .init(light: .hex("007aff"), dark: .hex("0a84ff")),
            error: .init(light: .hex("ffebe9"), dark: .hex("3a0f0c")),
            success: .init(light: .hex("e6f4ea"), dark: .hex("0d2f1f")),
            warning: .init(light: .hex("fff4e5"), dark: .hex("3a2003"))
        )
    }
}

extension HTMLColor.Theme.Branding {
    public static var apple: Self {
        .init(
            primary: .init(light: .hex("007aff"), dark: .hex("0a84ff")),
            secondary: .init(light: .hex("5856d6"), dark: .hex("5e5ce6")),
            accent: .init(light: .hex("ff9500"), dark: .hex("ff9f0a")),
            primarySubtle: .init(light: .hex("007aff").opacity(0.15), dark: .hex("0a84ff").opacity(0.15)),
            secondarySubtle: .init(light: .hex("5856d6").opacity(0.15), dark: .hex("5e5ce6").opacity(0.15))
        )
    }
}
