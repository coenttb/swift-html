import Foundation
import HTML_CSS_PointFreeHTML



//
//extension HTML {
//    
//    @discardableResult
//    public func color(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let lightStyle = inlineStyle("color", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//        
//        if let darkColor = color?.dark {
//            return lightStyle.inlineStyle("color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
//        } else {
//            return lightStyle
//        }
//    }
//    
//    @discardableResult
//    public func backgroundColor(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let lightStyle = inlineStyle("background-color", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//        
//        if let darkColor = color?.dark {
//            return lightStyle.inlineStyle("background-color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
//        } else {
//            return lightStyle
//        }
//    }
//    
//    @discardableResult
//    public func background(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let lightStyle = inlineStyle("background", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//        
//        if let darkColor = color?.dark {
//            return lightStyle.inlineStyle("background", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
//        } else {
//            return lightStyle
//        }
//    }
//}
//
//
//extension HTML {
//    @discardableResult
//    public func position(_ value: CSS.Position?, top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("position", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .inlineStyle("top", top?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .inlineStyle("left", left?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .inlineStyle("right", right?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .inlineStyle("bottom", bottom?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//}
//
//
//
//extension HTML {
//    @discardableResult
//    public func margin(_ margin: CSS.Margin? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        if let margin = margin {
//            return switch margin {
//            case .trbl(let top, let right, let bottom, let left):
//                self.inlineStyle("margin-top", top?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//                    .inlineStyle("margin-right", right?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//                    .inlineStyle("margin-bottom", bottom?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//                    .inlineStyle("margin-left", left?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            default:
//                self.inlineStyle("margin", margin.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            }
//        }
//        // If no margin is provided, we still need to return an HTMLInlineStyle<Self>
//        return inlineStyle("margin", nil, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func margin(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        margin(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func margin(top: Length? = nil, horizontal: Length? = nil, bottom: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        margin(.trbl(top: top, right: horizontal, bottom: bottom, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func margin(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        margin(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func margin(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        margin(.trbl(top: length, right: length, bottom: length, left: length), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//}
//
//
//extension HTML {
//    @discardableResult
//    public func padding(_ padding: CSS.Padding? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        if let padding = padding {
//            return switch padding {
//            case .trbl(let top, let right, let bottom, let left):
//                self.inlineStyle("padding-top", top?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//                    .inlineStyle("padding-right", right?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//                    .inlineStyle("padding-bottom", bottom?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//                    .inlineStyle("padding-left", left?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            default:
//                self.inlineStyle("padding", padding.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            }
//        }
//        // If no padding is provided, we still need to return an HTMLInlineStyle<Self>
//        return inlineStyle("padding", nil, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func padding(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        padding(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func padding(top: Length? = nil, horizontal: Length? = nil, bottom: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        padding(.trbl(top: top, right: horizontal, bottom: bottom, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func padding(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        padding(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func padding(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        padding(.trbl(top: length, right: length, bottom: length, left: length), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//}

