//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

extension HTML {
    @HTMLBuilder
    public func backgroundColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        let lightStyle = inlineStyle(
            Background.property,
            color?.light.description,
            media: media.map(\.rawValue).map(PointFreeHTML.AtRule.Media.init),
            selector: selector,
            pseudo: pseudo
        )

        if let darkColor = color?.dark {
            lightStyle.inlineStyle(
                Background.property,
                darkColor.description,
                media: PointFreeHTML.AtRule.Media(rawValue: CSSAtRuleTypes.Media.dark.rawValue),
                selector: selector,
                pseudo: pseudo
            )
        } else {
            lightStyle
        }
    }
}
