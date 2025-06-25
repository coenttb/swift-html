//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation

public typealias Color = CSSPropertyTypes.Color.WithDarkMode.Color
public typealias HTMLColor = CSSPropertyTypes.Color.WithDarkMode.Color

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func color(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.color(light: color.light, dark: color.dark, media: media, pre: pre, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension CSSTypeTypes.Color {
    public func withDarkColor(_ color: CSSTypeTypes.Color) -> HTMLColor {
        .init(light: self, dark: color)
    }
}

extension HTMLColor {
    public func withDarkColor(_ color: CSSTypeTypes.Color) -> HTMLColor {
        .init(light: self.light, dark: color)
    }
}
