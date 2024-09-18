////
////  HTMLColor.swift
////
////
////  Created by Coen ten Thije Boonkkamp
////
//

import Foundation

public struct HTMLColor: Sendable {
    public let light: CSS.Color
    public let dark: CSS.Color?
    
    public init(light: CSS.Color, dark: CSS.Color? = nil) {
        self.light = light
        if let dark = dark {
            self.dark = dark
        } else {
            self.dark = light.darker()
        }
    }
}

extension HTMLColor {
    public init(_ color: CSS.Color){
        self = .init(
            light: color,
            dark: color.darker()
        )
    }
}

extension HTMLColor {
    
    public static func keyword(_ keyword: CSS.Color.Keyword) -> HTMLColor {
        return HTMLColor(.keyword(keyword))
    }
    
    public static func hex(_ hex: String) -> HTMLColor {
        return HTMLColor(.hex(hex))
    }
    
    public static func rgb(red: Int, green: Int, blue: Int) -> HTMLColor {
        return HTMLColor(.rgb(red: red, green: green, blue: blue))
    }
    
    public static func rgba(red: Int, green: Int, blue: Int, alpha: Double) -> HTMLColor {
        return HTMLColor(.rgba(red: red, green: green, blue: blue, alpha: alpha))
    }
    
    public static func hsl(hue: Int, saturation: Double, lightness: Double) -> HTMLColor {
        return HTMLColor(.hsl(hue: hue, saturation: saturation, lightness: lightness))
    }
    
    public static func hsla(hue: Int, saturation: Double, lightness: Double, alpha: Double) -> HTMLColor {
        return HTMLColor(.hsla(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha))
    }
    
    public static func hwb(hue: Int, whiteness: Double, blackness: Double) -> HTMLColor {
        return HTMLColor(.hwb(hue: hue, whiteness: whiteness, blackness: blackness))
    }
    
    public static func lab(lightness: Double, a: Double, b: Double) -> HTMLColor {
        return HTMLColor(.lab(lightness: lightness, a: a, b: b))
    }
    
    public static func lch(lightness: Double, chroma: Double, hue: Double) -> HTMLColor {
        return HTMLColor(.lch(lightness: lightness, chroma: chroma, hue: hue))
    }
    
    public static func system(_ system: CSS.Color.SystemColor) -> HTMLColor {
        return HTMLColor(.system(system))
    }
    
    public static func global(_ global: CSS.Color.Global) -> HTMLColor {
        return HTMLColor(.global(global))
    }
    
    public static let currentColor: HTMLColor = HTMLColor(.currentColor)
    public static let transparent: HTMLColor = HTMLColor(.transparent)
}



extension HTMLColor: CustomStringConvertible {
    public var description: String {
        if let dark = dark {
            return "@media (prefers-color-scheme: light) { \(light) } @media (prefers-color-scheme: dark) { \(dark) }"
        } else {
            return light.description
        }
    }
}

extension HTMLColor {
    public func map(_ transform: (CSS.Color) -> CSS.Color) -> HTMLColor {
        HTMLColor(
            light: transform(light),
            dark: dark.map(transform)
        )
    }
    
    public func flatMap(_ transform: (CSS.Color) -> HTMLColor) -> HTMLColor {
        let lightTransformed = transform(light)
        let darkTransformed = dark.map(transform)
        
        return HTMLColor(
            light: lightTransformed.light,
            dark: darkTransformed?.dark ?? lightTransformed.dark
        )
    }
}

extension HTMLColor {
    public func adjustBrightness(by percentage: Double) -> HTMLColor {
        self.map { $0.adjustBrightness(by: percentage) }
    }
    
    public func darker(by percentage: Double = 0.2) -> HTMLColor {
        self.map { $0.darker(by: percentage) }
    }
    
    public func lighter(by percentage: Double = 0.2) -> HTMLColor {
        self.map { $0.lighter(by: percentage) }
    }
}

extension HTMLColor {
    @available(*, deprecated, renamed: "withDarkColor(_:)")
    public func dark(_ color: CSS.Color) -> Self {
        withDarkColor(color)
    }
    
    @available(*, deprecated, renamed: "withLightColor(_:)")
    public func light(_ color: CSS.Color) -> Self {
        withLightColor(color)
    }
    
