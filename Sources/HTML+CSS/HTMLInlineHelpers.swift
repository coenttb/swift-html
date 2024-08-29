//
//  File 2.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation
import CSS
import HTML

extension HTMLInlineStyle {
 
    @discardableResult
    public func top(_ value: String?) -> HTMLInlineStyle {
        inlineStyle("top", value)
    }
    
    @discardableResult
    public func left(_ value: String?) -> HTMLInlineStyle {
        inlineStyle("left", value)
    }
    
    @discardableResult
    public func backgroundColor(_ value: String?) -> HTMLInlineStyle {
        inlineStyle("background-color", value)
    }
    
    @discardableResult
    public func transition(_ value: String?) -> HTMLInlineStyle {
        inlineStyle("transition", value)
    }
    
    
    
    @discardableResult
    public func margin(_ value: String?) -> HTMLInlineStyle {
        inlineStyle("margin", value)
    }
    
    @discardableResult
    public func padding(_ value: String?) -> some HTML {
        inlineStyle("padding", value)
    }
    
    @discardableResult
    public func color(_ value: String?) -> some HTML {
        inlineStyle("color", value)
    }

    @discardableResult
    public func textAlign(_ value: String?) -> some HTML {
        inlineStyle("text-align", value)
    }

}
