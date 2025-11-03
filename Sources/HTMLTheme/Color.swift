//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 18/09/2024.
//

import Foundation

extension HTMLColor {
  public func reverse() -> Self {
    .init(
      light: self.dark,
      dark: self.light
    )
  }
}

extension HTMLColor {
  public static let gray100: Self = .init(light: .gray100, dark: .hex("f7f7f7"))
  public static let gray150: Self = .init(light: .gray150, dark: .hex("f0f0f0"))
  public static let gray200: Self = .init(light: .gray200, dark: .hex("e0e0e0"))
  public static let gray250: Self = .init(light: .gray250, dark: .hex("d0d0d0"))
  public static let gray300: Self = .init(light: .gray300, dark: .hex("c0c0c0"))
  public static let gray350: Self = .init(light: .gray350, dark: .hex("a0a0a0"))
  public static let gray400: Self = .init(light: .gray400, dark: .hex("909090"))
  public static let gray450: Self = .init(light: .gray450, dark: .hex("808080"))
  public static let gray500: Self = .init(light: .gray500, dark: .hex("707070"))
  public static let gray550: Self = .init(light: .gray550, dark: .hex("606060"))
  public static let gray600: Self = .init(light: .gray600, dark: .hex("606060"))
  public static let gray650: Self = .init(light: .gray650, dark: .hex("505050"))
  public static let gray700: Self = .init(light: .gray700, dark: .hex("404040"))
  public static let gray750: Self = .init(light: .gray750, dark: .hex("303030"))
  public static let gray800: Self = .init(light: .gray800, dark: .hex("303030"))
  public static let gray850: Self = .init(light: .gray850, dark: .hex("202020"))
  public static let gray900: Self = .init(light: .gray900, dark: .hex("101010"))
}

extension HTMLColor {
  public static let blue100: Self = .init(light: .blue100, dark: .hex("e6f3ff"))
  public static let blue150: Self = .init(light: .blue150, dark: .hex("ccddee"))
  public static let blue200: Self = .init(light: .blue200, dark: .hex("bbccdd"))
  public static let blue250: Self = .init(light: .blue250, dark: .hex("99bbcc"))
  public static let blue300: Self = .init(light: .blue300, dark: .hex("7799bb"))
  public static let blue350: Self = .init(light: .blue350, dark: .hex("5588aa"))
  public static let blue400: Self = .init(light: .blue400, dark: .hex("336699"))
  public static let blue450: Self = .init(light: .blue450, dark: .hex("115588"))
  public static let blue500: Self = .init(light: .blue500, dark: .hex("004477"))
  public static let blue550: Self = .init(light: .blue550, dark: .hex("004466"))
  public static let blue600: Self = .init(light: .blue600, dark: .hex("003366"))
  public static let blue650: Self = .init(light: .blue650, dark: .hex("002255"))
  public static let blue700: Self = .init(light: .blue700, dark: .hex("001144"))
  public static let blue750: Self = .init(light: .blue750, dark: .hex("002244"))
  public static let blue800: Self = .init(light: .blue800, dark: .hex("001133"))
  public static let blue850: Self = .init(light: .blue850, dark: .hex("001122"))
  public static let blue900: Self = .init(light: .blue900, dark: .hex("001011"))
}

extension HTMLColor {
  public static let green100: Self = .init(light: .green100, dark: .hex("e6ffe6"))
  public static let green150: Self = .init(light: .green150, dark: .hex("ccffcc"))
  public static let green200: Self = .init(light: .green200, dark: .hex("bbeebb"))
  public static let green250: Self = .init(light: .green250, dark: .hex("99dd99"))
  public static let green300: Self = .init(light: .green300, dark: .hex("77cc77"))
  public static let green350: Self = .init(light: .green350, dark: .hex("55bb55"))
  public static let green400: Self = .init(light: .green400, dark: .hex("33aa33"))
  public static let green450: Self = .init(light: .green450, dark: .hex("229922"))
  public static let green500: Self = .init(light: .green500, dark: .hex("008800"))
  public static let green550: Self = .init(light: .green550, dark: .hex("006600"))
  public static let green600: Self = .init(light: .green600, dark: .hex("007700"))
  public static let green650: Self = .init(light: .green650, dark: .hex("006600"))
  public static let green700: Self = .init(light: .green700, dark: .hex("005500"))
  public static let green750: Self = .init(light: .green750, dark: .hex("004400"))
  public static let green800: Self = .init(light: .green800, dark: .hex("004400"))
  public static let green850: Self = .init(light: .green850, dark: .hex("003300"))
  public static let green900: Self = .init(light: .green900, dark: .hex("002200"))
}