    public func withDarkColor(_ color: CSS.Color) -> Self {
        HTMLColor(light: self.light, dark: color)
    }
    
    public func withLightColor(_ color: CSS.Color) -> Self {
        HTMLColor(light: color, dark: self.dark)
    }
}

extension HTMLColor {
    public static func gray(_ value: UInt8) -> Self {
        let lightHex = String(format: "%02X", value)
        let darkHex = String(format: "%02X", 255 - value)
        return Self(light: .hex(lightHex + lightHex + lightHex))
            .withDarkColor(.hex(darkHex + darkHex + darkHex))
    }
    
    @_disfavoredOverload
    public static func gray(_ value: Double) -> Self {
        gray(UInt8(255 * value))
    }
}

extension HTMLColor {
    public static let gray100 = HTMLColor(light: .gray100, dark: .hex("f7f7f7"))
    public static let gray150 = HTMLColor(light: .gray150, dark: .hex("f0f0f0"))
    public static let gray200 = HTMLColor(light: .gray200, dark: .hex("e0e0e0"))
    public static let gray250 = HTMLColor(light: .gray250, dark: .hex("d0d0d0"))
    public static let gray300 = HTMLColor(light: .gray300, dark: .hex("c0c0c0"))
    public static let gray350 = HTMLColor(light: .gray350, dark: .hex("a0a0a0"))
    public static let gray400 = HTMLColor(light: .gray400, dark: .hex("909090"))
    public static let gray450 = HTMLColor(light: .gray450, dark: .hex("808080"))
    public static let gray500 = HTMLColor(light: .gray500, dark: .hex("707070"))
    public static let gray550 = HTMLColor(light: .gray550, dark: .hex("606060"))
    public static let gray600 = HTMLColor(light: .gray600, dark: .hex("606060"))
    public static let gray650 = HTMLColor(light: .gray650, dark: .hex("505050"))
    public static let gray700 = HTMLColor(light: .gray700, dark: .hex("404040"))
    public static let gray750 = HTMLColor(light: .gray750, dark: .hex("303030"))
    public static let gray800 = HTMLColor(light: .gray800, dark: .hex("303030"))
    public static let gray850 = HTMLColor(light: .gray850, dark: .hex("202020"))
    public static let gray900 = HTMLColor(light: .gray900, dark: .hex("101010"))
}

extension HTMLColor {
    public static let blue100 = Self(light: .blue100, dark: .hex("e6f3ff"))
    public static let blue150 = Self(light: .blue150, dark: .hex("ccddee"))
    public static let blue200 = Self(light: .blue200, dark: .hex("bbccdd"))
    public static let blue250 = Self(light: .blue250, dark: .hex("99bbcc"))
    public static let blue300 = Self(light: .blue300, dark: .hex("7799bb"))
    public static let blue350 = Self(light: .blue350, dark: .hex("5588aa"))
    public static let blue400 = Self(light: .blue400, dark: .hex("336699"))
    public static let blue450 = Self(light: .blue450, dark: .hex("115588"))
    public static let blue500 = Self(light: .blue500, dark: .hex("004477"))
    public static let blue550 = Self(light: .blue550, dark: .hex("004466"))
    public static let blue600 = Self(light: .blue600, dark: .hex("003366"))
    public static let blue650 = Self(light: .blue650, dark: .hex("002255"))
    public static let blue700 = Self(light: .blue700, dark: .hex("001144"))
    public static let blue750 = Self(light: .blue750, dark: .hex("002244"))
    public static let blue800 = Self(light: .blue800, dark: .hex("001133"))
    public static let blue850 = Self(light: .blue850, dark: .hex("001122"))
    public static let blue900 = Self(light: .blue900, dark: .hex("001011"))
}

