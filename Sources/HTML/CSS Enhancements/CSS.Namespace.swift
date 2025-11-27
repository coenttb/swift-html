//
//  CSS.Namespace.swift
//  swift-html
//
//  Provides namespaced access to CSS properties for better discoverability.
//  Usage: `div.css.color(.red).css.padding(.px(16))`
//
//  The `.css` accessor provides an alternative way to access CSS properties,
//  grouping them for easier autocomplete discovery. The original flat methods
//  (e.g., `.color(.red)`) continue to work.
//

import CSS_Rendering
import CSS_Standard

/// Provides namespaced access to CSS properties for better discoverability.
///
/// Access CSS properties through the `.css` accessor on any `HTML.View`:
/// ```swift
/// div
///     .css.color(.red)
///     .css.padding(.px(16))
///     .css.display(.flex)
/// ```
///
/// This is equivalent to the flat API:
/// ```swift
/// div
///     .color(.red)
///     .padding(.px(16))
///     .display(.flex)
/// ```
///
/// The namespace helps with autocomplete discoverability, especially for
/// less commonly used CSS properties.
public struct CSSPropertyAccessor<Base: HTML.View> {
    @usableFromInline
    let base: Base

    @inlinable
    init(base: Base) {
        self.base = base
    }

    // MARK: - Color Properties

    @inlinable
    @discardableResult
    @HTML.Builder
    public func color(
        _ color: Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        base.color(color, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func backgroundColor(
        _ color: BackgroundColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.backgroundColor(color, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Layout Properties

    @inlinable
    @discardableResult
    public func display(
        _ display: Display?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.display(display, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func position(
        _ position: W3C_CSS_Positioning.Position?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.position(position, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Sizing Properties

    @inlinable
    @discardableResult
    public func width(
        _ width: CSS_Standard.Width?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.width(width, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func height(
        _ height: CSS_Standard.Height?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.height(height, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func maxWidth(
        _ maxWidth: MaxWidth?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.maxWidth(maxWidth, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func maxHeight(
        _ maxHeight: MaxHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.maxHeight(maxHeight, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func minWidth(
        _ minWidth: MinWidth?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.minWidth(minWidth, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func minHeight(
        _ minHeight: MinHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.minHeight(minHeight, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Spacing Properties

    @inlinable
    @discardableResult
    public func padding(
        _ padding: Padding?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.padding(padding, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func margin(
        _ margin: Margin?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.margin(margin, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Flexbox Properties

    @inlinable
    @discardableResult
    public func flexDirection(
        _ direction: FlexDirection?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.flexDirection(direction, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func flexWrap(
        _ wrap: FlexWrap?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.flexWrap(wrap, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func justifyContent(
        _ justifyContent: JustifyContent?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.justifyContent(justifyContent, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func alignItems(
        _ alignItems: AlignItems?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.alignItems(alignItems, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func gap(
        _ gap: Gap?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.gap(gap, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Typography Properties

    @inlinable
    @discardableResult
    public func fontSize(
        _ fontSize: CSS_Standard.FontSize?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.fontSize(fontSize, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func fontWeight(
        _ fontWeight: FontWeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.fontWeight(fontWeight, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func fontFamily(
        _ fontFamily: FontFamily?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.fontFamily(fontFamily, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func lineHeight(
        _ lineHeight: LineHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.lineHeight(lineHeight, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func textAlign(
        _ textAlign: TextAlign?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.textAlign(textAlign, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func textDecoration(
        _ textDecoration: TextDecoration?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.textDecoration(textDecoration, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Border Properties

    @inlinable
    @discardableResult
    public func borderRadius(
        _ borderRadius: BorderRadius?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.borderRadius(borderRadius, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func borderWidth(
        _ borderWidth: BorderWidth?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.borderWidth(borderWidth, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func borderStyle(
        _ borderStyle: BorderStyle?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.borderStyle(borderStyle, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func borderColor(
        _ borderColor: BorderColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.borderColor(borderColor, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Effects Properties

    @inlinable
    @discardableResult
    public func opacity(
        _ opacity: Opacity?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.opacity(opacity, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func boxShadow(
        _ boxShadow: BoxShadow?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.boxShadow(boxShadow, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func overflow(
        _ overflow: W3C_CSS_BoxModel.Overflow?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.overflow(overflow, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func cursor(
        _ cursor: Cursor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.cursor(cursor, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Transform & Animation Properties

    @inlinable
    @discardableResult
    public func transform(
        _ transform: Transform?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.transform(transform, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func transition(
        _ transition: Transition?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.transition(transition, media: media, selector: selector, pseudo: pseudo)
    }

    // MARK: - Position Offsets

    @inlinable
    @discardableResult
    public func top(
        _ top: Top?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.top(top, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func right(
        _ right: Right?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.right(right, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func bottom(
        _ bottom: Bottom?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.bottom(bottom, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func left(
        _ left: Left?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.left(left, media: media, selector: selector, pseudo: pseudo)
    }

    @inlinable
    @discardableResult
    public func zIndex(
        _ zIndex: ZIndex?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Base> {
        base.zIndex(zIndex, media: media, selector: selector, pseudo: pseudo)
    }
}

// MARK: - HTML.View Extension

extension HTML.View {
    /// Access CSS properties through a namespaced accessor for better discoverability.
    ///
    /// The `.css` accessor provides an alternative way to access CSS properties:
    /// ```swift
    /// div
    ///     .css.color(.red)
    ///     .css.padding(.px(16))
    ///     .css.display(.flex)
    /// ```
    @inlinable
    public var css: CSSPropertyAccessor<Self> {
        CSSPropertyAccessor(base: self)
    }
}

// MARK: - Chaining Support for CSSPropertyAccessor results

extension HTMLInlineStyle {
    /// Continue accessing CSS properties through the namespace after applying a style.
    @inlinable
    public var css: CSSPropertyAccessor<Self> {
        CSSPropertyAccessor(base: self)
    }
}