//
//extension HTML {
//    @discardableResult
//    public func size(width: Length? = nil, height: Length? = nil, media: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("width", width?.description, media: media, pre: pre, pseudo: pseudo)
//            .inlineStyle("height", height?.description, media: media, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func size(_ size: Length?, media: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("width", size?.description, media: media, pre: pre, pseudo: pseudo)
//            .inlineStyle("height", size?.description, media: media, pre: pre, pseudo: pseudo)
//    }
//}
//
//
//extension HTML {
//    @HTMLBuilder
//    public func hidden(_ hidden: Bool = true) -> some HTML {
//        if hidden {
//            size(width: .px(1), height: .px(1))
//                .inlineStyle("clip", "rect(1px,1px,1px,1px)")
//                .overflow(.hidden)
//                .position(.absolute)
//        } else {
//            self
//        }
//    }
//}
//
//
//
//extension HTML {
//    //    @discardableResult
//    //    public func font(_ font: Font, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> Self {
//    //        self
//    //            .fontFamily(font.family, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //            .fontSize(font.size, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //            .fontWeight(font.weight, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //            .fontStyle(font.style, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //            .fontVariant(font.variant, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //            .fontStretch(font.stretch, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //            .lineHeight(font.lineHeight, media: mediaQuery, pre: pre, pseudo: pseudo)
//    //    }
//    
//    @discardableResult
//    public func fontFamily(_ families: [String]?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let familyString = families?.map { $0.contains(" ") ? "\"\($0)\"" : $0 }.joined(separator: ", ")
//        return inlineStyle("font-family", familyString, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func fontSize(_ size: Font.Size?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("font-size", size?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func fontSize(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("font-size", length?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func fontWeight(_ weight: Font.Weight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("font-weight", weight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func fontStyle(_ style: Font.Style?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("font-style", style?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func fontVariant(_ variant: Font.Variant?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("font-variant", variant?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func lineHeight(_ lineHeight: LineHeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("line-height", lineHeight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func fontStretch(_ stretch: Font.Stretch?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("font-stretch", stretch?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func font(_ property: Font.Property?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        switch property {
//        case .family(let families):
//            return fontFamily(families, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .size(let size):
//            return fontSize(size, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .weight(let weight):
//            return fontWeight(weight, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .style(let style):
//            return fontStyle(style, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .variant(let variant):
//            return fontVariant(variant, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .lineHeight(let lineHeight):
//            return self.lineHeight(lineHeight, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .stretch(let stretch):
//            return fontStretch(stretch, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .none:
//            return self
//                .inlineStyle("", "")
//        }
//    }
//}
//
//extension HTML {
//    @HTMLBuilder
//    public func fontScale(_ fontScale: FontScale) -> HTMLInlineStyle<Self> {
//        font(.size(.rem(fontScale.rawValue)))
//    }
//    
//    @HTMLBuilder
//    public func fontStyle(_ fontStyle: FontStyle) -> some HTML {
//        switch fontStyle {
//        case .body(.small):
//            fontScale(.h6)
//                .font(.weight(.normal))
//                .lineHeight(.number(1.5))
//            
//        case .body(.regular):
//            fontScale(.h5)
//                .font(.weight(.normal))
//                .lineHeight(.number(1.5))
//        }
//    }
//}
//
//
//public enum FontScale: Double {
//    case h1 = 4
//    case h2 = 3
//    case h3 = 2
//    case h4 = 1.5
//    case h5 = 1
//    case h6 = 0.875
//}
//
//public enum FontStyle {
//    case body(Body)
//    
//    public enum Body {
//        case regular
//        case small
//    }
//}
//

//
//
//
//extension HTML {
//    @discardableResult
//    public func textAlign(_ value: TextAlign, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("text-align", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func textDecoration(_ value: TextDecoration, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("text-decoration", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func textDecorationLine(_ value: TextDecorationLine, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("text-decoration-line", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func textDecorationColor(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let lightStyle = inlineStyle("text-decoration-color", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//        
//        if let darkColor = color?.dark {
//            return lightStyle.inlineStyle("text-decoration-color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
//        } else {
//            return lightStyle
//        }
//    }

//    
//    @discardableResult
//    public func lineHeight(_ value: LineHeight, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("line-height", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    

//    @discardableResult
//    public func verticalAlign(_ value: VerticalAlign, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let alignValue: String
//        switch value {
//        case .keyword(let keyword):
//            alignValue = keyword.rawValue
//        case .length(let length):
//            alignValue = length.description
//        case .percentage(let percentage):
//            alignValue = "\(percentage)%"
//        }
//        return inlineStyle("vertical-align", alignValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }

//}
//
//
//extension HTML {
//    @discardableResult
//    public func listStyle(_ style: ListStyle, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        switch style {
//        case .none:
//            return inlineStyle("list-style-type", "none")
//                .inlineStyle("padding-left", "0")
//        case .type(let type):
//            return inlineStyle("list-style-type", type.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .image(let url):
//            return inlineStyle("list-style-image", "url('\(url)')", media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .position(let position):
//            return inlineStyle("list-style-position", position.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//        case .shorthand(let type, let position, let image):
//            var parts: [String] = []
//            if let type = type {
//                parts.append(type.rawValue)
//            }
//            if let position = position {
//                parts.append(position.rawValue)
//            }
//            if let image = image {
//                parts.append("url('\(image)')")
//            }
//            return inlineStyle("list-style", parts.joined(separator: " "), media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//    }
//}
//

