//
//  Color.Theme.vapor.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var vapor: Self {
        .init(
            gray: .init(light: .hex("6b7280"), dark: .hex("9ca3af")),
            blue: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
            green: .init(light: .hex("10b981"), dark: .hex("34d399")),
            purple: .init(light: .hex("7b5fbe"), dark: .hex("9376e0")),
            red: .init(light: .hex("ef4444"), dark: .hex("f87171")),
            yellow: .init(light: .hex("f59e0b"), dark: .hex("fbbf24")),
            orange: .init(light: .hex("f97316"), dark: .hex("fb923c")),
            teal: .init(light: .hex("14b8a6"), dark: .hex("2dd4bf")),
            cyan: .init(light: .hex("06b6d4"), dark: .hex("22d3ee")),
            pink: .init(light: .hex("ec4899"), dark: .hex("f472b6")),
            brown: .init(light: .hex("92400e"), dark: .hex("d97706")),
            black: .init(light: .hex("111827"), dark: .hex("111827")),
            offBlack: .init(light: .hex("1f2937"), dark: .hex("1f2937")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("f9fafb"), dark: .hex("f9fafb")),
            text: .vapor,
            background: .vapor,
            border: .vapor,
            branding: .vapor
        )
    }
}

extension HTMLColor.Theme.Text {
    static var vapor: Self {
        .init(
            primary: .init(light: .hex("111827"), dark: .hex("f9fafb")),
            secondary: .init(light: .hex("4b5563"), dark: .hex("d1d5db")),
            tertiary: .init(light: .hex("9ca3af"), dark: .hex("6b7280")),
            link: .init(light: .hex("7b5fbe"), dark: .hex("9376e0")),
            button: .init(light: .hex("ffffff"), dark: .hex("111827")),
            error: .init(light: .hex("dc2626"), dark: .hex("ef4444")),
            success: .init(light: .hex("059669"), dark: .hex("10b981")),
            warning: .init(light: .hex("d97706"), dark: .hex("f59e0b")),
            inverted: .init(light: .hex("f9fafb"), dark: .hex("111827")),
            disabled: .init(light: .hex("d1d5db"), dark: .hex("4b5563"))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var vapor: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("111827")),
            secondary: .init(light: .hex("f3f4f6"), dark: .hex("1f2937")),
            tertiary: .init(light: .hex("e5e7eb"), dark: .hex("374151")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("374151")),
            grouped: .init(light: .hex("f9fafb"), dark: .hex("1f2937")),
            selected: .init(light: .hex("7b5fbe").opacity(0.1), dark: .hex("9376e0").opacity(0.2)),
            highlighted: .init(light: .hex("7b5fbe").opacity(0.15), dark: .hex("9376e0").opacity(0.25)),
            button: .init(light: .hex("7b5fbe"), dark: .hex("9376e0")),
            error: .init(light: .hex("fee2e2"), dark: .hex("7f1d1d")),
            success: .init(light: .hex("d1fae5"), dark: .hex("064e3b")),
            warning: .init(light: .hex("fed7aa"), dark: .hex("7c2d12"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var vapor: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("111827")),
            secondary: .init(light: .hex("f3f4f6"), dark: .hex("1f2937")),
            tertiary: .init(light: .hex("e5e7eb"), dark: .hex("374151")),
            selected: .init(light: .hex("7b5fbe").opacity(0.1), dark: .hex("9376e0").opacity(0.2)),
            highlighted: .init(light: .hex("7b5fbe").opacity(0.15), dark: .hex("9376e0").opacity(0.25)),
            button: .init(light: .hex("7b5fbe"), dark: .hex("9376e0")),
            error: .init(light: .hex("fee2e2"), dark: .hex("7f1d1d")),
            success: .init(light: .hex("d1fae5"), dark: .hex("064e3b")),
            warning: .init(light: .hex("fed7aa"), dark: .hex("7c2d12"))
        )
    }
}

extension HTMLColor.Theme.Branding {
    public static var vapor: Self {
        .init(
            primary: .init(light: .hex("7b5fbe"), dark: .hex("9376e0")),
            secondary: .init(light: .hex("ec4899"), dark: .hex("f472b6")),
            accent: .init(light: .hex("14b8a6"), dark: .hex("2dd4bf")),
            primarySubtle: .init(light: .hex("7b5fbe").opacity(0.15), dark: .hex("9376e0").opacity(0.2)),
            secondarySubtle: .init(light: .hex("ec4899").opacity(0.15), dark: .hex("f472b6").opacity(0.2))
        )
    }
}
