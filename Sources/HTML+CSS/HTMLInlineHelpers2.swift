//
//  File 2.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation
import CSS
import HTML

extension HTML {
    
    @discardableResult
    public func fontSize(_ value: CSS.Length) -> some HTML {
        inlineStyle("font-size", value.description)
    }
    
    @discardableResult
    public func fontWeight(_ value: CSS.FontWeight) -> some HTML {
        inlineStyle("font-weight", value.description)
    }
    
    @discardableResult
    public func display(_ value: String) -> some HTML {
        inlineStyle("display", value)
    }
    
    @discardableResult
    public func position(_ value: String) -> some HTML {
        inlineStyle("position", value)
    }
    
    @discardableResult
    public func top(_ value: String) -> some HTML {
        inlineStyle("top", value)
    }
    
    @discardableResult
    public func left(_ value: String) -> some HTML {
        inlineStyle("left", value)
    }
    
    @discardableResult
    public func width(_ value: String) -> some HTML {
        inlineStyle("width", value)
    }
    
    @discardableResult
    public func height(_ value: String) -> some HTML {
        inlineStyle("height", value)
    }
    
    @discardableResult
    public func backgroundColor(_ value: String) -> some HTML {
        inlineStyle("background-color", value)
    }
    
    @discardableResult
    public func transition(_ value: String) -> some HTML {
        inlineStyle("transition", value)
    }
    
    @discardableResult
    public func opacity(_ value: String) -> some HTML {
        inlineStyle("opacity", value)
    }
    
    @discardableResult
    public func zIndex(_ value: String) -> some HTML {
        inlineStyle("z-index", value)
    }
    
    // Additional common styles
    
    @discardableResult
    public func margin(_ value: String) -> some HTML {
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
    public func fontSize(_ value: CSS.Length?) -> some HTML {
        inlineStyle("font-size", value?.description)
    }
    
    @discardableResult
    public func fontWeight(_ value: CSS.FontWeight?) -> some HTML {
        inlineStyle("font-weight", value?.description)
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


extension HTML {
    @discardableResult
    public func position(_ value: CSS.Position?) -> some HTML {
        self.inlineStyle("position", value?.description)
    }
}

// Extension to HTML for using the Overflow property
extension HTML {
    @discardableResult
    public func overflow(_ value: CSS.Overflow?) -> some HTML {
        self.inlineStyle("overflow", value?.description)
    }
    
    @discardableResult
    public func overflowX(_ value: CSS.Overflow.Value?) -> some HTML {
        self.inlineStyle("overflow-x", value?.rawValue)
    }
    
    @discardableResult
    public func overflowY(_ value: CSS.Overflow.Value?) -> some HTML {
        self.inlineStyle("overflow-y", value?.rawValue)
    }
}

// Extension to HTML for using the BoxSizing property
extension HTML {
    @discardableResult
    public func boxSizing(_ value: CSS.BoxSizing?) -> some HTML {
        self.inlineStyle("box-sizing", value?.description)
    }
}

// Extension to HTML for using the Cursor property
extension HTML {
    @discardableResult
    public func cursor(_ value: CSS.Cursor?) -> some HTML {
        self.inlineStyle("cursor", value?.description)
    }
}

// Extension to HTML for using the Visibility property
extension HTML {
    @discardableResult
    public func visibility(_ value: CSS.Visibility?) -> some HTML {
        self.inlineStyle("visibility", value?.description)
    }
}

extension HTML {
    @discardableResult
    public func width(_ value: CSS.Length?) -> some HTML {
        self.inlineStyle("width", value?.description)
    }

    @discardableResult
    public func height(_ value: CSS.Length?) -> some HTML {
        self.inlineStyle("height", value?.description)
    }

    @discardableResult
    public func minWidth(_ value: CSS.Length?) -> some HTML {
        self.inlineStyle("min-width", value?.description)
    }

    @discardableResult
    public func minHeight(_ value: CSS.Length?) -> some HTML {
        self.inlineStyle("min-height", value?.description)
    }

    @discardableResult
    public func maxWidth(_ value: CSS.Length?) -> some HTML {
        self.inlineStyle("max-width", value?.description)
    }

    @discardableResult
    public func maxHeight(_ value: CSS.Length?) -> some HTML {
        self.inlineStyle("max-height", value?.description)
    }
}

extension HTML {
    @discardableResult
    public func display(_ display: CSS.Display?) -> some HTML {
        self.inlineStyle("display", display?.description)
    }
}

extension HTML {
    @discardableResult
    public func margin(_ margin: CSS.Margin?) -> some HTML {
        self.inlineStyle("margin", margin?.description)
    }
    
    @discardableResult
    public func margin(top: Length?, right: Length?, bottom: Length?, left: Length?) -> some HTML {
        self.margin(.trbl(top: top, right: right, bottom: bottom, left: left))
    }
    
    @discardableResult
    public func margin(vertical: Length?, horizontal: Length?) -> some HTML {
        self.margin(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal))
    }
}

extension HTML {
    @discardableResult
    public func padding(_ padding: CSS.Padding?) -> some HTML {
        self.inlineStyle("padding", padding?.description)
    }
    
    @discardableResult
    public func padding(top: Length?, right: Length?, bottom: Length?, left: Length?) -> some HTML {
        self.padding(.trbl(top: top, right: right, bottom: bottom, left: left))
    }
    
    @discardableResult
    public func padding(vertical: Length?, horizontal: Length?) -> some HTML {
        self.padding(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal))
    }
}


// Extension to HTML for using the Border property
extension HTML {
    @discardableResult
    public func border(_ border: CSS.Border) -> some HTML {
        self.inlineStyle("border", border.description)
    }

    @discardableResult
    public func borderRadius(_ radius: CSS.Border.Radius) -> some HTML {
        self.inlineStyle("border-radius", radius.description)
    }
}