//
//extension HTML {
//    func flexItem(
//        grow: String? = nil,
//        shrink: String? = nil,
//        basis: String? = nil,
//        media: MediaQuery? = nil
//    ) -> some HTML {
//        self
//            .inlineStyle("flex-grow", grow, media: media)
//            .inlineStyle("flex-shrink", shrink, media: media)
//            .inlineStyle("flex-basis", basis, media: media)
//    }
//}
//
//
//
//
//
//extension HTML {
//    
//    // Flex Container Properties
//    @discardableResult
//    public func flexContainer(
//        _ container: FlexContainer,
//        media mediaQuery: MediaQuery? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//        self
//            .display(.flex, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .flexDirection(container.direction, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .flexWrap(container.wrap, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .justifyContent(container.justifyContent, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .alignItems(container.alignItems, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .alignContent(container.alignContent, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    
//    public func flexContainer(
//        direction: FlexDirection? = nil,
//        wrap: FlexWrap? = nil,
//        justification: JustifyContent? = nil,
//        itemAlignment: AlignItems? = nil,
//        rowGap: RowGap? = nil,
//        columnGap: CSS.Length? = nil,
//        media: MediaQuery? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//        self
//            .display(.flex, media: media, pre: pre, pseudo: pseudo)
//            .inlineStyle("flex-direction", direction?.rawValue, media: media, pre: pre, pseudo: pseudo)
//            .inlineStyle("flex-wrap", wrap?.rawValue, media: media, pre: pre, pseudo: pseudo)
//            .justifyContent(justification, media: media, pre: pre, pseudo: pseudo)
//            .alignItems(itemAlignment, media: media, pre: pre, pseudo: pseudo)
//            .rowGap(rowGap, media: media, pre: pre, pseudo: pseudo)
//            .inlineStyle("column-gap", columnGap?.description, media: media, pre: pre, pseudo: pseudo)
//    }
//    //
//    public func flexItem(
//        grow: FlexGrow? = nil,
//        shrink: FlexShrink? = nil,
//        basis: FlexBasis? = nil,
//        media: MediaQuery? = nil
//    ) -> some HTML {
//        self
//            .inlineStyle("flex-grow", grow.map(String.init), media: media)
//            .inlineStyle("flex-shrink", shrink.map(String.init), media: media)
//            .inlineStyle("flex-basis", basis?.description, media: media)
//    }
//    
//    // Flex Item Properties
//    @discardableResult
//    public func flexItem(_ item: FlexItem, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
//        self
//            .flexGrow(item.grow, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .flexShrink(item.shrink, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .flexBasis(item.basis, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .alignSelf(item.alignSelf, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//}
//

