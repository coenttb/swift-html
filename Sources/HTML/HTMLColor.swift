//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/09/2024.
//

import Foundation
import PointFreeHtml

extension HTMLColor {
    public static let gray150 = Self(rawValue: "#2a2a2a", darkValue: "#f0f0f0")
    public static let gray200 = Self(rawValue: "#3a3a3a", darkValue: "#e0e0e0")
    public static let gray250 = Self(rawValue: "#4a4a4a", darkValue: "#d0d0d0")
    public static let gray300 = Self(rawValue: "#5a5a5a", darkValue: "#c0c0c0")
    public static let gray350 = Self(rawValue: "#666666", darkValue: "#a0a0a0")
    public static let gray400 = Self(rawValue: "#707070", darkValue: "#909090")
    public static let gray450 = Self(rawValue: "#808080", darkValue: "#808080")
    public static let gray500 = Self(rawValue: "#888888", darkValue: "#707070")
    public static let gray550 = Self(rawValue: "#8f8f8f", darkValue: "#606060")
    public static let gray600 = Self(rawValue: "#999999", darkValue: "#606060")
    public static let gray650 = Self(rawValue: "#aaaaaa", darkValue: "#505050")
    public static let gray700 = Self(rawValue: "#bbbbbb", darkValue: "#404040")
    public static let gray750 = Self(rawValue: "#c5c5c5", darkValue: "#303030")
    public static let gray800 = Self(rawValue: "#d0d0d0", darkValue: "#303030")
    public static let gray850 = Self(rawValue: "#e0e0e0", darkValue: "#202020")
    public static let gray900 = Self(rawValue: "#f5f5f5", darkValue: "#101010")
}

extension HTMLColor {
    public static let blue150 = Self(rawValue: "#001f3f", darkValue: "#ccddee")
    public static let blue200 = Self(rawValue: "#003366", darkValue: "#bbccdd")
    public static let blue250 = Self(rawValue: "#004488", darkValue: "#99bbcc")
    public static let blue300 = Self(rawValue: "#0055aa", darkValue: "#7799bb")
    public static let blue350 = Self(rawValue: "#0066cc", darkValue: "#5588aa")
    public static let blue400 = Self(rawValue: "#0077ee", darkValue: "#336699")
    public static let blue450 = Self(rawValue: "#0088ff", darkValue: "#115588")
    public static let blue500 = Self(rawValue: "#3399ff", darkValue: "#004477")
    public static let blue550 = Self(rawValue: "#4d9cff", darkValue: "#004466")
    public static let blue600 = Self(rawValue: "#66aaff", darkValue: "#003366")
    public static let blue650 = Self(rawValue: "#99bbff", darkValue: "#002255")
    public static let blue700 = Self(rawValue: "#b3ccff", darkValue: "#001144")
    public static let blue750 = Self(rawValue: "#b3d9ff", darkValue: "#002244")
    public static let blue800 = Self(rawValue: "#cce5ff", darkValue: "#001133")
    public static let blue850 = Self(rawValue: "#e6f2ff", darkValue: "#001122")
    public static let blue900 = Self(rawValue: "#f0f8ff", darkValue: "#001011")
}

extension HTMLColor {
    public static let green150 = Self(rawValue: "#003300", darkValue: "#ccffcc")
    public static let green200 = Self(rawValue: "#004400", darkValue: "#bbeebb")
    public static let green250 = Self(rawValue: "#005500", darkValue: "#99dd99")
    public static let green300 = Self(rawValue: "#006600", darkValue: "#77cc77")
    public static let green350 = Self(rawValue: "#007700", darkValue: "#55bb55")
    public static let green400 = Self(rawValue: "#009900", darkValue: "#33aa33")
    public static let green450 = Self(rawValue: "#00b300", darkValue: "#229922")
    public static let green500 = Self(rawValue: "#33cc33", darkValue: "#008800")
    public static let green550 = Self(rawValue: "#4ddb4d", darkValue: "#006600")
    public static let green600 = Self(rawValue: "#66d966", darkValue: "#007700")
    public static let green650 = Self(rawValue: "#99e699", darkValue: "#006600")
    public static let green700 = Self(rawValue: "#b3f0b3", darkValue: "#005500")
    public static let green750 = Self(rawValue: "#bdeabf", darkValue: "#004400")
    public static let green800 = Self(rawValue: "#ccf5cc", darkValue: "#004400")
    public static let green850 = Self(rawValue: "#e6ffe6", darkValue: "#003300")
    public static let green900 = Self(rawValue: "#f0fff0", darkValue: "#002200")
}

