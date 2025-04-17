//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML

extension HTML {
    @HTMLBuilder
    public func padding(
        vertical: LengthPercentage?,
        horizontal: LengthPercentage?,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    )-> some HTML {
        switch (vertical, horizontal) {
        case let (.some(vertical), .some(horizontal)):
            self.padding(.verticalHorizontal(vertical, horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
        case let (.none, .some(horizontal)):
            self
                .paddingRight(.lengthPercentage(horizontal))
                .paddingLeft(.lengthPercentage(horizontal))
        case let (.some(vertical), .none):
            self
                .paddingTop(.lengthPercentage(vertical))
                .paddingBottom(.lengthPercentage(vertical))
        case (.none, .none):
            self
        }
    }
}
