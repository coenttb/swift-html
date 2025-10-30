//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation
import StringBuilder

extension style {
  public func callAsFunction(@StringBuilder _ content: () -> String) -> some HTML {
    style(media: media, blocking: blocking, nonce: nonce, title: title) {
      HTMLText(content())
    }
  }
}
