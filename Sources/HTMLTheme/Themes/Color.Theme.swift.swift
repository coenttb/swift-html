//
//  Color.Theme.swift.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var swift: Self {
        .init(
            gray: .init(light: .hex("6b7280"), dark: .hex("9ca3af")),
            blue: .init(light: .hex("005ab5"), dark: .hex("4da6ff")),
            green: .init(light: .hex("10b981"), dark: .hex("34d399")),
            purple: .init(light: .hex("8b5cf6"), dark: .hex("a78bfa")),
            red: .init(light: .hex("ef4444"), dark: .hex("f87171")),
            yellow: .init(light: .hex("facc15"), dark: .hex("fde047")),
            orange: .init(light: .hex("f05138"), dark: .hex("ff6952")),
            teal: .init(light: .hex("14b8a6"), dark: .hex("2dd4bf")),
            cyan: .init(light: .hex("06b6d4"), dark: .hex("22d3ee")),
            pink: .init(light: .hex("ec4899"), dark: .hex("f472b6")),
            brown: .init(light: .hex("92400e"), dark: .hex("d97706")),
            black: .init(light: .hex("000000"), dark: .hex("000000")),
            offBlack: .init(light: .hex("1d1d1f"), dark: .hex("1d1d1f")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("f5f5f7"), dark: .hex("f5f5f7")),
            neutral: .init(light: .hex("6b7280"), dark: .hex("9ca3af")),
            info: .init(light: .hex("005ab5"), dark: .hex("4da6ff")),
            text: .swift,
            background: .swift,
            border: .swift,
            branding: .swift
        )
    }
}

extension HTMLColor.Theme.Text {
    static var swift: Self {
        .init(
            primary: .init(light: .hex("000000"), dark: .hex("ffffff")),
            secondary: .init(light: .hex("5e5e5e"), dark: .hex("adadad")),
            tertiary: .init(light: .hex("8e8e8e"), dark: .hex("6e6e6e")),
            link: .init(light: .hex("f05138"), dark: .hex("ff6952")),
            linkHover: .init(light: .hex("f05138").opacity(0.8), dark: .hex("ff6952").opacity(0.8)),
            button: .init(light: .hex("ffffff"), dark: .hex("000000")),
            error: .init(light: .hex("d70015"), dark: .hex("ff453a")),
            success: .init(light: .hex("00a944"), dark: .hex("32d74b")),
            warning: .init(light: .hex("f05138"), dark: .hex("ff6952")),
            info: .init(light: .hex("005ab5"), dark: .hex("4da6ff")),
            neutral: .init(light: .hex("5e5e5e"), dark: .hex("adadad")),
            inverted: .init(light: .hex("ffffff"), dark: .hex("000000")),
            disabled: .init(light: .hex("c6c6c6"), dark: .hex("48484a"))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var swift: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("1d1d1f")),
            secondary: .init(light: .hex("f5f5f7"), dark: .hex("2c2c2e")),
            tertiary: .init(light: .hex("efeff4"), dark: .hex("3a3a3c")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("2c2c2e")),
            grouped: .init(light: .hex("f2f2f7"), dark: .hex("1d1d1f")),
            selected: .init(light: .hex("f05138").opacity(0.1), dark: .hex("ff6952").opacity(0.2)),
            highlighted: .init(
                light: .hex("f05138").opacity(0.15),
                dark: .hex("ff6952").opacity(0.25)
            ),
            button: .init(light: .hex("f05138"), dark: .hex("ff6952")),
            buttonHover: .init(light: .hex("d9402e"), dark: .hex("ff8066")),
            error: .init(light: .hex("ffebe9"), dark: .hex("3a1915")),
            errorMuted: .init(
                light: .hex("ffebe9").opacity(0.5),
                dark: .hex("3a1915").opacity(0.5)
            ),
            success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
            successMuted: .init(
                light: .hex("dcfce7").opacity(0.5),
                dark: .hex("14532d").opacity(0.5)
            ),
            warning: .init(light: .hex("fef3c7"), dark: .hex("451a03")),
            warningMuted: .init(
                light: .hex("fef3c7").opacity(0.5),
                dark: .hex("451a03").opacity(0.5)
            ),
            info: .init(light: .hex("e6f3ff"), dark: .hex("1e3a5f")),
            infoMuted: .init(light: .hex("e6f3ff").opacity(0.5), dark: .hex("1e3a5f").opacity(0.5)),
            neutral: .init(light: .hex("f5f5f7"), dark: .hex("2c2c2e"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var swift: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("1d1d1f")),
            secondary: .init(light: .hex("f5f5f7"), dark: .hex("2c2c2e")),
            tertiary: .init(light: .hex("efeff4"), dark: .hex("3a3a3c")),
            selected: .init(light: .hex("f05138").opacity(0.1), dark: .hex("ff6952").opacity(0.2)),
            highlighted: .init(
                light: .hex("f05138").opacity(0.15),
                dark: .hex("ff6952").opacity(0.25)
            ),
            hover: .init(light: .hex("f05138").opacity(0.08), dark: .hex("ff6952").opacity(0.16)),
            button: .init(light: .hex("f05138"), dark: .hex("ff6952")),
            error: .init(light: .hex("ffebe9"), dark: .hex("3a1915")),
            success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
            warning: .init(light: .hex("fef3c7"), dark: .hex("451a03")),
            info: .init(light: .hex("005ab5"), dark: .hex("4da6ff")),
            infoMuted: .init(light: .hex("005ab5").opacity(0.5), dark: .hex("4da6ff").opacity(0.5)),
            neutral: .init(light: .hex("f5f5f7"), dark: .hex("2c2c2e"))
        )
    }
}

extension HTMLColor.Theme.Branding {
    public static var swift: Self {
        .init(
            primary: .init(light: .hex("f05138"), dark: .hex("ff6952")),
            secondary: .init(light: .hex("005ab5"), dark: .hex("4da6ff")),
            accent: .init(light: .hex("ffcd3c"), dark: .hex("fde047")),
            primarySubtle: .init(
                light: .hex("f05138").opacity(0.15),
                dark: .hex("ff6952").opacity(0.2)
            ),
            secondarySubtle: .init(
                light: .hex("005ab5").opacity(0.15),
                dark: .hex("4da6ff").opacity(0.2)
            )
        )
    }
}
