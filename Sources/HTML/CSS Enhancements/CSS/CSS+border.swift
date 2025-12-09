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
    @CSS.Builder
    public func border(
        _ border: Border?,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        if let border {
            // Extract common border properties
            let borderStyle = "\(border.width?.description ?? "") \(border.style?.description ?? "")"
            let lightColor = border.color?.light.description ?? ""
            let darkColor = border.color?.dark.description ?? ""
            let isSingleColor = border.color?.isSingleColor ?? true
            let sides = border.sides ?? Set(Border.Side.allCases)
            let isAllSides = sides.count == Border.Side.allCases.count

            if isAllSides {
                // All sides - use shorthand property
                if isSingleColor {
                    base.inlineStyle(
                        RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)"),
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                } else {
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
                }
            } else {
                // Individual sides - use nested _Conditional via result builder
                borderSidesView(
                    sides: sides,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    isSingleColor: isSingleColor,
                    media: mediaQuery,
                    selector: selector,
                    pseudo: pseudo
                )
            }
        } else {
            base
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
    ) -> CSS<some HTML.View> {
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
    ) -> CSS<some HTML.View> {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }
}

// MARK: - Border Sides with Nested _Conditional

extension CSS {
    /// Applies border styles to individual sides using nested _Conditional types.
    ///
    /// Each side check produces a _Conditional wrapping the styled or unstyled view.
    /// The sides are applied in sequence: top -> right -> bottom -> left.
    @usableFromInline
    @CSS.Builder
    func borderSidesView(
        sides: Set<Border.Side>,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        isSingleColor: Bool,
        media mediaQuery: W3C_CSS_MediaQueries.Media?,
        selector: HTML.Selector?,
        pseudo: HTML.Pseudo?
    ) -> CSS<some HTML.View> {
        base
            .applyBorderSide(
                shouldApply: sides.contains(.top),
                property: BorderTop.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor,
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
            .applyBorderSide(
                shouldApply: sides.contains(.right),
                property: BorderRight.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor,
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
            .applyBorderSide(
                shouldApply: sides.contains(.bottom),
                property: BorderBottom.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor,
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
            .applyBorderSide(
                shouldApply: sides.contains(.left),
                property: BorderLeft.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor,
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
    }
}

// MARK: - Conditional Border Side Modifier

extension HTML.View {
    /// Conditionally applies a border side style.
    ///
    /// Returns a `_Conditional` type: when `shouldApply` is true, returns the styled view;
    /// when false, returns `self` unchanged. This preserves type information through
    /// the result builder's `buildEither` mechanism.
    @usableFromInline
    @inlinable
    @HTML.Builder
    func applyBorderSide<P: W3C_CSS_Shared.Property>(
        shouldApply: Bool,
        property: P.Type,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        isSingleColor: Bool,
        media mediaQuery: W3C_CSS_MediaQueries.Media?,
        selector: HTML.Selector?,
        pseudo: HTML.Pseudo?
    ) -> some HTML.View {
        if shouldApply {
            if isSingleColor {
                self.inlineStyle(
                    RawProperty<P>("\(borderStyle) \(lightColor)"),
                    media: mediaQuery,
                    selector: selector,
                    pseudo: pseudo
                )
            } else {
                self
                    .inlineStyle(
                        RawProperty<P>("\(borderStyle) \(lightColor)"),
                        media: mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        RawProperty<P>("\(borderStyle) \(darkColor)"),
                        media: .prefersColorScheme(.dark) && mediaQuery,
                        selector: selector,
                        pseudo: pseudo
                    )
            }
        } else {
            self
        }
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
    ) -> CSS<some HTML.View> {
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
    ) -> CSS<some HTML.View> {
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
    ) -> CSS<some HTML.View> {
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
    ) -> CSS<some HTML.View> {
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
