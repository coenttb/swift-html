//
//  Color.Theme.documentation.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var documentation: Self {
        .init(
            gray: .init(light: .hex("6b7280"), dark: .hex("9ca3af")),
            blue: .init(light: .hex("2563eb"), dark: .hex("3b82f6")),
            green: .init(light: .hex("059669"), dark: .hex("10b981")),
            purple: .init(light: .hex("7c3aed"), dark: .hex("8b5cf6")),
            red: .init(light: .hex("dc2626"), dark: .hex("ef4444")),
            yellow: .init(light: .hex("ca8a04"), dark: .hex("eab308")),
            orange: .init(light: .hex("ea580c"), dark: .hex("f97316")),
            teal: .init(light: .hex("0d9488"), dark: .hex("14b8a6")),
            cyan: .init(light: .hex("0891b2"), dark: .hex("06b6d4")),
            pink: .init(light: .hex("db2777"), dark: .hex("ec4899")),
            brown: .init(light: .hex("92400e"), dark: .hex("b45309")),
            black: .init(light: .hex("000000"), dark: .hex("000000")),
            offBlack: .init(light: .hex("18181b"), dark: .hex("18181b")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("fafafa"), dark: .hex("fafafa")),
            text: .documentation,
            background: .documentation,
            border: .documentation,
            branding: .documentation
        )
    }
}

extension HTMLColor.Theme.Text {
    static var documentation: Self {
        .init(
            primary: .init(light: .hex("111827"), dark: .hex("f9fafb")),
            secondary: .init(light: .hex("4b5563"), dark: .hex("d1d5db")),
            tertiary: .init(light: .hex("9ca3af"), dark: .hex("6b7280")),
            link: .init(light: .hex("2563eb"), dark: .hex("3b82f6")),
            button: .init(light: .hex("ffffff"), dark: .hex("111827")),
            error: .init(light: .hex("b91c1c"), dark: .hex("f87171")),
            success: .init(light: .hex("047857"), dark: .hex("34d399")),
            warning: .init(light: .hex("a16207"), dark: .hex("fbbf24")),
            inverted: .init(light: .hex("f9fafb"), dark: .hex("111827")),
            disabled: .init(light: .hex("d1d5db"), dark: .hex("4b5563"))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var documentation: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("0f172a")),
            secondary: .init(light: .hex("f9fafb"), dark: .hex("1e293b")),
            tertiary: .init(light: .hex("f3f4f6"), dark: .hex("334155")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("1e293b")),
            grouped: .init(light: .hex("f9fafb"), dark: .hex("0f172a")),
            selected: .init(light: .hex("eff6ff"), dark: .hex("1e3a8a")),
            highlighted: .init(light: .hex("fef3c7"), dark: .hex("78350f")),
            button: .init(light: .hex("2563eb"), dark: .hex("3b82f6")),
            error: .init(light: .hex("fee2e2"), dark: .hex("450a0a")),
            success: .init(light: .hex("d1fae5"), dark: .hex("064e3b")),
            warning: .init(light: .hex("fef3c7"), dark: .hex("451a03"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var documentation: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("0f172a")),
            secondary: .init(light: .hex("f9fafb"), dark: .hex("1e293b")),
            tertiary: .init(light: .hex("f3f4f6"), dark: .hex("334155")),
            selected: .init(light: .hex("eff6ff"), dark: .hex("1e3a8a")),
            highlighted: .init(light: .hex("fef3c7"), dark: .hex("78350f")),
            button: .init(light: .hex("2563eb"), dark: .hex("3b82f6")),
            error: .init(light: .hex("fee2e2"), dark: .hex("450a0a")),
            success: .init(light: .hex("d1fae5"), dark: .hex("064e3b")),
            warning: .init(light: .hex("fef3c7"), dark: .hex("451a03"))
        )
    }
}


extension HTMLColor.Theme.Branding {
    public static var documentation: Self {
        .init(
            primary: .init(light: .hex("2563eb"), dark: .hex("3b82f6")),
            secondary: .init(light: .hex("059669"), dark: .hex("10b981")),
            accent: .init(light: .hex("f59e0b"), dark: .hex("fbbf24")),
            primarySubtle: .init(light: .hex("dbeafe"), dark: .hex("1e3a8a")),
            secondarySubtle: .init(light: .hex("d1fae5"), dark: .hex("064e3b"))
        )
    }
}
