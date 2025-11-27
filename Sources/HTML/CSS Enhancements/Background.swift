//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import CSS_Standard

// extension HTML {
//    @HTML.Builder
//    public func backgroundColor(
//        _ color: HTMLColor?,
//        media: W3C_CSS_MediaQueries.Media? = nil,
//        selector: HTML.Selector? = nil,
//        pseudo: HTML.Pseudo? = nil
//    ) -> some HTML.View {
//        let lightStyle = inlineStyle(
//            Background.property,
//            color?.light.description,
//            media: media.map(\.rawValue).map(HTML_Renderable.AtRule.Media.init),
//            selector: selector,
//            pseudo: pseudo
//        )
//
//        if let darkColor = color?.dark {
//            lightStyle.inlineStyle(
//                Background.property,
//                darkColor.description,
//                media: HTML_Renderable.AtRule.Media(rawValue: W3C_CSS_MediaQueries.Media.dark.rawValue),
//                selector: selector,
//                pseudo: pseudo
//            )
//        } else {
//            lightStyle
//        }
//    }
// }
