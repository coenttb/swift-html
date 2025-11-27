//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import CSS
import CSS_Standard

extension HTML.View {
    @discardableResult
    @_disfavoredOverload
    @HTML.Builder
    public func listStyle(
        _ listStyle: ListStyle,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        switch listStyle {
        case .reset:
            self.css
                .listStyleType(ListStyleType.none)
                .paddingLeft(.zero)
        case .cssPropertyTypesListStyle(let listStyle):
            self.css.listStyle(listStyle)
        }
    }
}

public enum ListStyle {
    case reset
    case cssPropertyTypesListStyle(CSS_Standard.ListStyle)
}

// #if DEBUG && canImport(SwiftUI)
//     import SwiftUI
//     #Preview {
//         HTML.Document {
//             ul {
//                 li {
//                     "1"
//                 }
//                 li {
//                     "2"
//                 }
//                 li {
//                     "3"
//                 }
//             }
//             .listStyle(.reset)
//         }
//     }
// #endif