extension HTMLColor {
    public static let purple150 = Self(rawValue: "#2a0033", darkValue: "#e6ccf5")
    public static let purple200 = Self(rawValue: "#3b0044", darkValue: "#d9b3ea")
    public static let purple250 = Self(rawValue: "#4c0055", darkValue: "#cc80e6")
    public static let purple300 = Self(rawValue: "#5d0066", darkValue: "#b366d6")
    public static let purple350 = Self(rawValue: "#6e0088", darkValue: "#a300cc")
    public static let purple400 = Self(rawValue: "#7f0099", darkValue: "#8f00b3")
    public static let purple450 = Self(rawValue: "#8f00b3", darkValue: "#7f0099")
    public static let purple500 = Self(rawValue: "#a300cc", darkValue: "#6e0088")
    public static let purple550 = Self(rawValue: "#a866d6", darkValue: "#5d0077")
    public static let purple600 = Self(rawValue: "#b366e0", darkValue: "#5d0066")
    public static let purple650 = Self(rawValue: "#cc80e6", darkValue: "#4c0055")
    public static let purple700 = Self(rawValue: "#d9b3f0", darkValue: "#3b0044")
    public static let purple750 = Self(rawValue: "#e0b3f0", darkValue: "#3b0033")
    public static let purple800 = Self(rawValue: "#e6ccf5", darkValue: "#2a0033")
    public static let purple850 = Self(rawValue: "#f2e6ff", darkValue: "#200022")
    public static let purple900 = Self(rawValue: "#f9f0ff", darkValue: "#110011")
}

extension HTMLColor {
    public static let red150 = Self(rawValue: "#330000", darkValue: "#ffcccc")
    public static let red200 = Self(rawValue: "#440000", darkValue: "#ffb3b3")
    public static let red250 = Self(rawValue: "#550000", darkValue: "#ff9999")
    public static let red300 = Self(rawValue: "#660000", darkValue: "#ff8080")
    public static let red350 = Self(rawValue: "#880000", darkValue: "#ff6666")
    public static let red400 = Self(rawValue: "#990000", darkValue: "#ff4d4d")
    public static let red450 = Self(rawValue: "#b30000", darkValue: "#ff3333")
    public static let red500 = Self(rawValue: "#cc3333", darkValue: "#ff1a1a")
    public static let red550 = Self(rawValue: "#dd6666", darkValue: "#cc0000")
    public static let red600 = Self(rawValue: "#e06666", darkValue: "#ff0000")
    public static let red650 = Self(rawValue: "#e69999", darkValue: "#dd0000")
    public static let red700 = Self(rawValue: "#f0b3b3", darkValue: "#bb0000")
    public static let red750 = Self(rawValue: "#f5b3b3", darkValue: "#aa0000")
    public static let red800 = Self(rawValue: "#f5cccc", darkValue: "#990000")
    public static let red850 = Self(rawValue: "#ffe6e6", darkValue: "#770000")
    public static let red900 = Self(rawValue: "#fff0f0", darkValue: "#550000")
}

extension HTMLColor {
    public static let yellow150 = Self(rawValue: "#333300", darkValue: "#ffffcc")
    public static let yellow200 = Self(rawValue: "#444400", darkValue: "#ffffb3")
    public static let yellow250 = Self(rawValue: "#555500", darkValue: "#ffff99")
    public static let yellow300 = Self(rawValue: "#666600", darkValue: "#ffff80")
    public static let yellow350 = Self(rawValue: "#808000", darkValue: "#ffff66")
    public static let yellow400 = Self(rawValue: "#999900", darkValue: "#ffff4d")
    public static let yellow450 = Self(rawValue: "#b3b300", darkValue: "#ffff33")
    public static let yellow500 = Self(rawValue: "#cccc33", darkValue: "#ffff1a")
    public static let yellow550 = Self(rawValue: "#dedd66", darkValue: "#d6d600")
    public static let yellow600 = Self(rawValue: "#d6d666", darkValue: "#e6e600")
    public static let yellow650 = Self(rawValue: "#e0e099", darkValue: "#cccc00")
    public static let yellow700 = Self(rawValue: "#ebebcc", darkValue: "#b3b300")
    public static let yellow750 = Self(rawValue: "#f0eebf", darkValue: "#b3b300")
    public static let yellow800 = Self(rawValue: "#f5f5e0", darkValue: "#999900")
    public static let yellow850 = Self(rawValue: "#ffffe6", darkValue: "#808000")
    public static let yellow900 = Self(rawValue: "#fffff0", darkValue: "#666600")
}

extension HTMLColor {
    public static let orange150 = Self(rawValue: "#331a00", darkValue: "#ffe6cc")
    public static let orange200 = Self(rawValue: "#442200", darkValue: "#ffd9b3")
    public static let orange250 = Self(rawValue: "#553300", darkValue: "#ffcc99")
    public static let orange300 = Self(rawValue: "#663300", darkValue: "#ffbf80")
    public static let orange350 = Self(rawValue: "#884400", darkValue: "#ffb366")
    public static let orange400 = Self(rawValue: "#994d00", darkValue: "#ffa64d")
    public static let orange450 = Self(rawValue: "#b35900", darkValue: "#ff9933")
    public static let orange500 = Self(rawValue: "#cc6600", darkValue: "#ff8c1a")
    public static let orange550 = Self(rawValue: "#e68a4d", darkValue: "#a64d00")
    public static let orange600 = Self(rawValue: "#e67333", darkValue: "#ff8000")
    public static let orange650 = Self(rawValue: "#f29466", darkValue: "#cc6600")
    public static let orange700 = Self(rawValue: "#f5a366", darkValue: "#b35900")
    public static let orange750 = Self(rawValue: "#f7c299", darkValue: "#773300")
    public static let orange800 = Self(rawValue: "#f9d1cc", darkValue: "#884400")
    public static let orange850 = Self(rawValue: "#fde8d9", darkValue: "#663300")
    public static let orange900 = Self(rawValue: "#fff4e6", darkValue: "#553300")
}

