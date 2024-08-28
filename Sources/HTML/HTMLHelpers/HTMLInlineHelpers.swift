//
//  File 2.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation
import CSS

extension HTMLInlineStyle {
    @discardableResult
    public func display(_ value: String) -> HTMLInlineStyle {
        inlineStyle("display", value)
    }
    
    @discardableResult
    public func position(_ value: String) -> HTMLInlineStyle {
        inlineStyle("position", value)
    }
    
    @discardableResult
    public func top(_ value: String) -> HTMLInlineStyle {
        inlineStyle("top", value)
    }
    
    @discardableResult
    public func left(_ value: String) -> HTMLInlineStyle {
        inlineStyle("left", value)
    }
    
    @discardableResult
    public func width(_ value: String) -> HTMLInlineStyle {
        inlineStyle("width", value)
    }
    
    @discardableResult
    public func height(_ value: String) -> HTMLInlineStyle {
        inlineStyle("height", value)
    }
    
    @discardableResult
    public func backgroundColor(_ value: String) -> HTMLInlineStyle {
        inlineStyle("background-color", value)
    }
    
    @discardableResult
    public func transition(_ value: String) -> HTMLInlineStyle {
        inlineStyle("transition", value)
    }
    
    @discardableResult
    public func opacity(_ value: String) -> HTMLInlineStyle {
        inlineStyle("opacity", value)
    }
    
    @discardableResult
    public func zIndex(_ value: String) -> HTMLInlineStyle {
        inlineStyle("z-index", value)
    }
    
    // Additional common styles
    
    @discardableResult
    public func margin(_ value: String) -> HTMLInlineStyle {
        inlineStyle("margin", value)
    }
    
    @discardableResult
    public func padding(_ value: String) -> some HTML {
        inlineStyle("padding", value)
    }
    
    @discardableResult
    public func color(_ value: String) -> some HTML {
        inlineStyle("color", value)
    }
    
    @discardableResult
    public func fontSize(_ value: CSS.Length) -> some HTML {
        inlineStyle("font-size", value.description)
    }
    
    @discardableResult
    public func fontWeight(_ value: CSS.FontWeight) -> some HTML {
        inlineStyle("font-weight", value.description)
    }
    
    @discardableResult
    public func textAlign(_ value: String) -> some HTML {
        inlineStyle("text-align", value)
    }
    
    // Convenience method for custom properties
    @discardableResult
    public func custom(_ property: String, _ value: String) -> some HTML {
        inlineStyle(property, value)
    }
}


extension HTMLInlineStyle {
    @discardableResult
    public func position(_ value: CSS.Position) -> some HTML {
        self.inlineStyle("position", value.description)
    }
}

// Extension to HTML for using the Overflow property
extension HTMLInlineStyle {
    @discardableResult
    public func overflow(_ value: CSS.Overflow) -> HTMLInlineStyle {
        self.inlineStyle("overflow", value.description)
    }
    
    @discardableResult
    public func overflowX(_ value: CSS.Overflow.Value) -> HTMLInlineStyle {
        self.inlineStyle("overflow-x", value.rawValue)
    }
    
    @discardableResult
    public func overflowY(_ value: CSS.Overflow.Value) -> HTMLInlineStyle {
        self.inlineStyle("overflow-y", value.rawValue)
    }
}

// Extension to HTML for using the BoxSizing property
extension HTMLInlineStyle {
    @discardableResult
    public func boxSizing(_ value: CSS.BoxSizing) -> HTMLInlineStyle {
        self.inlineStyle("box-sizing", value.description)
    }
}

// Extension to HTML for using the Cursor property
extension HTMLInlineStyle {
    @discardableResult
    public func cursor(_ value: CSS.Cursor) -> HTMLInlineStyle {
        self.inlineStyle("cursor", value.description)
    }
}

// Extension to HTML for using the Visibility property
extension HTMLInlineStyle {
    @discardableResult
    public func visibility(_ value: CSS.Visibility) -> HTMLInlineStyle {
        self.inlineStyle("visibility", value.description)
    }
}

extension HTMLInlineStyle {
    @discardableResult
    public func width(_ value: CSS.Length) -> HTMLInlineStyle {
        self.inlineStyle("width", value.description)
    }

    @discardableResult
    public func height(_ value: CSS.Length) -> HTMLInlineStyle {
        self.inlineStyle("height", value.description)
    }

    @discardableResult
    public func minWidth(_ value: CSS.Length) -> HTMLInlineStyle {
        self.inlineStyle("min-width", value.description)
    }

    @discardableResult
    public func minHeight(_ value: CSS.Length) -> HTMLInlineStyle {
        self.inlineStyle("min-height", value.description)
    }

    @discardableResult
    public func maxWidth(_ value: CSS.Length) -> HTMLInlineStyle {
        self.inlineStyle("max-width", value.description)
    }

    @discardableResult
    public func maxHeight(_ value: CSS.Length) -> HTMLInlineStyle {
        self.inlineStyle("max-height", value.description)
    }
}

extension HTMLInlineStyle {
    @discardableResult
    public func display(_ display: CSS.Display) -> HTMLInlineStyle {
        self.inlineStyle("display", display.description)
    }
}
