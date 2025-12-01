//
//  CSS+borderBlockColor.swift
//  swift-html
//
//  CSS border-block-color property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderBlockColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.BorderBlockColor.self,
            .value(darkModeColor),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func borderBlockColor(
        _ color: DarkModeColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BorderBlockColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderBlockColor(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BorderBlockColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

// Maybe instead of this signture:
//extension CSS {
//    @inlinable
//    @discardableResult
//    @_disfavoredOverload
//    public func borderBlockColor(
//        _ value: CSS_Standard.Color.Value?,
//        media: W3C_CSS_MediaQueries.Media? = nil,
//        selector: HTML.Selector? = nil,
//        pseudo: HTML.Pseudo? = nil
//    ) -> CSS<HTML.AnyView> {
//        applyColorProperty(
//            CSS_Standard.BorderBlockColor.self,
//            value,
//            media: media,
//            selector: selector,
//            pseudo: pseudo
//        )
//    }
//}
// We should try this?
//extension CSS {
//    @inlinable
//    @discardableResult
//    @_disfavoredOverload
//    public func borderBlockColor<HTML: HTML.View >(
//        _ value: CSS_Standard.Color.Value?,
//        media: W3C_CSS_MediaQueries.Media? = nil,
//        selector: HTML.Selector? = nil,
//        pseudo: HTML.Pseudo? = nil
//    ) -> some CSS<HTML> {
//    ....
//    }
//}
// And then a CSS.Builder that allows for mismatched 'return' types?
