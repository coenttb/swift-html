//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/07/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

extension HTML {
  @discardableResult
  public func position(
    _ value: CSSPropertyTypes.Position?,
    top: Top?,
    right: Right?,
    bottom: Bottom?,
    left: Left?,
    media: CSSAtRuleTypes.Media? = nil,
    selector: PointFreeHTML.Selector? = nil,
    pseudo: Pseudo? = nil
  ) -> some HTML {
    self
      .position(value, media: media, selector: selector, pseudo: pseudo)
      .top(top, media: media, selector: selector, pseudo: pseudo)
      .left(left, media: media, selector: selector, pseudo: pseudo)
      .right(right, media: media, selector: selector, pseudo: pseudo)
      .bottom(bottom, media: media, selector: selector, pseudo: pseudo)
  }
}
