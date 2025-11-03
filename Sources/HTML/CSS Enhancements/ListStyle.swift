//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    public func listStyle(
        _ listStyle: ListStyle,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch listStyle {
        case .reset:
            self
                .listStyleType(ListStyleType.none)
                .paddingLeft(.zero)
        case .cssPropertyTypesListStyle(let listStyle):
            self.listStyle(listStyle)
        }
    }
}

public enum ListStyle {
    case reset
    case cssPropertyTypesListStyle(CSSPropertyTypes.ListStyle)
}

#if DEBUG && canImport(SwiftUI)
import SwiftUI
#Preview {
    HTMLDocument {
        ul {
            li {
                "1"
            }
            li {
                "2"
            }
            li {
                "3"
            }
        }
        .listStyle(.reset)
    }
}
#endif
