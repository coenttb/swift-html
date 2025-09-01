//
//  Color.Theme.minimal.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var minimal: Self {
        .init(
            gray: .init(light: .hex("666666"), dark: .hex("999999")),
            blue: .init(light: .hex("0066cc"), dark: .hex("4d94ff")),
            green: .init(light: .hex("00aa00"), dark: .hex("00dd00")),
            purple: .init(light: .hex("6600cc"), dark: .hex("9933ff")),
            red: .init(light: .hex("cc0000"), dark: .hex("ff3333")),
            yellow: .init(light: .hex("ccaa00"), dark: .hex("ffdd00")),
            orange: .init(light: .hex("ff6600"), dark: .hex("ff9933")),
            teal: .init(light: .hex("008888"), dark: .hex("00cccc")),
            cyan: .init(light: .hex("0099cc"), dark: .hex("00ccff")),
            pink: .init(light: .hex("cc0066"), dark: .hex("ff3399")),
            brown: .init(light: .hex("663300"), dark: .hex("996633")),
            black: .init(light: .hex("000000"), dark: .hex("000000")),
            offBlack: .init(light: .hex("111111"), dark: .hex("111111")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("f5f5f5"), dark: .hex("f5f5f5")),
            text: .minimal,
            background: .minimal,
            border: .minimal,
            branding: .minimal
        )
    }
}

extension HTMLColor.Theme.Text {
    static var minimal: Self {
        .init(
            primary: .init(light: .hex("000000"), dark: .hex("ffffff")),
            secondary: .init(light: .hex("333333"), dark: .hex("cccccc")),
            tertiary: .init(light: .hex("666666"), dark: .hex("999999")),
            link: .init(light: .hex("0066cc"), dark: .hex("4d94ff")),
            button: .init(light: .hex("ffffff"), dark: .hex("000000")),
            error: .init(light: .hex("cc0000"), dark: .hex("ff3333")),
            success: .init(light: .hex("00aa00"), dark: .hex("00dd00")),
            warning: .init(light: .hex("cc6600"), dark: .hex("ff9933")),
            inverted: .init(light: .hex("ffffff"), dark: .hex("000000")),
            disabled: .init(light: .hex("cccccc"), dark: .hex("333333"))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var minimal: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("000000")),
            secondary: .init(light: .hex("f5f5f5"), dark: .hex("111111")),
            tertiary: .init(light: .hex("eeeeee"), dark: .hex("222222")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("111111")),
            grouped: .init(light: .hex("f5f5f5"), dark: .hex("000000")),
            selected: .init(light: .hex("e0e0e0"), dark: .hex("333333")),
            highlighted: .init(light: .hex("ffff00").opacity(0.3), dark: .hex("ffff00").opacity(0.2)),
            button: .init(light: .hex("000000"), dark: .hex("ffffff")),
            error: .init(light: .hex("ffcccc"), dark: .hex("330000")),
            success: .init(light: .hex("ccffcc"), dark: .hex("003300")),
            warning: .init(light: .hex("ffffcc"), dark: .hex("333300"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var minimal: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("000000")),
            secondary: .init(light: .hex("f5f5f5"), dark: .hex("111111")),
            tertiary: .init(light: .hex("eeeeee"), dark: .hex("222222")),
            selected: .init(light: .hex("e0e0e0"), dark: .hex("333333")),
            highlighted: .init(light: .hex("ffff00").opacity(0.3), dark: .hex("ffff00").opacity(0.2)),
            button: .init(light: .hex("000000"), dark: .hex("ffffff")),
            error: .init(light: .hex("ffcccc"), dark: .hex("330000")),
            success: .init(light: .hex("ccffcc"), dark: .hex("003300")),
            warning: .init(light: .hex("ffffcc"), dark: .hex("333300"))
        )
    }
}

extension HTMLColor.Theme.Branding {
    public static var minimal: Self {
        .init(
            primary: .init(light: .hex("000000"), dark: .hex("ffffff")),
            secondary: .init(light: .hex("333333"), dark: .hex("cccccc")),
            accent: .init(light: .hex("0066cc"), dark: .hex("4d94ff")),
            primarySubtle: .init(light: .hex("000000").opacity(0.05), dark: .hex("ffffff").opacity(0.05)),
            secondarySubtle: .init(light: .hex("333333").opacity(0.05), dark: .hex("cccccc").opacity(0.05))
        )
    }
}
