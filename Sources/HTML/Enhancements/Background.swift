//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML

extension HTML {
    public func backgroundColor(
        _ color: HTMLColor?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    )-> some HTML {
        let lightStyle = inlineStyle("background", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        
        if let darkColor = color?.dark {
            return lightStyle.inlineStyle("background", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
        } else {
            return lightStyle
        }
    }
}
