//
//  Color.Theme.stone.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var stone: Self {
        .init(
            gray: .init(light: .hex("78716c"), dark: .hex("a8a29e")),
            blue: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
            green: .init(light: .hex("10b981"), dark: .hex("34d399")),
            purple: .init(light: .hex("8b5cf6"), dark: .hex("a78bfa")),
            red: .init(light: .hex("ef4444"), dark: .hex("f87171")),
            yellow: .init(light: .hex("eab308"), dark: .hex("facc15")),
            orange: .init(light: .hex("f97316"), dark: .hex("fb923c")),
            teal: .init(light: .hex("14b8a6"), dark: .hex("2dd4bf")),
            cyan: .init(light: .hex("06b6d4"), dark: .hex("22d3ee")),
            pink: .init(light: .hex("ec4899"), dark: .hex("f472b6")),
            brown: .init(light: .hex("92400e"), dark: .hex("d97706")),
            black: .init(light: .hex("0c0a09"), dark: .hex("0c0a09")),
            offBlack: .init(light: .hex("1c1917"), dark: .hex("1c1917")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("fafaf9"), dark: .hex("fafaf9")),
            text: .stone,
            background: .stone,
            border: .stone,
            branding: .stone
        )
    }
}

extension HTMLColor.Theme.Text {
    static var stone: Self {
        .init(
            primary: .init(light: .hex("0c0a09"), dark: .hex("fafaf9")),
            secondary: .init(light: .hex("57534e"), dark: .hex("d6d3d1")),
            tertiary: .init(light: .hex("a8a29e"), dark: .hex("78716c")),
            link: .init(light: .hex("2563eb"), dark: .hex("60a5fa")),
            button: .init(light: .hex("1c1917"), dark: .hex("e7e5e4")),
            error: .init(light: .hex("dc2626"), dark: .hex("ef4444")),
            success: .init(light: .hex("16a34a"), dark: .hex("22c55e")),
            warning: .init(light: .hex("ca8a04"), dark: .hex("eab308")),
            inverted: .init(light: .hex("fafaf9"), dark: .hex("0c0a09")),
            disabled: .init(light: .hex("d6d3d1"), dark: .hex("57534e"))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var stone: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("0c0a09")),
            secondary: .init(light: .hex("f5f5f4"), dark: .hex("1c1917")),
            tertiary: .init(light: .hex("e7e5e4"), dark: .hex("292524")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("292524")),
            grouped: .init(light: .hex("fafaf9"), dark: .hex("1c1917")),
            selected: .init(light: .hex("d6d3d1"), dark: .hex("44403c")),
            highlighted: .init(light: .hex("e7e5e4").opacity(0.8), dark: .hex("57534e").opacity(0.5)),
            button: .init(light: .hex("f5f5f4"), dark: .hex("292524")),
            error: .init(light: .hex("fef2f2"), dark: .hex("450a0a")),
            success: .init(light: .hex("f0fdf4"), dark: .hex("14532d")),
            warning: .init(light: .hex("fffbeb"), dark: .hex("451a03"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var stone: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("0c0a09")),
            secondary: .init(light: .hex("f5f5f4"), dark: .hex("1c1917")),
            tertiary: .init(light: .hex("e7e5e4"), dark: .hex("292524")),
            selected: .init(light: .hex("d6d3d1"), dark: .hex("44403c")),
            highlighted: .init(light: .hex("e7e5e4").opacity(0.8), dark: .hex("57534e").opacity(0.5)),
            button: .init(light: .hex("f5f5f4"), dark: .hex("292524")),
            error: .init(light: .hex("fef2f2"), dark: .hex("450a0a")),
            success: .init(light: .hex("f0fdf4"), dark: .hex("14532d")),
            warning: .init(light: .hex("fffbeb"), dark: .hex("451a03"))
        )
    }
}

extension HTMLColor.Theme.Branding {
    public static var stone: Self {
        .init(
            primary: .init(light: .hex("8b5cf6"), dark: .hex("a78bfa")),
            secondary: .init(light: .hex("f97316"), dark: .hex("fb923c")),
            accent: .init(light: .hex("10b981"), dark: .hex("34d399")),
            primarySubtle: .init(light: .hex("8b5cf6").opacity(0.1), dark: .hex("a78bfa").opacity(0.2)),
            secondarySubtle: .init(light: .hex("f97316").opacity(0.1), dark: .hex("fb923c").opacity(0.2))
        )
    }
}
