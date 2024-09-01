import Foundation
import HTML

extension HTML {
    @discardableResult
    public func backgroundColor(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("background-color", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func transition(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("transition", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func opacity(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("opacity", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func color(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("color", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func zIndex(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("z-index", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    
    @discardableResult
    public func transform(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("transform", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func backgroundSize(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("background-size", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func background(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("background", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func opacity(_ value: CSS.Opacity, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("opacity", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func textAlign(_ value: CSS.TextAlign? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("text-align", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func position(_ value: CSS.Position?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("position", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    public func color(
        _ color: HTMLColor?,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        inlineStyle("color", color?.rawValue, media: nil, pre: pre, pseudo: pseudo)
            .inlineStyle("color", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
}
extension HTML {
    @discardableResult
    public func overflow(_ value: CSS.Overflow?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("overflow", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func overflowX(_ value: CSS.Overflow.Value?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("overflow-x", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func overflowY(_ value: CSS.Overflow.Value?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("overflow-y", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func fontSize(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("font-size", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontWeight(_ value: CSS.FontWeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("font-weight", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func boxSizing(_ value: CSS.BoxSizing?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("box-sizing", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func cursor(_ value: CSS.Cursor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("cursor", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func visibility(_ value: CSS.Visibility?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("visibility", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func width(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func height(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func minWidth(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("min-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func minHeight(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("min-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func maxWidth(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("max-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func maxHeight(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("max-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    // NOTE: Display.none can conflict with Display?.none, and Display?.none gets precendence apparently. So can't have optional parameter here.
    @discardableResult
    public func display(_ display: CSS.Display, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("display", display.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func margin(_ margin: CSS.Margin? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("margin", margin?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func margin(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        margin(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func margin(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        margin(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func padding(_ padding: CSS.Padding?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("padding", padding?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func padding(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        padding(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func padding(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        padding(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func top(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("top", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func left(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("left", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func right(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("right", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func bottom(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("bottom", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func border(_ border: CSS.Border, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        switch border {
        case .all(let width, let style, let color):
            return inlineStyle("border", "\(width) \(style.rawValue) \(color?.description ?? "")", media: mediaQuery, pre: pre, pseudo: pseudo)
        case .top(let width, let style, let color):
            return inlineStyle("border-top", "\(width) \(style.rawValue) \(color?.description ?? "")", media: mediaQuery, pre: pre, pseudo: pseudo)
        case .right(let width, let style, let color):
            return inlineStyle("border-right", "\(width) \(style.rawValue) \(color?.description ?? "")", media: mediaQuery, pre: pre, pseudo: pseudo)
        case .bottom(let width, let style, let color):
            return inlineStyle("border-bottom", "\(width) \(style.rawValue) \(color?.description ?? "")", media: mediaQuery, pre: pre, pseudo: pseudo)
        case .left(let width, let style, let color):
            return inlineStyle("border-left", "\(width) \(style.rawValue) \(color?.description ?? "")", media: mediaQuery, pre: pre, pseudo: pseudo)
        case .width(let width):
            return inlineStyle("border-width", width.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .style(let style):
            return inlineStyle("border-style", style.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .color(let color):
            return inlineStyle("border-color", color.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .radius(let radius):
            return inlineStyle("border-radius", radius.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .global(let global):
            return inlineStyle("border", global.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        }
    }
}

extension HTML {
    @discardableResult
    public func background(_ background: CSS.Background, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        inlineStyle("background", background.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


// HTML extension for size
extension HTML {
    @discardableResult
    public func size(width: Length? = nil, height: Length? = nil) -> some HTML {
        inlineStyle("width", width?.description)
        .inlineStyle("height", height?.description)
    }
        
    @discardableResult
    public func width(_ width: Length?) -> some HTML {
        self.inlineStyle("width", width?.description)
    }
    
    @discardableResult
    public func height(_ height: Length?) -> some HTML {
        self.inlineStyle("height", height?.description)
    }
}


extension HTML {
    @HTMLBuilder
    public func hidden(_ hidden: Bool = true) -> some HTML {
        if hidden {
            size(width: .px(1), height: .px(1))
                .inlineStyle("clip", "rect(1px,1px,1px,1px)")
                .inlineStyle("overflow", "hidden")
                .inlineStyle("position", "absolute")
        } else {
            self
        }
    }
}


extension HTML {
    @discardableResult
    @HTMLBuilder
    public func border(
        width: CSS.Length?,
        style: CSS.Border.Style = .solid,
        color: HTMLColor
    ) -> some HTML {
        if let width {
            self.border(.all(width: .length(width), style: style, color: color))
        } else {
            self
        }
    }
}
