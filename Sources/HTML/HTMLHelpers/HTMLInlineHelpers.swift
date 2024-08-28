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
    public func padding(_ value: String) -> HTMLInlineStyle {
        inlineStyle("padding", value)
    }
    
    @discardableResult
    public func color(_ value: String) -> HTMLInlineStyle {
        inlineStyle("color", value)
    }
    
    @discardableResult
    public func fontSize(_ value: String) -> HTMLInlineStyle {
        inlineStyle("font-size", value)
    }
    
    @discardableResult
    public func fontWeight(_ value: String) -> HTMLInlineStyle {
        inlineStyle("font-weight", value)
    }
    
    @discardableResult
    public func textAlign(_ value: String) -> HTMLInlineStyle {
        inlineStyle("text-align", value)
    }
    
    // Convenience method for custom properties
    @discardableResult
    public func custom(_ property: String, _ value: String) -> HTMLInlineStyle {
        inlineStyle(property, value)
    }
}


extension HTML {
    @discardableResult
    public func position(_ value: CSS.Position) -> some HTML {
        self.inlineStyle("position", value.description)
    }
}

// Extension to HTML for using the Overflow property
extension HTML {
    @discardableResult
    public func overflow(_ value: CSS.Overflow) -> some HTML {
        self.inlineStyle("overflow", value.description)
    }
    
    @discardableResult
    public func overflowX(_ value: CSS.Overflow.Value) -> some HTML {
        self.inlineStyle("overflow-x", value.rawValue)
    }
    
    @discardableResult
    public func overflowY(_ value: CSS.Overflow.Value) -> some HTML {
        self.inlineStyle("overflow-y", value.rawValue)
    }
}


// Extension to HTML for using the FontWeight property
extension HTML {
    @discardableResult
    public func fontWeight(_ value: CSS.FontWeight) -> some HTML {
        self.inlineStyle("font-weight", value.description)
    }
}

// Extension to HTML for using the BoxSizing property
extension HTML {
    @discardableResult
    public func boxSizing(_ value: CSS.BoxSizing) -> some HTML {
        self.inlineStyle("box-sizing", value.description)
    }
}

// Extension to HTML for using the Cursor property
extension HTML {
    @discardableResult
    public func cursor(_ value: CSS.Cursor) -> some HTML {
        self.inlineStyle("cursor", value.description)
    }
}

// Extension to HTML for using the Visibility property
extension HTML {
    @discardableResult
    public func visibility(_ value: CSS.Visibility) -> some HTML {
        self.inlineStyle("visibility", value.description)
    }
}

extension HTML {
    @discardableResult
    public func width(_ value: CSS.Length) -> some HTML {
        self.inlineStyle("width", value.description)
    }

    @discardableResult
    public func height(_ value: CSS.Length) -> some HTML {
        self.inlineStyle("height", value.description)
    }

    @discardableResult
    public func minWidth(_ value: CSS.Length) -> some HTML {
        self.inlineStyle("min-width", value.description)
    }

    @discardableResult
    public func minHeight(_ value: CSS.Length) -> some HTML {
        self.inlineStyle("min-height", value.description)
    }

    @discardableResult
    public func maxWidth(_ value: CSS.Length) -> some HTML {
        self.inlineStyle("max-width", value.description)
    }

    @discardableResult
    public func maxHeight(_ value: CSS.Length) -> some HTML {
        self.inlineStyle("max-height", value.description)
    }
}