extension HTMLColor {
    public static let teal150 = Self(rawValue: "#003333", darkValue: "#ccffeb")
    public static let teal200 = Self(rawValue: "#004444", darkValue: "#bbffe6")
    public static let teal250 = Self(rawValue: "#005555", darkValue: "#aaffdd")
    public static let teal300 = Self(rawValue: "#006666", darkValue: "#88ffd1")
    public static let teal350 = Self(rawValue: "#007777", darkValue: "#66ffc4")
    public static let teal400 = Self(rawValue: "#008888", darkValue: "#33ffb8")
    public static let teal450 = Self(rawValue: "#009999", darkValue: "#00ffaa")
    public static let teal500 = Self(rawValue: "#33aaaa", darkValue: "#00e699")
    public static let teal550 = Self(rawValue: "#4dbfbf", darkValue: "#007777")
    public static let teal600 = Self(rawValue: "#66bfbf", darkValue: "#00cc88")
    public static let teal650 = Self(rawValue: "#99cccc", darkValue: "#00b377")
    public static let teal700 = Self(rawValue: "#b3d6d6", darkValue: "#009966")
    public static let teal750 = Self(rawValue: "#b3e0e0", darkValue: "#005544")
    public static let teal800 = Self(rawValue: "#cce5e5", darkValue: "#008855")
    public static let teal850 = Self(rawValue: "#e6f2f2", darkValue: "#007744")
    public static let teal900 = Self(rawValue: "#f0f8f8", darkValue: "#006633")
}

extension HTMLColor {
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
    public static let pink150 = Self(rawValue: "#33001a", darkValue: "#ffe6f2")
    public static let pink200 = Self(rawValue: "#440022", darkValue: "#ffccde")
    public static let pink250 = Self(rawValue: "#55002b", darkValue: "#ff99cc")
    public static let pink300 = Self(rawValue: "#660033", darkValue: "#ff66b3")
    public static let pink350 = Self(rawValue: "#88003d", darkValue: "#ff4da6")
    public static let pink400 = Self(rawValue: "#990047", darkValue: "#ff3399")
    public static let pink450 = Self(rawValue: "#b30052", darkValue: "#ff1a80")
    public static let pink500 = Self(rawValue: "#cc3366", darkValue: "#ff0066")
    public static let pink550 = Self(rawValue: "#e66699", darkValue: "#cc0044")
    public static let pink600 = Self(rawValue: "#e06699", darkValue: "#e6005c")
    public static let pink650 = Self(rawValue: "#e699b3", darkValue: "#cc0052")
    public static let pink700 = Self(rawValue: "#f0b3cc", darkValue: "#b30047")
    public static let pink750 = Self(rawValue: "#f0aacc", darkValue: "#aa0044")
    public static let pink800 = Self(rawValue: "#f5cce0", darkValue: "#99003d")
    public static let pink850 = Self(rawValue: "#f9e6f2", darkValue: "#770033")
    public static let pink900 = Self(rawValue: "#fceff5", darkValue: "#550029")
}

extension HTMLColor {
    public static let brown150 = Self(rawValue: "#331a00", darkValue: "#ffebcc")
    public static let brown200 = Self(rawValue: "#442200", darkValue: "#ffddaa")
    public static let brown250 = Self(rawValue: "#553300", darkValue: "#ffcc88")
    public static let brown300 = Self(rawValue: "#663300", darkValue: "#ffbb66")
    public static let brown350 = Self(rawValue: "#884400", darkValue: "#ffaa44")
    public static let brown400 = Self(rawValue: "#994d00", darkValue: "#ff9933")
    public static let brown450 = Self(rawValue: "#b35900", darkValue: "#ff8822")
    public static let brown500 = Self(rawValue: "#cc6600", darkValue: "#ff7700")
    public static let brown550 = Self(rawValue: "#e6884d", darkValue: "#b34d00")
    public static let brown600 = Self(rawValue: "#e67333", darkValue: "#e66a00")
    public static let brown650 = Self(rawValue: "#f0b366", darkValue: "#cc5e00")
    public static let brown700 = Self(rawValue: "#f5cc99", darkValue: "#b35200")
    public static let brown750 = Self(rawValue: "#f5d1b3", darkValue: "#aa5500")
    public static let brown800 = Self(rawValue: "#f7e0cc", darkValue: "#994700")
    public static let brown850 = Self(rawValue: "#fdeee6", darkValue: "#773b00")
    public static let brown900 = Self(rawValue: "#fef5f0", darkValue: "#553000")
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
