import Foundation
import PointFreeHtml
import CSS

extension HTML {
//    @_disfavoredOverload
//    public func flexContainer(
//        direction: String? = nil,
//        wrap: String? = nil,
//        justification: String? = nil,
//        itemAlignment: String? = nil,
//        rowGap: String? = nil,
//        columnGap: String? = nil,
//        media: MediaQuery? = nil
//    ) -> some HTML {
//        self
//            .display(.flex, media: media)
//            .inlineStyle("flex-direction", direction, media: media)
//            .inlineStyle("flex-wrap", wrap, media: media)
//            .inlineStyle("justify-content", justification, media: media)
//            .inlineStyle("align-items", itemAlignment, media: media)
//            .inlineStyle("row-gap", rowGap, media: media)
//            .inlineStyle("column-gap", columnGap, media: media)
//    }
    
    func flexItem(
        grow: String? = nil,
        shrink: String? = nil,
        basis: String? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self
            .inlineStyle("flex-grow", grow, media: media)
            .inlineStyle("flex-shrink", shrink, media: media)
            .inlineStyle("flex-basis", basis, media: media)
    }
}

extension HTML {
    public func flexContainer(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: RowGap? = nil,
        columnGap: CSS.Length? = nil,
        media: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .inlineStyle("", "")
            .display(.flex, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("flex-direction", direction?.rawValue, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("flex-wrap", wrap?.rawValue, media: media, pre: pre, pseudo: pseudo)
            .justifyContent(justification, media: media, pre: pre, pseudo: pseudo)
            .alignItems(itemAlignment, media: media, pre: pre, pseudo: pseudo)
            .rowGap(rowGap, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("column-gap", columnGap?.description, media: media, pre: pre, pseudo: pseudo)
    }
    
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self
            .inlineStyle("flex-grow", grow.map(String.init), media: media)
            .inlineStyle("flex-shrink", shrink.map(String.init), media: media)
            .inlineStyle("flex-basis", basis?.description, media: media)
    }
}

