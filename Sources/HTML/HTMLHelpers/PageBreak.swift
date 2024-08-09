//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2024.
//

import Foundation

public enum PageBreak {
    case after(After = .auto)
    case before(Before = .auto)
    case inside(Inside = .auto)
    
    public enum After: String {
        case auto
        case always
        case avoid
        case left
        case right
        case initial
        case inherit
    }
    public enum Before: String {
        case auto
        case always
        case avoid
        case left
        case right
        case initial
        case inherit
    }
    public enum Inside: String {
        case auto
        case avoid
        case initial
        case inherit
    }
    
    var inlineStyle: (String, String) {
        switch self {
        case .after(let after):
            ("page-break-after", after.rawValue)
        case .before(let before):
            ("page-break-before", before.rawValue)
        case .inside(let inside):
            ("page-break-inside", inside.rawValue)
        }
    }
}

extension HTML {
    public func pageBreak(_ pageBreak: PageBreak)->HTMLInlineStyle<Self> {
        self.inlineStyle(pageBreak.inlineStyle.0, pageBreak.inlineStyle.1)
    }
}
