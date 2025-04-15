//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML

public struct Border: Equatable, Sendable {
    public var width: BorderWidth? = nil
    public var style: CSSTypeTypes.LineStyle? = nil
    public var color: HTMLColor? = nil
    public var sides: Set<Side>? = nil
    
    public enum Side: String, Sendable, CaseIterable {
        case top, left, right, bottom
    }
    
    public init(width: BorderWidth? = nil, style: CSSTypeTypes.LineStyle? = nil, color: HTMLColor? = nil, sides: Set<Side>? = nil) {
        self.width = width
        self.style = style
        self.color = color
        self.sides = sides
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func border(_ border: Border?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        
        
        
        switch border {
        case .none:
            self
            
        case .some(let border):
            // Extract common border properties
            let borderStyle = "\(border.width?.description ?? "") \(border.style?.description ?? "")"
            let lightColor = border.color?.light.description ?? ""
            let darkColor = border.color?.dark.description ?? ""
            
            if border.sides == nil || border.sides?.count == Border.Side.allCases.count {
                self
                    .inlineStyle("border", "\(borderStyle) \(lightColor)", pre: pre, pseudo: pseudo)
                    .inlineStyle("border", "\(borderStyle) \(darkColor)", media: .dark, pre: pre, pseudo: pseudo)
            } else {
                borderSides(
                    border: border,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    pre: pre,
                    pseudo: pseudo
                )
            }
        }
    }
    
    @HTMLBuilder
    private func borderSides(
        border: Border,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        pre: String?,
        pseudo: Pseudo?
    ) -> some HTML {
        // Start with the base element
        let base = self
        
        // Use the HTMLBuilder to compose all the borders
        if border.sides?.contains(.top) == true {
            base
                .inlineStyle("border-top", "\(borderStyle) \(lightColor)", pre: pre, pseudo: pseudo)
                .inlineStyle("border-top", "\(borderStyle) \(darkColor)", media: .dark, pre: pre, pseudo: pseudo)
        }
        
        if border.sides?.contains(.left) == true {
            base
                .inlineStyle("border-left", "\(borderStyle) \(lightColor)", pre: pre, pseudo: pseudo)
                .inlineStyle("border-left", "\(borderStyle) \(darkColor)", media: .dark, pre: pre, pseudo: pseudo)
        }
        
        if border.sides?.contains(.bottom) == true {
            base
                .inlineStyle("border-bottom", "\(borderStyle) \(lightColor)", pre: pre, pseudo: pseudo)
                .inlineStyle("border-bottom", "\(borderStyle) \(darkColor)", media: .dark, pre: pre, pseudo: pseudo)
        }
        
        if border.sides?.contains(.right) == true {
            base
                .inlineStyle("border-right", "\(borderStyle) \(lightColor)", pre: pre, pseudo: pseudo)
                .inlineStyle("border-right", "\(borderStyle) \(darkColor)", media: .dark, pre: pre, pseudo: pseudo)
        }
    }
}
