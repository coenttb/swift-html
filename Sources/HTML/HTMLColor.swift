//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/09/2024.
//

import Foundation
import PointFreeHtml

extension HTMLColor {
    public static let gray150 = Self(rawValue: "#2a2a2a")
    public static let gray200 = Self(rawValue: "#3a3a3a")
    public static let gray250 = Self(rawValue: "#4a4a4a")
    public static let gray300 = Self(rawValue: "#5a5a5a")
    public static let gray350 = Self(rawValue: "#666666")
    public static let gray400 = Self(rawValue: "#707070")
    public static let gray450 = Self(rawValue: "#808080")
    public static let gray500 = Self(rawValue: "#888888")
    public static let gray600 = Self(rawValue: "#999999")
    public static let gray650 = Self(rawValue: "#aaaaaa")
    public static let gray700 = Self(rawValue: "#bbbbbb")
    public static let gray800 = Self(rawValue: "#d0d0d0")
    public static let gray850 = Self(rawValue: "#e0e0e0")
    public static let gray900 = Self(rawValue: "#f5f5f5")
}

extension HTMLColor {
    public static let blue150 = Self(rawValue: "#001f3f")
    public static let blue200 = Self(rawValue: "#003366")
    public static let blue250 = Self(rawValue: "#004488")
    public static let blue300 = Self(rawValue: "#0055aa")
    public static let blue350 = Self(rawValue: "#0066cc")
    public static let blue400 = Self(rawValue: "#0077ee")
    public static let blue450 = Self(rawValue: "#0088ff")
    public static let blue500 = Self(rawValue: "#3399ff")
    public static let blue600 = Self(rawValue: "#66aaff")
    public static let blue650 = Self(rawValue: "#99bbff")
    public static let blue700 = Self(rawValue: "#b3ccff")
    public static let blue800 = Self(rawValue: "#cce5ff")
    public static let blue850 = Self(rawValue: "#e6f2ff")
    public static let blue900 = Self(rawValue: "#f0f8ff")
}

extension HTMLColor {
    public static let green150 = Self(rawValue: "#003300")
    public static let green200 = Self(rawValue: "#004400")
    public static let green250 = Self(rawValue: "#005500")
    public static let green300 = Self(rawValue: "#006600")
    public static let green350 = Self(rawValue: "#007700")
    public static let green400 = Self(rawValue: "#009900")
    public static let green450 = Self(rawValue: "#00b300")
    public static let green500 = Self(rawValue: "#33cc33")
    public static let green600 = Self(rawValue: "#66d966")
    public static let green650 = Self(rawValue: "#99e699")
    public static let green700 = Self(rawValue: "#b3f0b3")
    public static let green800 = Self(rawValue: "#ccf5cc")
    public static let green850 = Self(rawValue: "#e6ffe6")
    public static let green900 = Self(rawValue: "#f0fff0")
}

extension HTMLColor {
    public static let purple150 = Self(rawValue: "#2a0033")
    public static let purple200 = Self(rawValue: "#3b0044")
    public static let purple250 = Self(rawValue: "#4c0055")
    public static let purple300 = Self(rawValue: "#5d0066")
    public static let purple350 = Self(rawValue: "#6e0088")
    public static let purple400 = Self(rawValue: "#7f0099")
    public static let purple450 = Self(rawValue: "#8f00b3")
    public static let purple500 = Self(rawValue: "#a300cc")
    public static let purple600 = Self(rawValue: "#b366e0")
    public static let purple650 = Self(rawValue: "#cc80e6")
    public static let purple700 = Self(rawValue: "#d9b3f0")
    public static let purple800 = Self(rawValue: "#e6ccf5")
    public static let purple850 = Self(rawValue: "#f2e6ff")
    public static let purple900 = Self(rawValue: "#f9f0ff")
}

extension HTMLColor {
    public static let red150 = Self(rawValue: "#330000")
    public static let red200 = Self(rawValue: "#440000")
    public static let red250 = Self(rawValue: "#550000")
    public static let red300 = Self(rawValue: "#660000")
    public static let red350 = Self(rawValue: "#880000")
    public static let red400 = Self(rawValue: "#990000")
    public static let red450 = Self(rawValue: "#b30000")
    public static let red500 = Self(rawValue: "#cc3333")
    public static let red600 = Self(rawValue: "#e06666")
    public static let red650 = Self(rawValue: "#e69999")
    public static let red700 = Self(rawValue: "#f0b3b3")
    public static let red800 = Self(rawValue: "#f5cccc")
    public static let red850 = Self(rawValue: "#ffe6e6")
    public static let red900 = Self(rawValue: "#fff0f0")
}

