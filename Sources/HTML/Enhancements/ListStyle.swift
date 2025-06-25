//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    public func listStyle(
        _ listStyle: ListStyle,
        media: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch listStyle {
        case .reset:
            self
                .listStyleType(ListStyleType.none)
                .padding(left: .zero)
        case .cssPropertyTypesListStyle(let listStyle):
            self.listStyle(listStyle)
        }
    }
}


public enum ListStyle {
    case reset
    case cssPropertyTypesListStyle(CSSPropertyTypes.ListStyle)
}
