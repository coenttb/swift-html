//
//  CSS+border.swift
//  swift-html
//
//  Border convenience methods for CSS namespace with side configuration.
//

import CSS
import CSS_Standard

extension CSS {
    @inlinable
    @discardableResult
    public func border(
        _ border: Border?,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        guard let border = border else {
            return CSS<HTML.AnyView>(base: HTML.AnyView(base))
        }

        // Extract common border properties
        let borderStyle =
            "\(border.width?.description ?? "") \(border.style?.description ?? "")"
        let lightColor = border.color?.light.description ?? ""
        let darkColor = border.color?.dark.description ?? ""

        if border.sides == nil || border.sides?.count == Border.Side.allCases.count {
            return CSS<HTML.AnyView>(
                base: HTML.AnyView(
                    base
                        .inlineStyle(
                            RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)"),
                            media: mediaQuery,
                            selector: selector,
                            pseudo: pseudo
                        )
                        .inlineStyle(
                            RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(darkColor)"),
                            media: .prefersColorScheme(.dark) && mediaQuery,
                            selector: selector,
                            pseudo: pseudo
                        )
                )
            )
        } else {
            return borderSides(
                border: border,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
        }
    }

    @inlinable
    @discardableResult
    public func border(
        _ sides: [Border.Side] = Border.Side.allCases,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func border(
        _ sides: Border.Side...,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension CSS {
    @usableFromInline
    func borderSides(
        border: Border,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector?,
        pseudo: HTML.Pseudo?
    ) -> CSS<HTML.AnyView> {
        // Apply styles sequentially without nested conditionals to avoid deep generic nesting
        var result: any HTML.View = base

        if let sides = border.sides {
            if sides.contains(.top) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        RawProperty<BorderTop>("\(borderStyle) \(lightColor)"),
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        RawProperty<BorderTop>("\(borderStyle) \(darkColor)"),
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }

            if sides.contains(.left) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        RawProperty<BorderLeft>("\(borderStyle) \(lightColor)"),
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        RawProperty<BorderLeft>("\(borderStyle) \(darkColor)"),
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }

            if sides.contains(.bottom) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        RawProperty<BorderBottom>("\(borderStyle) \(lightColor)"),
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        RawProperty<BorderBottom>("\(borderStyle) \(darkColor)"),
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }

            if sides.contains(.right) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        RawProperty<BorderRight>("\(borderStyle) \(lightColor)"),
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        RawProperty<BorderRight>("\(borderStyle) \(darkColor)"),
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}

// MARK: - Individual Border Side Functions

extension CSS {
    @inlinable
    @discardableResult
    public func borderTop(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        self.border(
            [.top],
            width: width,
            style: style,
            color: color,
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func borderBottom(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        self.border(
            [.bottom],
            width: width,
            style: style,
            color: color,
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func borderLeft(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        self.border(
            [.left],
            width: width,
            style: style,
            color: color,
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func borderRight(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        self.border(
            [.right],
            width: width,
            style: style,
            color: color,
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }
}
