//
//  Color.Theme.github.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
    public static var github: Self {
        .init(
            gray: .init(light: .hex("656d76"), dark: .hex("7d8590")),
            blue: .init(light: .hex("0969da"), dark: .hex("2f81f7")),
            green: .init(light: .hex("1a7f37"), dark: .hex("3fb950")),
            purple: .init(light: .hex("8250df"), dark: .hex("a371f7")),
            red: .init(light: .hex("d1242f"), dark: .hex("f85149")),
            yellow: .init(light: .hex("9a6700"), dark: .hex("d29922")),
            orange: .init(light: .hex("fb8500"), dark: .hex("f0883e")),
            teal: .init(light: .hex("1b7c83"), dark: .hex("39c5cf")),
            cyan: .init(light: .hex("0969da"), dark: .hex("58a6ff")),
            pink: .init(light: .hex("bf3989"), dark: .hex("f778ba")),
            brown: .init(light: .hex("953800"), dark: .hex("bd561d")),
            black: .init(light: .hex("1f2328"), dark: .hex("010409")),
            offBlack: .init(light: .hex("24292f"), dark: .hex("0d1117")),
            white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            offWhite: .init(light: .hex("f6f8fa"), dark: .hex("f0f6fc")),
            text: .github,
            background: .github,
            border: .github,
            branding: .github
        )
    }
}

extension HTMLColor.Theme.Text {
    static var github: Self {
        .init(
            primary: .init(light: .hex("1f2328"), dark: .hex("e6edf3")),
            secondary: .init(light: .hex("656d76"), dark: .hex("7d8590")),
            tertiary: .init(light: .hex("959da5"), dark: .hex("484f58")),
            link: .init(light: .hex("0969da"), dark: .hex("58a6ff")),
            button: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
            error: .init(light: .hex("d1242f"), dark: .hex("f85149")),
            success: .init(light: .hex("1a7f37"), dark: .hex("3fb950")),
            warning: .init(light: .hex("9a6700"), dark: .hex("d29922")),
            inverted: .init(light: .hex("ffffff"), dark: .hex("010409")),
            disabled: .init(light: .hex("8c959f"), dark: .hex("484f58"))
        )
    }
}

extension HTMLColor.Theme.Background {
    public static var github: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("0d1117")),
            secondary: .init(light: .hex("f6f8fa"), dark: .hex("161b22")),
            tertiary: .init(light: .hex("ffffff"), dark: .hex("21262d")),
            elevated: .init(light: .hex("ffffff"), dark: .hex("161b22")),
            grouped: .init(light: .hex("f6f8fa"), dark: .hex("010409")),
            selected: .init(light: .hex("0969da").opacity(0.1), dark: .hex("388bfd").opacity(0.2)),
            highlighted: .init(light: .hex("0969da").opacity(0.15), dark: .hex("1158c7").opacity(0.4)),
            button: .init(light: .hex("2ea043"), dark: .hex("238636")),
            error: .init(light: .hex("ffebe9"), dark: .hex("85141c")),
            success: .init(light: .hex("dafbe1"), dark: .hex("0f2816")),
            warning: .init(light: .hex("fff8c5"), dark: .hex("3a2200"))
        )
    }
}

extension HTMLColor.Theme.Border {
    public static var github: Self {
        .init(
            primary: .init(light: .hex("ffffff"), dark: .hex("0d1117")),
            secondary: .init(light: .hex("f6f8fa"), dark: .hex("161b22")),
            tertiary: .init(light: .hex("ffffff"), dark: .hex("21262d")),
            selected: .init(light: .hex("0969da").opacity(0.1), dark: .hex("388bfd").opacity(0.2)),
            highlighted: .init(light: .hex("0969da").opacity(0.15), dark: .hex("1158c7").opacity(0.4)),
            button: .init(light: .hex("2ea043"), dark: .hex("238636")),
            error: .init(light: .hex("ffebe9"), dark: .hex("85141c")),
            success: .init(light: .hex("dafbe1"), dark: .hex("0f2816")),
            warning: .init(light: .hex("fff8c5"), dark: .hex("3a2200"))
        )
    }
}

extension HTMLColor.Theme.Branding {
    public static var github: Self {
        .init(
            primary: .init(light: .hex("0969da"), dark: .hex("58a6ff")),
            secondary: .init(light: .hex("2ea043"), dark: .hex("3fb950")),
            accent: .init(light: .hex("fb8500"), dark: .hex("f0883e")),
            primarySubtle: .init(light: .hex("ddf4ff"), dark: .hex("0c2d6b")),
            secondarySubtle: .init(light: .hex("dafbe1"), dark: .hex("0f2816"))
        )
    }
}