extension HTMLColor {
  public static let purple100: Self = .init(light: .purple100, dark: .hex("f0e6ff"))
  public static let purple150: Self = .init(light: .purple150, dark: .hex("e6ccf5"))
  public static let purple200: Self = .init(light: .purple200, dark: .hex("d9b3ea"))
  public static let purple250: Self = .init(light: .purple250, dark: .hex("cc80e6"))
  public static let purple300: Self = .init(light: .purple300, dark: .hex("b366d6"))
  public static let purple350: Self = .init(light: .purple350, dark: .hex("a300cc"))
  public static let purple400: Self = .init(light: .purple400, dark: .hex("8f00b3"))
  public static let purple450: Self = .init(light: .purple450, dark: .hex("7f0099"))
  public static let purple500: Self = .init(light: .purple500, dark: .hex("6e0088"))
  public static let purple550: Self = .init(light: .purple550, dark: .hex("5d0077"))
  public static let purple600: Self = .init(light: .purple600, dark: .hex("5d0066"))
  public static let purple650: Self = .init(light: .purple650, dark: .hex("4c0055"))
  public static let purple700: Self = .init(light: .purple700, dark: .hex("3b0044"))
  public static let purple750: Self = .init(light: .purple750, dark: .hex("3b0033"))
  public static let purple800: Self = .init(light: .purple800, dark: .hex("2a0033"))
  public static let purple850: Self = .init(light: .purple850, dark: .hex("200022"))
  public static let purple900: Self = .init(light: .purple900, dark: .hex("110011"))
}

extension HTMLColor {
  public static let red100: Self = .init(light: .red100, dark: .hex("ffe6e6"))
  public static let red150: Self = .init(light: .red150, dark: .hex("ffcccc"))
  public static let red200: Self = .init(light: .red200, dark: .hex("ffb3b3"))
  public static let red250: Self = .init(light: .red250, dark: .hex("ff9999"))
  public static let red300: Self = .init(light: .red300, dark: .hex("ff8080"))
  public static let red350: Self = .init(light: .red350, dark: .hex("ff6666"))
  public static let red400: Self = .init(light: .red400, dark: .hex("ff4d4d"))
  public static let red450: Self = .init(light: .red450, dark: .hex("ff3333"))
  public static let red500: Self = .init(light: .red500, dark: .hex("ff1a1a"))
  public static let red550: Self = .init(light: .red550, dark: .hex("cc0000"))
  public static let red600: Self = .init(light: .red600, dark: .hex("ff0000"))
  public static let red650: Self = .init(light: .red650, dark: .hex("dd0000"))
  public static let red700: Self = .init(light: .red700, dark: .hex("bb0000"))
  public static let red750: Self = .init(light: .red750, dark: .hex("aa0000"))
  public static let red800: Self = .init(light: .red800, dark: .hex("990000"))
  public static let red850: Self = .init(light: .red850, dark: .hex("770000"))
  public static let red900: Self = .init(light: .red900, dark: .hex("550000"))
}

