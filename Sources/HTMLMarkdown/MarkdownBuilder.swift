//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/08/2024.
//

import Foundation
import MarkdownBuilder

extension HTMLMarkdown {
  public init(
    @MarkdownBuilder _ markdown: () -> String,
    previewOnly: Bool = false
  ) {
    self = .init(markdown(), previewOnly: previewOnly)
  }
}
