//
//  CSSPropertyAccessor.swift
//  swift-html
//
//  Provides namespaced access to CSS properties for better discoverability.
//  Usage: `div.css.color(.red).padding(.px(16)).display(.flex)`
//
//  The `.css` accessor provides an alternative way to access CSS properties,
//  grouping them for easier autocomplete discovery. Once in the CSS namespace,
//  you can chain methods fluently without repeating `.css`.
//

import CSS_Rendering
import CSS_Standard

/// Provides namespaced access to CSS properties for better discoverability.
///
/// Access CSS properties through the `.css` accessor on any `HTML.View`,
/// then chain methods fluently within the namespace:
/// ```swift
/// div.css
///     .color(.red)
///     .padding(.px(16))
///     .display(.flex)
/// ```
///
/// `CSSPropertyAccessor` conforms to `HTML.View`, so it can be used directly
/// anywhere an `HTML.View` is expected - no explicit unwrapping required:
/// ```swift
/// var body: some HTML.View {
///     div.css.color(.red).padding(.px(16))
/// }
/// ```
///
/// The namespace helps with autocomplete discoverability and provides
/// disambiguation when types conform to both `HTML.View` and `SwiftUI.View`.
public struct CSSPropertyAccessor<Base: HTML.View>: HTML.View {
    @usableFromInline
    let base: Base

    @inlinable
    init(base: Base) {
        self.base = base
    }

    // MARK: - HTML.View Conformance

    @inlinable
    public var body: Base {
        base
    }

    // MARK: - Color Properties

    @inlinable
    @discardableResult
    public func color(
        _ color: Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(base.color(color, media: media, selector: selector, pseudo: pseudo))
        )
    }

    @inlinable
    @discardableResult
    public func backgroundColor(
        _ color: BackgroundColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(base.backgroundColor(color, media: media, selector: selector, pseudo: pseudo))
        )
    }

    // MARK: - Layout Properties

    @inlinable
    @discardableResult
    public func display(
        _ display: Display?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.display(display, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func position(
        _ position: W3C_CSS_Positioning.Position?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.position(position, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Sizing Properties

    @inlinable
    @discardableResult
    public func width(
        _ width: CSS_Standard.Width?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.width(width, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func height(
        _ height: CSS_Standard.Height?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.height(height, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func maxWidth(
        _ maxWidth: MaxWidth?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.maxWidth(maxWidth, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func maxHeight(
        _ maxHeight: MaxHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.maxHeight(maxHeight, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func minWidth(
        _ minWidth: MinWidth?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.minWidth(minWidth, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func minHeight(
        _ minHeight: MinHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.minHeight(minHeight, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Spacing Properties

    @inlinable
    @discardableResult
    public func padding(
        _ padding: Padding?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.padding(padding, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func margin(
        _ margin: Margin?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.margin(margin, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Flexbox Properties

    @inlinable
    @discardableResult
    public func flexDirection(
        _ direction: FlexDirection?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.flexDirection(direction, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func flexWrap(
        _ wrap: FlexWrap?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.flexWrap(wrap, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func justifyContent(
        _ justifyContent: JustifyContent?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.justifyContent(justifyContent, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func alignItems(
        _ alignItems: AlignItems?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.alignItems(alignItems, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func gap(
        _ gap: Gap?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.gap(gap, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Typography Properties

    @inlinable
    @discardableResult
    public func fontSize(
        _ fontSize: CSS_Standard.FontSize?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.fontSize(fontSize, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func fontWeight(
        _ fontWeight: FontWeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.fontWeight(fontWeight, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func fontFamily(
        _ fontFamily: FontFamily?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.fontFamily(fontFamily, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func lineHeight(
        _ lineHeight: LineHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.lineHeight(lineHeight, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func textAlign(
        _ textAlign: TextAlign?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.textAlign(textAlign, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func textDecoration(
        _ textDecoration: TextDecoration?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.textDecoration(textDecoration, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Border Properties

    @inlinable
    @discardableResult
    public func borderRadius(
        _ borderRadius: BorderRadius?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.borderRadius(borderRadius, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func borderWidth(
        _ borderWidth: BorderWidth?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.borderWidth(borderWidth, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func borderStyle(
        _ borderStyle: BorderStyle?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.borderStyle(borderStyle, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func borderColor(
        _ borderColor: BorderColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.borderColor(borderColor, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Effects Properties

    @inlinable
    @discardableResult
    public func opacity(
        _ opacity: Opacity?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.opacity(opacity, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func boxShadow(
        _ boxShadow: BoxShadow?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.boxShadow(boxShadow, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func overflow(
        _ overflow: W3C_CSS_BoxModel.Overflow?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.overflow(overflow, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func cursor(
        _ cursor: Cursor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.cursor(cursor, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Transform & Animation Properties

    @inlinable
    @discardableResult
    public func transform(
        _ transform: Transform?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.transform(transform, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func transition(
        _ transition: Transition?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.transition(transition, media: media, selector: selector, pseudo: pseudo)
        )
    }

    // MARK: - Position Offsets

    @inlinable
    @discardableResult
    public func top(
        _ top: Top?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.top(top, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func right(
        _ right: Right?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.right(right, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func bottom(
        _ bottom: Bottom?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.bottom(bottom, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func left(
        _ left: Left?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.left(left, media: media, selector: selector, pseudo: pseudo)
        )
    }

    @inlinable
    @discardableResult
    public func zIndex(
        _ zIndex: ZIndex?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTMLInlineStyle<Base>> {
        CSSPropertyAccessor<HTMLInlineStyle<Base>>(
            base: base.zIndex(zIndex, media: media, selector: selector, pseudo: pseudo)
        )
    }
}

// MARK: - HTML.View Extension

extension HTML.View {
    /// Access CSS properties through a namespaced accessor for better discoverability.
    ///
    /// The `.css` accessor provides fluent chaining within the namespace:
    /// ```swift
    /// div.css
    ///     .color(.red)
    ///     .padding(.px(16))
    ///     .display(.flex)
    /// ```
    ///
    /// `CSSPropertyAccessor` conforms to `HTML.View`, so no explicit unwrapping
    /// is needed - use it directly in result builders and `some HTML.View` returns.
    @inlinable
    public var css: CSSPropertyAccessor<Self> {
        CSSPropertyAccessor(base: self)
    }
}
