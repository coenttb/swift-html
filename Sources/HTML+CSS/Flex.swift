import CSS
import HTMLCore

extension HTML {
    @_disfavoredOverload
    public func flexContainer(
        direction: String? = nil,
        wrap: String? = nil,
        justification: String? = nil,
        itemAlignment: String? = nil,
        rowGap: String? = nil,
        columnGap: String? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self
            .inlineStyle("display", "flex", media: media)
            .inlineStyle("flex-direction", direction, media: media)
            .inlineStyle("flex-wrap", wrap, media: media)
            .inlineStyle("justify-content", justification, media: media)
            .inlineStyle("align-items", itemAlignment, media: media)
            .inlineStyle("row-gap", rowGap, media: media)
            .inlineStyle("column-gap", columnGap, media: media)
    }
    
    public func flexItem(
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
        direction: Flex.Direction? = nil,
        wrap: Flex.Wrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: CSS.Length? = nil,
        columnGap: CSS.Length? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self.flexContainer(
            direction: direction?.rawValue,
            wrap: wrap?.rawValue,
            justification: justification?.description,
            itemAlignment: itemAlignment?.description,
            rowGap: rowGap?.description,
            columnGap: columnGap?.description,
            media: media
        )
    }
    
    public func flexItem(
        grow: Flex.Grow? = nil,
        shrink: Flex.Shrink? = nil,
        basis: Flex.Basis? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self
            .inlineStyle("flex-grow", grow.map(String.init), media: media)
            .inlineStyle("flex-shrink", shrink.map(String.init), media: media)
            .inlineStyle("flex-basis", basis?.description, media: media)
    }
}

