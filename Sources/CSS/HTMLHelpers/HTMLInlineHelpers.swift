import Foundation
import HTMLCore

extension HTML {
    @discardableResult
    public func backgroundColor(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background-color", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func transition(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("transition", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func opacity(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("opacity", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func color(_ value: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("color", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func zIndex(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("z-index", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func zIndex(_ value: Int?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("z-index", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    
    @discardableResult
    public func transform(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("transform", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func backgroundSize(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background-size", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func background(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func opacity(_ value: CSS.Opacity?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("opacity", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func textAlign(_ value: CSS.TextAlign? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-align", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func position(_ value: CSS.Position?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("position", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    public func color(
        _ color: HTMLColor?,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle("color", color?.rawValue, media: nil, pre: pre, pseudo: pseudo)
            .inlineStyle("color", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
}
extension HTML {
    @discardableResult
    public func overflow(_ value: CSS.Overflow?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func overflowX(_ value: CSS.Overflow.Value?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow-x", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func overflowY(_ value: CSS.Overflow.Value?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow-y", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func boxSizing(_ value: CSS.BoxSizing?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("box-sizing", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func cursor(_ value: CSS.Cursor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("cursor", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func visibility(_ value: CSS.Visibility?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("visibility", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func width(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func height(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func minWidth(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("min-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func minHeight(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("min-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func maxWidth(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("max-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func maxHeight(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("max-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func display(_ display: CSS.Display, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("display", display.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func margin(_ margin: CSS.Margin? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("margin", margin?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func margin(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func margin(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func margin(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: length, right: length, bottom: length, left: length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func padding(_ padding: CSS.Padding?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("padding", padding?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func padding(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func padding(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func padding(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: length, right: length, bottom: length, left: length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func top(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("top", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func left(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("left", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func right(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("right", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func bottom(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("bottom", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func border(_ border: CSS.Border, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
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
        case .none:
            return inlineStyle("border", "none", media: mediaQuery, pre: pre, pseudo: pseudo)
        }
    }
}

extension HTML {
    @discardableResult
    public func background(_ background: CSS.Background, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background", background.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func mixBlendMode(_ mixBlendMode: CSS.MixBlendMode?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("mix-blend-mode", mixBlendMode?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func size(width: Length? = nil, height: Length? = nil, media: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("width", width?.description, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("width", height?.description, media: media, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func size(_ size: Length?, media: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("width", size?.description, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("width", size?.description, media: media, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @HTMLBuilder
    public func hidden(_ hidden: Bool = true) -> some HTML {
        if hidden {
            size(width: .px(1), height: .px(1))
                .inlineStyle("clip", "rect(1px,1px,1px,1px)")
                .overflow(.hidden)
                .position(.absolute)
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
        color: HTMLColor,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let width {
            self.border(.all(width: .length(width), style: style, color: color), media: mediaQuery, pre: pre, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    public func clipPath(_ clipPath: ClipPath) -> HTMLInlineStyle<Self> {
        self.inlineStyle("clip-path", clipPath.cssValue)
    }
}

extension HTML {
    @HTMLBuilder
    public func listStyle(_ listStyle: ListStyle) -> some HTML {
        switch listStyle {
        case .reset:
            inlineStyle("list-style-type", "none")
                .padding(left: 0.rem)
        }
    }
}

public enum ListStyle {
    case reset
}



extension HTML {
    public func grow(_ n: Int? = 1, _ media: MediaQuery? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-grow", n.map { "\($0)" }, media: media)
    }
    
    public func shrink(_ n: Int? = 1, _ media: MediaQuery? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-shrink", n.map { "\($0)" }, media: media)
    }
}


extension HTML {
    @discardableResult
    public func font(_ font: Font, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        self
            .font(.family(font.family), media: mediaQuery, pre: pre, pseudo: pseudo)
            .font(.size(font.size), media: mediaQuery, pre: pre, pseudo: pseudo)
            .font(.weight(font.weight), media: mediaQuery, pre: pre, pseudo: pseudo)
            .font(.style(font.style), media: mediaQuery, pre: pre, pseudo: pseudo)
            .font(.variant(font.variant), media: mediaQuery, pre: pre, pseudo: pseudo)
            .font(.stretch(font.stretch), media: mediaQuery, pre: pre, pseudo: pseudo)
            .lineHeight(font.lineHeight, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func font(_ property: Font.Property?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        switch property {
        case .family(let families):
            let familyString = families?.map { $0.contains(" ") ? "\"\($0)\"" : $0 }.joined(separator: ", ")
            return inlineStyle("font-family", familyString, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .size(let size):
            return inlineStyle("font-size", size?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .weight(let weight):
            return inlineStyle("font-weight", weight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .style(let style):
            return inlineStyle("font-style", style?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .variant(let variant):
            return inlineStyle("font-variant", variant?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .lineHeight(let lineHeight):
            return inlineStyle("line-height", lineHeight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .stretch(let stretch):
            return inlineStyle("font-stretch", stretch?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .none:
            return inlineStyle("", nil, media: mediaQuery, pre: pre, pseudo: pseudo)
        }
    }


    @discardableResult
    public func fontFamily(_ families: [String]?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.family(families), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontSize(_ size: Font.FontSize?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.size(size), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontSize(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.size(length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontWeight(_ weight: Font.FontWeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.weight(weight), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontStyle(_ style: Font.FontStyle?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.style(style), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontVariant(_ variant: Font.FontVariant?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.variant(variant), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func lineHeight(_ lineHeight: Font.LineHeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.lineHeight(lineHeight), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontStretch(_ stretch: Font.FontStretch?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        font(.stretch(stretch), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @HTMLBuilder
    public func fontScale(_ fontScale: FontScale) -> HTMLInlineStyle<Self> {
            font(.size(.rem(fontScale.rawValue)))
    }
    
    @HTMLBuilder
    public func fontStyle(_ fontStyle: FontStyle) -> some HTML {
        switch fontStyle {
        case .body(.small):
            fontScale(.h6)
                .font(.weight(.normal))
                .lineHeight(.number(1.5))
            
        case .body(.regular):
            fontScale(.h5)
                .font(.weight(.normal))
                .lineHeight(.number(1.5))
        }
    }
}


public enum FontScale: Double {
    case h1 = 4
    case h2 = 3
    case h3 = 2
    case h4 = 1.5
    case h5 = 1
    case h6 = 0.875
}

public enum FontStyle {
    case body(Body)
    
    public enum Body {
        case regular
        case small
    }
}


extension HTML {
    @discardableResult
    public func backgroundColor(_ color: HTMLColor?, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background-color", color?.rawValue, pre: pre, pseudo: pseudo)
            .inlineStyle("background-color", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func background(_ color: HTMLColor?, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background", color?.rawValue, pre: pre, pseudo: pseudo)
            .inlineStyle("background", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
}