//
//
//
//extension HTML {
//    @discardableResult
//    public func border(_ border: Border, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        switch border {
//        case .all(let width, let style, let color):
//            let lightStyle = inlineStyle("border", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
//            if let darkColor = color?.dark {
//                return lightStyle.inlineStyle("border", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
//            }
//            return lightStyle
//
//        case .top(let width, let style, let color):
//            let lightStyle = inlineStyle("border-top", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
//            if let darkColor = color?.dark {
//                return lightStyle.inlineStyle("border-top", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
//            }
//            return lightStyle
//
//        case .right(let width, let style, let color):
//            let lightStyle = inlineStyle("border-right", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
//            if let darkColor = color?.dark {
//                return lightStyle.inlineStyle("border-right", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
//            }
//            return lightStyle
//
//        case .bottom(let width, let style, let color):
//            let lightStyle = inlineStyle("border-bottom", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
//            if let darkColor = color?.dark {
//                return lightStyle.inlineStyle("border-bottom", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
//            }
//            return lightStyle
//
//        case .left(let width, let style, let color):
//            let lightStyle = inlineStyle("border-left", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
//            if let darkColor = color?.dark {
//                return lightStyle.inlineStyle("border-left", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
//            }
//            return lightStyle
//
//        case .width(let width):
//            return inlineStyle("border-width", width.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//
//        case .style(let style):
//            return inlineStyle("border-style", style.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//
//        case .color(let color):
//            let lightStyle = inlineStyle("border-color", color.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//            if let darkColor = color.dark {
//                return lightStyle.inlineStyle("border-color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
//            }
//            return lightStyle
//
//        case .radius(let radius):
//            return inlineStyle("border-radius", radius.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//
//        case .global(let global):
//            return inlineStyle("border", global.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//
//        case .none:
//            return inlineStyle("border", "none", media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//    }
//}
//
//extension HTML {
//    @discardableResult
//    @HTMLBuilder
//    public func border(
//        width: CSS.Length?,
//        style: Border.Style = .solid,
//        color: HTMLColor?,
//        media mediaQuery: MediaQuery? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//
//        if let width, let color {
//            let lightStyle = inlineStyle(
//                "border",
//                "\(width.description) \(style.rawValue) \(color.light.description)",
//                media: mediaQuery,
//                pre: pre,
//                pseudo: pseudo
//            )
//
//            if let darkColor = color.dark {
//                 lightStyle.inlineStyle(
//                    "border",
//                    "\(width.description) \(style.rawValue) \(darkColor.description)",
//                    media: .dark,
//                    pre: pre,
//                    pseudo: pseudo
//                )
//            } else {
//                 lightStyle
//            }
//        } else {
//            self
//        }
//    }
//}
//
//extension HTML {
//    @discardableResult
//    public func textShadow(_ value: TextShadow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let lightShadowValue = "\(value.offsetX) \(value.offsetY) \(value.blurRadius) \(value.color.light.description)"
//        let lightStyle = inlineStyle("text-shadow", lightShadowValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//        
//        if let darkColor = value.color.dark {
//            let darkShadowValue = "\(value.offsetX) \(value.offsetY) \(value.blurRadius) \(darkColor.description)"
//            return lightStyle.inlineStyle("text-shadow", darkShadowValue, media: .dark, pre: pre, pseudo: pseudo)
//        } else {
//            return lightStyle
//        }
//    }
//}
//
//extension HTML {
//    @discardableResult
//    public func borderSpacing(_ value: BorderSpacing, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let spacingValue = value.vertical != nil ? "\(value.horizontal) \(value.vertical!)" : value.horizontal.description
//        return inlineStyle("border-spacing", spacingValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//}
//
//// Assuming these structs need to be updated as well:
//
//public struct TextShadow {
//    let offsetX: CSS.Length
//    let offsetY: CSS.Length
//    let blurRadius: CSS.Length
//    let color: HTMLColor
//    
//    public init(offsetX: CSS.Length, offsetY: CSS.Length, blurRadius: CSS.Length, color: HTMLColor) {
//        self.offsetX = offsetX
//        self.offsetY = offsetY
//        self.blurRadius = blurRadius
//        self.color = color
//    }
//}
//
//public struct BorderSpacing {
//    let horizontal: CSS.Length
//    let vertical: CSS.Length?
//    
//    public init(horizontal: CSS.Length, vertical: CSS.Length? = nil) {
//        self.horizontal = horizontal
//        self.vertical = vertical
//    }
//}

//extension HTML {
//    public func transform(_ transform: Transform) -> HTMLInlineStyle<Self> {
//        inlineStyle("transform", transform.description)
//    }
//    
//    public func transform(_ transforms: Transform...) -> HTMLInlineStyle<Self> {
//        let combinedTransform = transforms.reduce(Transform.none) { $0 + $1 }
//        return transform(combinedTransform)
//    }
//    
//    // Convenience methods for common transforms
//    public func translate(_ x: Length, _ y: Length? = nil) -> HTMLInlineStyle<Self> {
//        transform(.translate(x, y))
//    }
//    
//    public func translate3d(_ x: Length, _ y: Length, _ z: Length) -> HTMLInlineStyle<Self> {
//        transform(.translate3d(x: x, y: y, z: z))
//    }
//    
//    public func scale(_ x: Double, _ y: Double? = nil) -> HTMLInlineStyle<Self> {
//        transform(.scale(x: x, y: y))
//    }
//    
//    public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> HTMLInlineStyle<Self> {
//        transform(.scale3d(x: x, y: y, z: z))
//    }
//    
//    public func rotate(_ angle: Angle) -> HTMLInlineStyle<Self> {
//        transform(.rotate(angle))
//    }
//    
//    public func rotate3d(_ x: Double, _ y: Double, _ z: Double, angle: Angle) -> HTMLInlineStyle<Self> {
//        transform(.rotate3d(x: x, y: y, z: z, angle: angle))
//    }
//    
//    public func skew(_ x: Angle, _ y: Angle? = nil) -> HTMLInlineStyle<Self> {
//        transform(.skew(x: x, y: y))
//    }
//    
//    public func perspective(_ length: Length) -> HTMLInlineStyle<Self> {
//        transform(.perspective(length))
//    }
//    
//    // Transform origin
//    public func transformOrigin(_ x: Length, _ y: Length, _ z: Length? = nil) -> HTMLInlineStyle<Self> {
//        if let z = z {
//            return inlineStyle("transform-origin", "\(x) \(y) \(z)")
//        } else {
//            return inlineStyle("transform-origin", "\(x) \(y)")
//        }
//    }
//    
//    // Transform style (3D)
//    public func transformStyle(_ style: TransformStyle) -> HTMLInlineStyle<Self> {
//        inlineStyle("transform-style", style.rawValue)
//    }
//    
//    // Backface visibility
//    public func backfaceVisibility(_ visibility: BackfaceVisibility) -> HTMLInlineStyle<Self> {
//        inlineStyle("backface-visibility", visibility.rawValue)
//    }
//}

