//
//  HTML.View+border.swift
//  swift-html
//
//  Border convenience methods for HTML.View.
//

import CSS_Rendering
import CSS_Standard

extension HTML.View {
    @discardableResult
    @HTML.Builder
    public func border(
        _ border: Border?,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        switch border {
        case .none:
            self

        case .some(let border):
            // Extract common border properties
            let borderStyle =
                "\(border.width?.description ?? "") \(border.style?.description ?? "")"
            let lightColor = border.color?.light.description ?? ""
            let darkColor = border.color?.dark.description ?? ""

            if border.sides == nil || border.sides?.count == Border.Side.allCases.count {
                self
                    .inlineStyle(
                        W3C_CSS_Backgrounds.Border.property,
                        "\(borderStyle) \(lightColor)",
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        W3C_CSS_Backgrounds.Border.property,
                        "\(borderStyle) \(darkColor)",
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            } else {
                borderSides(
                    border: border,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    selector: selector,
                    pseudo: pseudo
                )
            }
        }
    }

    @discardableResult
    @HTML.Builder
    public func border(
        _ sides: [Border.Side] = Border.Side.allCases,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }

    @discardableResult
    @_disfavoredOverload
    @HTML.Builder
    public func border(
        _ sides: Border.Side...,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML.View {
    private func borderSides(
        border: Border,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector?,
        pseudo: HTML.Pseudo?
    ) -> some HTML.View {
        // Apply styles sequentially without nested conditionals to avoid deep generic nesting
        var result: any HTML.View = self

        if let sides = border.sides {
            if sides.contains(.top) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        BorderTop.property,
                        "\(borderStyle) \(lightColor)",
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        BorderTop.property,
                        "\(borderStyle) \(darkColor)",
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }

            if sides.contains(.left) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        BorderLeft.property,
                        "\(borderStyle) \(lightColor)",
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        BorderLeft.property,
                        "\(borderStyle) \(darkColor)",
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }

            if sides.contains(.bottom) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        BorderBottom.property,
                        "\(borderStyle) \(lightColor)",
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        BorderBottom.property,
                        "\(borderStyle) \(darkColor)",
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }

            if sides.contains(.right) {
                result = HTML.AnyView(result)
                    .inlineStyle(
                        BorderRight.property,
                        "\(borderStyle) \(lightColor)",
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        BorderRight.property,
                        "\(borderStyle) \(darkColor)",
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }
        }

        return HTML.AnyView(result)
    }
}

// MARK: - Individual Border Side Functions

extension HTML.View {
    @discardableResult
    @HTML.Builder
    public func borderTop(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
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

    @discardableResult
    @HTML.Builder
    public func borderBottom(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
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

    @discardableResult
    @HTML.Builder
    public func borderLeft(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
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

    @discardableResult
    @HTML.Builder
    public func borderRight(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
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