extension HTMLColor {
  public static let yellow100: Self = .init(light: .yellow100, dark: .hex("fffff2"))
  public static let yellow150: Self = .init(light: .yellow150, dark: .hex("ffffcc"))
  public static let yellow200: Self = .init(light: .yellow200, dark: .hex("ffffb3"))
  public static let yellow250: Self = .init(light: .yellow250, dark: .hex("ffff99"))
  public static let yellow300: Self = .init(light: .yellow300, dark: .hex("ffff80"))
  public static let yellow350: Self = .init(light: .yellow350, dark: .hex("ffff66"))
  public static let yellow400: Self = .init(light: .yellow400, dark: .hex("ffff4d"))
  public static let yellow450: Self = .init(light: .yellow450, dark: .hex("ffff33"))
  public static let yellow500: Self = .init(light: .yellow500, dark: .hex("ffff1a"))
  public static let yellow550: Self = .init(light: .yellow550, dark: .hex("d6d600"))
  public static let yellow600: Self = .init(light: .yellow600, dark: .hex("e6e600"))
  public static let yellow650: Self = .init(light: .yellow650, dark: .hex("cccc00"))
  public static let yellow700: Self = .init(light: .yellow700, dark: .hex("b3b300"))
  public static let yellow750: Self = .init(light: .yellow750, dark: .hex("b3b300"))
  public static let yellow800: Self = .init(light: .yellow800, dark: .hex("999900"))
  public static let yellow850: Self = .init(light: .yellow850, dark: .hex("808000"))
  public static let yellow900: Self = .init(light: .yellow900, dark: .hex("666600"))
}

extension HTMLColor {
  public static let orange100: Self = .init(light: .orange100, dark: .hex("fff4e6"))
  public static let orange150: Self = .init(light: .orange150, dark: .hex("ffe6cc"))
  public static let orange200: Self = .init(light: .orange200, dark: .hex("ffd9b3"))
  public static let orange250: Self = .init(light: .orange250, dark: .hex("ffcc99"))
  public static let orange300: Self = .init(light: .orange300, dark: .hex("ffbf80"))
  public static let orange350: Self = .init(light: .orange350, dark: .hex("ffb366"))
  public static let orange400: Self = .init(light: .orange400, dark: .hex("ffa64d"))
  public static let orange450: Self = .init(light: .orange450, dark: .hex("ff9933"))
  public static let orange500: Self = .init(light: .orange500, dark: .hex("ff8c1a"))
  public static let orange550: Self = .init(light: .orange550, dark: .hex("a64d00"))
  public static let orange600: Self = .init(light: .orange600, dark: .hex("ff8000"))
  public static let orange650: Self = .init(light: .orange650, dark: .hex("cc6600"))
  public static let orange700: Self = .init(light: .orange700, dark: .hex("b35900"))
  public static let orange750: Self = .init(light: .orange750, dark: .hex("773300"))
  public static let orange800: Self = .init(light: .orange800, dark: .hex("884400"))
  public static let orange850: Self = .init(light: .orange850, dark: .hex("663300"))
  public static let orange900: Self = .init(light: .orange900, dark: .hex("553300"))
}

extension HTMLColor {
  public static let teal100: Self = .init(light: .teal100, dark: .hex("e6ffff"))
  public static let teal150: Self = .init(light: .teal150, dark: .hex("ccffeb"))
  public static let teal200: Self = .init(light: .teal200, dark: .hex("bbffe6"))
  public static let teal250: Self = .init(light: .teal250, dark: .hex("aaffdd"))
  public static let teal300: Self = .init(light: .teal300, dark: .hex("88ffd1"))
  public static let teal350: Self = .init(light: .teal350, dark: .hex("66ffc4"))
  public static let teal400: Self = .init(light: .teal400, dark: .hex("33ffb8"))
  public static let teal450: Self = .init(light: .teal450, dark: .hex("00ffaa"))
  public static let teal500: Self = .init(light: .teal500, dark: .hex("00e699"))
  public static let teal550: Self = .init(light: .teal550, dark: .hex("007777"))
  public static let teal600: Self = .init(light: .teal600, dark: .hex("00cc88"))
  public static let teal650: Self = .init(light: .teal650, dark: .hex("00b377"))
  public static let teal700: Self = .init(light: .teal700, dark: .hex("009966"))
  public static let teal750: Self = .init(light: .teal750, dark: .hex("005544"))
  public static let teal800: Self = .init(light: .teal800, dark: .hex("008855"))
  public static let teal850: Self = .init(light: .teal850, dark: .hex("007744"))
  public static let teal900: Self = .init(light: .teal900, dark: .hex("006633"))
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
  public static let pink100: Self = .init(light: .pink100, dark: .hex("ffe6f0"))
  public static let pink150: Self = .init(light: .pink150, dark: .hex("ffe6f2"))
  public static let pink200: Self = .init(light: .pink200, dark: .hex("ffccde"))
  public static let pink250: Self = .init(light: .pink250, dark: .hex("ff99cc"))
  public static let pink300: Self = .init(light: .pink300, dark: .hex("ff66b3"))
  public static let pink350: Self = .init(light: .pink350, dark: .hex("ff4da6"))
  public static let pink400: Self = .init(light: .pink400, dark: .hex("ff3399"))
  public static let pink450: Self = .init(light: .pink450, dark: .hex("ff1a80"))
  public static let pink500: Self = .init(light: .pink500, dark: .hex("ff0066"))
  public static let pink550: Self = .init(light: .pink550, dark: .hex("cc0044"))
  public static let pink600: Self = .init(light: .pink600, dark: .hex("e6005c"))
  public static let pink650: Self = .init(light: .pink650, dark: .hex("cc0052"))
  public static let pink700: Self = .init(light: .pink700, dark: .hex("b30047"))
  public static let pink750: Self = .init(light: .pink750, dark: .hex("aa0044"))
  public static let pink800: Self = .init(light: .pink800, dark: .hex("99003d"))
  public static let pink850: Self = .init(light: .pink850, dark: .hex("770033"))
  public static let pink900: Self = .init(light: .pink900, dark: .hex("550029"))
}