extension HTMLColor {
    public static let green100 = Self(light: .green100, dark: .hex("e6ffe6"))
    public static let green150 = Self(light: .green150, dark: .hex("ccffcc"))
    public static let green200 = Self(light: .green200, dark: .hex("bbeebb"))
    public static let green250 = Self(light: .green250, dark: .hex("99dd99"))
    public static let green300 = Self(light: .green300, dark: .hex("77cc77"))
    public static let green350 = Self(light: .green350, dark: .hex("55bb55"))
    public static let green400 = Self(light: .green400, dark: .hex("33aa33"))
    public static let green450 = Self(light: .green450, dark: .hex("229922"))
    public static let green500 = Self(light: .green500, dark: .hex("008800"))
    public static let green550 = Self(light: .green550, dark: .hex("006600"))
    public static let green600 = Self(light: .green600, dark: .hex("007700"))
    public static let green650 = Self(light: .green650, dark: .hex("006600"))
    public static let green700 = Self(light: .green700, dark: .hex("005500"))
    public static let green750 = Self(light: .green750, dark: .hex("004400"))
    public static let green800 = Self(light: .green800, dark: .hex("004400"))
    public static let green850 = Self(light: .green850, dark: .hex("003300"))
    public static let green900 = Self(light: .green900, dark: .hex("002200"))
}

extension HTMLColor {
    public static let purple100 = Self(light: .purple100, dark: .hex("f0e6ff"))
    public static let purple150 = Self(light: .purple150, dark: .hex("e6ccf5"))
    public static let purple200 = Self(light: .purple200, dark: .hex("d9b3ea"))
    public static let purple250 = Self(light: .purple250, dark: .hex("cc80e6"))
    public static let purple300 = Self(light: .purple300, dark: .hex("b366d6"))
    public static let purple350 = Self(light: .purple350, dark: .hex("a300cc"))
    public static let purple400 = Self(light: .purple400, dark: .hex("8f00b3"))
    public static let purple450 = Self(light: .purple450, dark: .hex("7f0099"))
    public static let purple500 = Self(light: .purple500, dark: .hex("6e0088"))
    public static let purple550 = Self(light: .purple550, dark: .hex("5d0077"))
    public static let purple600 = Self(light: .purple600, dark: .hex("5d0066"))
    public static let purple650 = Self(light: .purple650, dark: .hex("4c0055"))
    public static let purple700 = Self(light: .purple700, dark: .hex("3b0044"))
    public static let purple750 = Self(light: .purple750, dark: .hex("3b0033"))
    public static let purple800 = Self(light: .purple800, dark: .hex("2a0033"))
    public static let purple850 = Self(light: .purple850, dark: .hex("200022"))
    public static let purple900 = Self(light: .purple900, dark: .hex("110011"))
}

extension HTMLColor {
    public static let red100 = Self(light: .red100, dark: .hex("ffe6e6"))
    public static let red150 = Self(light: .red150, dark: .hex("ffcccc"))
    public static let red200 = Self(light: .red200, dark: .hex("ffb3b3"))
    public static let red250 = Self(light: .red250, dark: .hex("ff9999"))
    public static let red300 = Self(light: .red300, dark: .hex("ff8080"))
    public static let red350 = Self(light: .red350, dark: .hex("ff6666"))
    public static let red400 = Self(light: .red400, dark: .hex("ff4d4d"))
    public static let red450 = Self(light: .red450, dark: .hex("ff3333"))
    public static let red500 = Self(light: .red500, dark: .hex("ff1a1a"))
    public static let red550 = Self(light: .red550, dark: .hex("cc0000"))
    public static let red600 = Self(light: .red600, dark: .hex("ff0000"))
    public static let red650 = Self(light: .red650, dark: .hex("dd0000"))
    public static let red700 = Self(light: .red700, dark: .hex("bb0000"))
    public static let red750 = Self(light: .red750, dark: .hex("aa0000"))
    public static let red800 = Self(light: .red800, dark: .hex("990000"))
    public static let red850 = Self(light: .red850, dark: .hex("770000"))
    public static let red900 = Self(light: .red900, dark: .hex("550000"))
}

