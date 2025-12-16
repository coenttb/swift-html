//
//  CSS+text.swift
//  swift-html
//
//  Convenience method for common text styling properties.
//

import CSS
import CSS_Standard

extension CSS {
    /// Convenience method for common text styling properties.
    ///
    /// ```swift
    /// p.css.text(
    ///     align: .center,
    ///     decoration: .underline,
    ///     transform: .uppercase
    /// )
    /// ```
    @inlinable
    @discardableResult
    @CSS.Builder
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil
    ) -> CSS<some HTML.View> {
        base
            .inlineStyle(align)
            .inlineStyle(decoration)
            .inlineStyle(transform)
            .inlineStyle(overflow)
    }
}