extension HTMLColor {
    public static let yellow150 = Self(rawValue: "#333300")
    public static let yellow200 = Self(rawValue: "#444400")
    public static let yellow250 = Self(rawValue: "#555500")
    public static let yellow300 = Self(rawValue: "#666600")
    public static let yellow350 = Self(rawValue: "#808000")
    public static let yellow400 = Self(rawValue: "#999900")
    public static let yellow450 = Self(rawValue: "#b3b300")
    public static let yellow500 = Self(rawValue: "#cccc33")
    public static let yellow600 = Self(rawValue: "#d6d666")
    public static let yellow650 = Self(rawValue: "#e0e099")
    public static let yellow700 = Self(rawValue: "#ebebcc")
    public static let yellow800 = Self(rawValue: "#f5f5e0")
    public static let yellow850 = Self(rawValue: "#ffffe6")
    public static let yellow900 = Self(rawValue: "#fffff0")
}

extension HTMLColor {
    public static let orange150 = Self(rawValue: "#331a00")
    public static let orange200 = Self(rawValue: "#442200")
    public static let orange250 = Self(rawValue: "#553300")
    public static let orange300 = Self(rawValue: "#663300")
    public static let orange350 = Self(rawValue: "#884400")
    public static let orange400 = Self(rawValue: "#994d00")
    public static let orange450 = Self(rawValue: "#b35900")
    public static let orange500 = Self(rawValue: "#cc6600")
    public static let orange600 = Self(rawValue: "#e67333")
    public static let orange650 = Self(rawValue: "#f29466")
    public static let orange700 = Self(rawValue: "#f5a366")
    public static let orange800 = Self(rawValue: "#f9d1cc")
    public static let orange850 = Self(rawValue: "#fde8d9")
    public static let orange900 = Self(rawValue: "#fff4e6")
}

extension HTMLColor {
    public static let teal150 = Self(rawValue: "#003333")
    public static let teal200 = Self(rawValue: "#004444")
    public static let teal250 = Self(rawValue: "#005555")
    public static let teal300 = Self(rawValue: "#006666")
    public static let teal350 = Self(rawValue: "#007777")
    public static let teal400 = Self(rawValue: "#008888")
    public static let teal450 = Self(rawValue: "#009999")
    public static let teal500 = Self(rawValue: "#33aaaa")
    public static let teal600 = Self(rawValue: "#66bfbf")
    public static let teal650 = Self(rawValue: "#99cccc")
    public static let teal700 = Self(rawValue: "#b3d6d6")
    public static let teal800 = Self(rawValue: "#cce5e5")
    public static let teal850 = Self(rawValue: "#e6f2f2")
    public static let teal900 = Self(rawValue: "#f0f8f8")
}

extension HTMLColor {
    public static let pink150 = Self(rawValue: "#33001a")
    public static let pink200 = Self(rawValue: "#440022")
    public static let pink250 = Self(rawValue: "#55002b")
    public static let pink300 = Self(rawValue: "#660033")
    public static let pink350 = Self(rawValue: "#88003d")
    public static let pink400 = Self(rawValue: "#990047")
    public static let pink450 = Self(rawValue: "#b30052")
    public static let pink500 = Self(rawValue: "#cc3366")
    public static let pink600 = Self(rawValue: "#e06699")
    public static let pink650 = Self(rawValue: "#e699b3")
    public static let pink700 = Self(rawValue: "#f0b3cc")
    public static let pink800 = Self(rawValue: "#f5cce0")
    public static let pink850 = Self(rawValue: "#f9e6f2")
    public static let pink900 = Self(rawValue: "#fceff5")
}

extension HTMLColor {
    public static let brown150 = Self(rawValue: "#331a00")
    public static let brown200 = Self(rawValue: "#442200")
    public static let brown250 = Self(rawValue: "#553300")
    public static let brown300 = Self(rawValue: "#663300")
    public static let brown350 = Self(rawValue: "#884400")
    public static let brown400 = Self(rawValue: "#994d00")
    public static let brown450 = Self(rawValue: "#b35900")
    public static let brown500 = Self(rawValue: "#cc6600")
    public static let brown600 = Self(rawValue: "#e67333")
    public static let brown650 = Self(rawValue: "#f0b366")
    public static let brown700 = Self(rawValue: "#f5cc99")
    public static let brown800 = Self(rawValue: "#f7e0cc")
    public static let brown850 = Self(rawValue: "#fdeee6")
    public static let brown900 = Self(rawValue: "#fef5f0")
}

extension HTMLColor {
    public static let black = Self(rawValue: "#121212")
    public static let offBlack = Self(rawValue: "#171717")
    public static let white = Self(rawValue: "#fff")
    public static let offWhite = Self(rawValue: "#fafafa")
    
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
    public static let currentColor = Self(rawValue: "currentColor")
}