extension HTMLColor {
    public static let yellow100 = Self(light: .yellow100, dark: .hex("fffff2"))
    public static let yellow150 = Self(light: .yellow150, dark: .hex("ffffcc"))
    public static let yellow200 = Self(light: .yellow200, dark: .hex("ffffb3"))
    public static let yellow250 = Self(light: .yellow250, dark: .hex("ffff99"))
    public static let yellow300 = Self(light: .yellow300, dark: .hex("ffff80"))
    public static let yellow350 = Self(light: .yellow350, dark: .hex("ffff66"))
    public static let yellow400 = Self(light: .yellow400, dark: .hex("ffff4d"))
    public static let yellow450 = Self(light: .yellow450, dark: .hex("ffff33"))
    public static let yellow500 = Self(light: .yellow500, dark: .hex("ffff1a"))
    public static let yellow550 = Self(light: .yellow550, dark: .hex("d6d600"))
    public static let yellow600 = Self(light: .yellow600, dark: .hex("e6e600"))
    public static let yellow650 = Self(light: .yellow650, dark: .hex("cccc00"))
    public static let yellow700 = Self(light: .yellow700, dark: .hex("b3b300"))
    public static let yellow750 = Self(light: .yellow750, dark: .hex("b3b300"))
    public static let yellow800 = Self(light: .yellow800, dark: .hex("999900"))
    public static let yellow850 = Self(light: .yellow850, dark: .hex("808000"))
    public static let yellow900 = Self(light: .yellow900, dark: .hex("666600"))
}

extension HTMLColor {
    public static let orange100 = Self(light: .orange100, dark: .hex("fff4e6"))
    public static let orange150 = Self(light: .orange150, dark: .hex("ffe6cc"))
    public static let orange200 = Self(light: .orange200, dark: .hex("ffd9b3"))
    public static let orange250 = Self(light: .orange250, dark: .hex("ffcc99"))
    public static let orange300 = Self(light: .orange300, dark: .hex("ffbf80"))
    public static let orange350 = Self(light: .orange350, dark: .hex("ffb366"))
    public static let orange400 = Self(light: .orange400, dark: .hex("ffa64d"))
    public static let orange450 = Self(light: .orange450, dark: .hex("ff9933"))
    public static let orange500 = Self(light: .orange500, dark: .hex("ff8c1a"))
    public static let orange550 = Self(light: .orange550, dark: .hex("a64d00"))
    public static let orange600 = Self(light: .orange600, dark: .hex("ff8000"))
    public static let orange650 = Self(light: .orange650, dark: .hex("cc6600"))
    public static let orange700 = Self(light: .orange700, dark: .hex("b35900"))
    public static let orange750 = Self(light: .orange750, dark: .hex("773300"))
    public static let orange800 = Self(light: .orange800, dark: .hex("884400"))
    public static let orange850 = Self(light: .orange850, dark: .hex("663300"))
    public static let orange900 = Self(light: .orange900, dark: .hex("553300"))
}

extension HTMLColor {
    public static let teal100 = Self(light: .teal100, dark: .hex("e6ffff"))
    public static let teal150 = Self(light: .teal150, dark: .hex("ccffeb"))
    public static let teal200 = Self(light: .teal200, dark: .hex("bbffe6"))
    public static let teal250 = Self(light: .teal250, dark: .hex("aaffdd"))
    public static let teal300 = Self(light: .teal300, dark: .hex("88ffd1"))
    public static let teal350 = Self(light: .teal350, dark: .hex("66ffc4"))
    public static let teal400 = Self(light: .teal400, dark: .hex("33ffb8"))
    public static let teal450 = Self(light: .teal450, dark: .hex("00ffaa"))
    public static let teal500 = Self(light: .teal500, dark: .hex("00e699"))
    public static let teal550 = Self(light: .teal550, dark: .hex("007777"))
    public static let teal600 = Self(light: .teal600, dark: .hex("00cc88"))
    public static let teal650 = Self(light: .teal650, dark: .hex("00b377"))
    public static let teal700 = Self(light: .teal700, dark: .hex("009966"))
    public static let teal750 = Self(light: .teal750, dark: .hex("005544"))
    public static let teal800 = Self(light: .teal800, dark: .hex("008855"))
    public static let teal850 = Self(light: .teal850, dark: .hex("007744"))
    public static let teal900 = Self(light: .teal900, dark: .hex("006633"))
}

extension HTMLColor {
    public static let cyan100 = Self.teal100
    public static let cyan150 = Self.teal150
    public static let cyan200 = Self.teal200
    public static let cyan250 = Self.teal250
    public static let cyan300 = Self.teal300
    public static let cyan350 = Self.teal350
    public static let cyan400 = Self.teal400
    public static let cyan450 = Self.teal450
    public static let cyan500 = Self.teal500
    public static let cyan550 = Self.teal550
    public static let cyan600 = Self.teal600
    public static let cyan650 = Self.teal650
    public static let cyan700 = Self.teal700
    public static let cyan750 = Self.teal750
    public static let cyan800 = Self.teal800
    public static let cyan850 = Self.teal850
    public static let cyan900 = Self.teal900
}

