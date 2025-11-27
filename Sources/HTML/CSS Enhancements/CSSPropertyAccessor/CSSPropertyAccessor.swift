//
//  CSSPropertyAccessor.swift
//  swift-html
//
//  Provides namespaced access to CSS properties for better discoverability.
//  Usage: `div.css.color(.red).padding(.px(16)).display(.flex)`
//
//  The `.css` accessor provides the exclusive way to access CSS properties,
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
    public init(base: Base) {
        self.base = base
    }

    // MARK: - HTML.View Conformance

    @inlinable
    public var body: Base {
        base
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