extension HTMLColor {
  public static let brown100: Self = .init(light: .brown100, dark: .hex("f7e6d9"))
  public static let brown150: Self = .init(light: .brown150, dark: .hex("ffebcc"))
  public static let brown200: Self = .init(light: .brown200, dark: .hex("ffddaa"))
  public static let brown250: Self = .init(light: .brown250, dark: .hex("ffcc88"))
  public static let brown300: Self = .init(light: .brown300, dark: .hex("ffbb66"))
  public static let brown350: Self = .init(light: .brown350, dark: .hex("ffaa44"))
  public static let brown400: Self = .init(light: .brown400, dark: .hex("ff9933"))
  public static let brown450: Self = .init(light: .brown450, dark: .hex("ff8822"))
  public static let brown500: Self = .init(light: .brown500, dark: .hex("ff7700"))
  public static let brown550: Self = .init(light: .brown550, dark: .hex("b34d00"))
  public static let brown600: Self = .init(light: .brown600, dark: .hex("e66a00"))
  public static let brown650: Self = .init(light: .brown650, dark: .hex("cc5e00"))
  public static let brown700: Self = .init(light: .brown700, dark: .hex("b35200"))
  public static let brown750: Self = .init(light: .brown750, dark: .hex("aa5500"))
  public static let brown800: Self = .init(light: .brown800, dark: .hex("994700"))
  public static let brown850: Self = .init(light: .brown850, dark: .hex("773b00"))
  public static let brown900: Self = .init(light: .brown900, dark: .hex("553000"))
}

// extension HTML {
//    @discardableResult
//    @HTMLBuilder
//    func color(
//        _ color: HTMLColor?,
//        media: CSSAtRuleTypes.Media? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//        if let color {
//            self.color(light: color.light, dark: color.dark, media: media, pre: pre, pseudo: pseudo)
//        } else {
//            self
//        }
//    }
// }

//
// extension HTML {
//    @discardableResult
//    @HTMLBuilder
//    @_disfavoredOverload
//    func backgroundColor(
//        _ color: HTMLColor?,
//        media: CSSAtRuleTypes.Media? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//        fatalError()
////        if let color {
////            self.color(light: color.light, dark: color.dark, media: media, pre: pre, pseudo: pseudo)
////        } else {
////            self
////        }
//    }
// }

// extension HTML {
//    @discardableResult
//    @HTMLBuilder
//    @_disfavoredOverload
//    public func color2(
//        _ color: CSSPropertyTypes.Color.WithDarkMode.Color?,
//        media: CSSAtRuleTypes.Media? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//        self.color(color.map(CSSPropertyTypes.Color.WithDarkMode.color))
//    }
// }