extension HTMLColor {
    public static let pink100 = Self(light: .pink100, dark: .hex("ffe6f0"))
    public static let pink150 = Self(light: .pink150, dark: .hex("ffe6f2"))
    public static let pink200 = Self(light: .pink200, dark: .hex("ffccde"))
    public static let pink250 = Self(light: .pink250, dark: .hex("ff99cc"))
    public static let pink300 = Self(light: .pink300, dark: .hex("ff66b3"))
    public static let pink350 = Self(light: .pink350, dark: .hex("ff4da6"))
    public static let pink400 = Self(light: .pink400, dark: .hex("ff3399"))
    public static let pink450 = Self(light: .pink450, dark: .hex("ff1a80"))
    public static let pink500 = Self(light: .pink500, dark: .hex("ff0066"))
    public static let pink550 = Self(light: .pink550, dark: .hex("cc0044"))
    public static let pink600 = Self(light: .pink600, dark: .hex("e6005c"))
    public static let pink650 = Self(light: .pink650, dark: .hex("cc0052"))
    public static let pink700 = Self(light: .pink700, dark: .hex("b30047"))
    public static let pink750 = Self(light: .pink750, dark: .hex("aa0044"))
    public static let pink800 = Self(light: .pink800, dark: .hex("99003d"))
    public static let pink850 = Self(light: .pink850, dark: .hex("770033"))
    public static let pink900 = Self(light: .pink900, dark: .hex("550029"))
}

extension HTMLColor {
    public static let brown100 = Self(light: .brown100, dark: .hex("f7e6d9"))
    public static let brown150 = Self(light: .brown150, dark: .hex("ffebcc"))
    public static let brown200 = Self(light: .brown200, dark: .hex("ffddaa"))
    public static let brown250 = Self(light: .brown250, dark: .hex("ffcc88"))
    public static let brown300 = Self(light: .brown300, dark: .hex("ffbb66"))
    public static let brown350 = Self(light: .brown350, dark: .hex("ffaa44"))
    public static let brown400 = Self(light: .brown400, dark: .hex("ff9933"))
    public static let brown450 = Self(light: .brown450, dark: .hex("ff8822"))
    public static let brown500 = Self(light: .brown500, dark: .hex("ff7700"))
    public static let brown550 = Self(light: .brown550, dark: .hex("b34d00"))
    public static let brown600 = Self(light: .brown600, dark: .hex("e66a00"))
    public static let brown650 = Self(light: .brown650, dark: .hex("cc5e00"))
    public static let brown700 = Self(light: .brown700, dark: .hex("b35200"))
    public static let brown750 = Self(light: .brown750, dark: .hex("aa5500"))
    public static let brown800 = Self(light: .brown800, dark: .hex("994700"))
    public static let brown850 = Self(light: .brown850, dark: .hex("773b00"))
    public static let brown900 = Self(light: .brown900, dark: .hex("553000"))
}

extension HTMLColor {
    public static let black = Self.init(light: .hex("121212"))
    public static let offBlack = Self.init(light: .hex("171717"))
    public static let white = Self.init(light: .hex("fff"))
    public static let offWhite = Self.init(light: .hex("fafafa"))
    
    public static let cyan = Self.teal500
    public static let teal = Self.teal500
    public static let pink = Self.pink500
    public static let brown = Self.brown500
    
    public static let orange = Self.orange500
    public static let green = Self.green500
    public static let purple = Self.purple500
    public static let blue = Self.blue500
    public static let red = Self.red500
    public static let yellow = Self.yellow500
}

extension HTMLColor {
    public static let cardBackground: Self = .init(
        light: .rgb(red: 245, green: 246, blue: 248),
        dark: .rgb(red: 30, green: 30, blue: 35)
    )
}


extension HTMLColor {
    public static let buttonBackground: Self = .init(
        light: .hsla(hue: 220, saturation: 15, lightness: 92, alpha: 0.85),
        dark: .hsla(hue: 220, saturation: 15, lightness: 15, alpha: 0.85)
    )
}