////
////    // Convenience method for setting up a grid container
////    @discardableResult
////    public func gridContainer(_ container: GridContainer, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
////        self.display(.grid, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridTemplateColumns(container.templateColumns ?? .none, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridTemplateRows(container.templateRows ?? .none, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridTemplateAreas(container.templateAreas ?? .none, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridAutoColumns(container.autoColumns ?? .auto, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridAutoRows(container.autoRows ?? .auto, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridAutoFlow(container.autoFlow ?? .row, media: mediaQuery, pre: pre, pseudo: pseudo)
////            .gridGap(container.gap ?? GridGap(row: .px(0), column: .px(0)), media: mediaQuery, pre: pre, pseudo: pseudo)
////    }
////
////    // Convenience method for setting up a grid item
////    @discardableResult
////    public func gridItem(_ item: GridItem, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
////        var style = self
////        if let columnStart = item.columnStart {
////            style = style.gridColumnStart(columnStart, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        if let columnEnd = item.columnEnd {
////            style = style.gridColumnEnd(columnEnd, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        if let rowStart = item.rowStart {
////            style = style.gridRowStart(rowStart, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        if let rowEnd = item.rowEnd {
////            style = style.gridRowEnd(rowEnd, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        if let area = item.area {
////            style = style.gridArea(area, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        return style
////    }
//}

////
////// HTML helper methods
////extension HTML {
////    @discardableResult
////    public func boxShadow(_ shadow: BoxShadow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
////        let lightStyle = inlineStyle("box-shadow", shadow.description, media: mediaQuery, pre: pre, pseudo: pseudo)
////        
////        // Generate dark mode style if any shadow has a dark mode color
////        if shadow.shadows.contains(where: { $0.color != nil }) {
////            let darkShadow = BoxShadow(shadow.shadows.map { shadow in
////                var darkShadow = shadow
////                darkShadow.color = shadow.color
////                return darkShadow
////            })
////            return lightStyle.inlineStyle("box-shadow", darkShadow.description, media: .dark, pre: pre, pseudo: pseudo)
////        }
////        
////        return lightStyle
////    }
////    
////    @discardableResult
////    public func boxShadow(_ shadows: BoxShadow.Shadow..., media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
////        boxShadow(BoxShadow(shadows), media: mediaQuery, pre: pre, pseudo: pseudo)
////    }
////}
//
//
//

//
//extension HTML {
//    @discardableResult
//    public func columnCount(_ count: ColumnCount, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("column-count", count.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
//    @discardableResult
//    public func columnGap(_ gap: ColumnGap, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("column-gap", gap.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//    
////    @discardableResult
////    public func columns(_ columns: Columns, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
////        var style: some HTML = self
////        if let count = columns.count {
////            style = style.columnCount(count, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        if let gap = columns.gap {
////            style = style.columnGap(gap, media: mediaQuery, pre: pre, pseudo: pseudo)
////        }
////        return style
////    }
//}
//
