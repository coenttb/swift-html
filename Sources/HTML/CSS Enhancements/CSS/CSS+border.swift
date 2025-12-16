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
        _ border: Border?
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
                    base.inlineStyle(RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)"))
                } else {
                    // Different light/dark: emit both with dark mode media query
                    let ctx = HTML.Style.Context.current
                    let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                    let darkAtRule: HTML.AtRule = {
                        if let existingAtRule = ctx.atRule {
                            // Combine with existing media query using Media's and() method
                            let combined = darkMedia.and(W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue))
                            return HTML.AtRule(rawValue: combined.rawValue)
                        } else {
                            return HTML.AtRule.Media(darkMedia)
                        }
                    }()

                    HTML.Styled(
                        HTML.Styled(base, RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)"), atRule: ctx.atRule, selector: ctx.selector, pseudo: ctx.pseudo),
                        RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(darkColor)"),
                        atRule: darkAtRule,
                        selector: ctx.selector,
                        pseudo: ctx.pseudo
                    )
                }
            } else {
                // Individual sides - use nested _Conditional via result builder
                borderSidesView(
                    sides: sides,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    isSingleColor: isSingleColor
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
        color: HTMLColor? = nil
    ) -> CSS<some HTML.View> {
        self.border(Border(sides: .init(sides), width: width, style: style, color: color))
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func border(
        _ sides: Border.Side...,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil
    ) -> CSS<some HTML.View> {
        self.border(Border(sides: .init(sides), width: width, style: style, color: color))
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
        isSingleColor: Bool
    ) -> CSS<some HTML.View> {
        base
            .applyBorderSide(
                shouldApply: sides.contains(.top),
                property: BorderTop.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
            .applyBorderSide(
                shouldApply: sides.contains(.right),
                property: BorderRight.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
            .applyBorderSide(
                shouldApply: sides.contains(.bottom),
                property: BorderBottom.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
            .applyBorderSide(
                shouldApply: sides.contains(.left),
                property: BorderLeft.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
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
        isSingleColor: Bool
    ) -> some HTML.View {
        if shouldApply {
            if isSingleColor {
                self.inlineStyle(RawProperty<P>("\(borderStyle) \(lightColor)"))
            } else {
                // Different light/dark: emit both with dark mode media query
                let ctx = HTML.Style.Context.current
                let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                let darkAtRule: HTML.AtRule = {
                    if let existingAtRule = ctx.atRule {
                        // Combine with existing media query using Media's and() method
                        let combined = darkMedia.and(W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue))
                        return HTML.AtRule(rawValue: combined.rawValue)
                    } else {
                        return HTML.AtRule.Media(darkMedia)
                    }
                }()

                HTML.Styled(
                    HTML.Styled(self, RawProperty<P>("\(borderStyle) \(lightColor)"), atRule: ctx.atRule, selector: ctx.selector, pseudo: ctx.pseudo),
                    RawProperty<P>("\(borderStyle) \(darkColor)"),
                    atRule: darkAtRule,
                    selector: ctx.selector,
                    pseudo: ctx.pseudo
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
        color: HTMLColor? = nil
    ) -> CSS<some HTML.View> {
        self.border([.top], width: width, style: style, color: color)
    }

    @inlinable
    @discardableResult
    public func borderBottom(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil
    ) -> CSS<some HTML.View> {
        self.border([.bottom], width: width, style: style, color: color)
    }

    @inlinable
    @discardableResult
    public func borderLeft(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil
    ) -> CSS<some HTML.View> {
        self.border([.left], width: width, style: style, color: color)
    }

    @inlinable
    @discardableResult
    public func borderRight(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil
    ) -> CSS<some HTML.View> {
        self.border([.right], width: width, style: style, color: color)
    }
}
