//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/09/2024.
//

import Foundation
import PointFreeHtml

extension HTMLColor {
    public static let gray150 = Self(rawValue: "#242424")
    public static let gray200 = Self(rawValue: "#333333")
    public static let gray250 = Self(rawValue: "#444444")
    public static let gray300 = Self(rawValue: "#555555")
    public static let gray350 = Self(rawValue: "#5e5e5e")
    public static let gray400 = Self(rawValue: "#666666")
    public static let gray450 = Self(rawValue: "#737373")
    public static let gray500 = Self(rawValue: "#808080")
    public static let gray600 = Self(rawValue: "#979797")
    public static let gray650 = Self(rawValue: "#a8a8a8")
    public static let gray700 = Self(rawValue: "#b5b5b5")
    public static let gray800 = Self(rawValue: "#ccc")
    public static let gray850 = Self(rawValue: "#d8d8d8")
    public static let gray900 = Self(rawValue: "#f6f6f6")
}

extension HTMLColor {
    public static let blue150 = Self(rawValue: "#002244")
    public static let blue200 = Self(rawValue: "#003366")
    public static let blue250 = Self(rawValue: "#003d77")
    public static let blue300 = Self(rawValue: "#004488")
    public static let blue350 = Self(rawValue: "#0055aa")
    public static let blue400 = Self(rawValue: "#0066cc")
    public static let blue450 = Self(rawValue: "#0077ee")
    public static let blue500 = Self(rawValue: "#0088ff")
    public static let blue550 = Self(rawValue: "#1a99ff")
    public static let blue600 = Self(rawValue: "#3399ff")
    public static let blue650 = Self(rawValue: "#66aaff")
    public static let blue700 = Self(rawValue: "#99bbff")
    public static let blue750 = Self(rawValue: "#b3ccff")
    public static let blue800 = Self(rawValue: "#cce5ff")
    public static let blue850 = Self(rawValue: "#e6f2ff")
    public static let blue900 = Self(rawValue: "#f0f8ff")
}

extension HTMLColor {
    public static let green150 = Self(rawValue: "#003300")
    public static let green200 = Self(rawValue: "#004400")
    public static let green250 = Self(rawValue: "#005500")
    public static let green300 = Self(rawValue: "#006600")
    public static let green350 = Self(rawValue: "#008000")
    public static let green400 = Self(rawValue: "#009900")
    public static let green450 = Self(rawValue: "#00b300")
    public static let green500 = Self(rawValue: "#00cc00")
    public static let green550 = Self(rawValue: "#1ad11a")
    public static let green600 = Self(rawValue: "#33d633")
    public static let green650 = Self(rawValue: "#66e066")
    public static let green700 = Self(rawValue: "#99eb99")
    public static let green750 = Self(rawValue: "#b3f0b3")
    public static let green800 = Self(rawValue: "#ccf5cc")
    public static let green850 = Self(rawValue: "#e6ffe6")
    public static let green900 = Self(rawValue: "#f0fff0")
}

extension HTMLColor {
    public static let purple150 = Self(rawValue: "#2a0033")
    public static let purple200 = Self(rawValue: "#3b0044")
    public static let purple250 = Self(rawValue: "#450055")
    public static let purple300 = Self(rawValue: "#4d0066")
    public static let purple350 = Self(rawValue: "#600080")
    public static let purple400 = Self(rawValue: "#730099")
    public static let purple450 = Self(rawValue: "#8600b3")
    public static let purple500 = Self(rawValue: "#9900cc")
    public static let purple550 = Self(rawValue: "#a300d1")
    public static let purple600 = Self(rawValue: "#b366d6")
    public static let purple650 = Self(rawValue: "#cc80e0")
    public static let purple700 = Self(rawValue: "#d9b3ea")
    public static let purple750 = Self(rawValue: "#e0cce6")
    public static let purple800 = Self(rawValue: "#e6ccf5")
    public static let purple850 = Self(rawValue: "#f2e6ff")
    public static let purple900 = Self(rawValue: "#f9f0ff")
}

extension HTMLColor {
    public static let red150 = Self(rawValue: "#330000")
    public static let red200 = Self(rawValue: "#440000")
    public static let red250 = Self(rawValue: "#550000")
    public static let red300 = Self(rawValue: "#660000")
    public static let red350 = Self(rawValue: "#800000")
    public static let red400 = Self(rawValue: "#990000")
    public static let red450 = Self(rawValue: "#b30000")
    public static let red500 = Self(rawValue: "#cc0000")
    public static let red550 = Self(rawValue: "#d10000")
    public static let red600 = Self(rawValue: "#d63333")
    public static let red650 = Self(rawValue: "#e06666")
    public static let red700 = Self(rawValue: "#eb9999")
    public static let red750 = Self(rawValue: "#f0b3b3")
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
    public static let yellow500 = Self(rawValue: "#cccc00")
    public static let yellow550 = Self(rawValue: "#d1d100")
    public static let yellow600 = Self(rawValue: "#d6d633")
    public static let yellow650 = Self(rawValue: "#e0e066")
    public static let yellow700 = Self(rawValue: "#ebeb99")
    public static let yellow750 = Self(rawValue: "#f0f0b3")
    public static let yellow800 = Self(rawValue: "#f5f5cc")
    public static let yellow850 = Self(rawValue: "#ffffe6")
    public static let yellow900 = Self(rawValue: "#fffff0")
}

extension HTMLColor {
    public static let black = Self(rawValue: "#121212")
    public static let offBlack = Self(rawValue: "#171717")
    public static let white = Self(rawValue: "#fff")
    public static let offWhite = Self(rawValue: "#fafafa")
    
    public static let green = Self.green500
    public static let purple = Self.purple500
    public static let blue = Self.blue500
    public static let red = Self.red500
    public static let yellow = Self.yellow500
}

extension HTMLColor {
    public static let currentColor = Self(rawValue: "currentColor")
}
