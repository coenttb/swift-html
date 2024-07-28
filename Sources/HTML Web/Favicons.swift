//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import HTML

public struct Favicons: HTML {
    let icon_16x16: String
    let icon_32x32: String
    let apple_touch_icon: String
    let manifest: String
    let maskIcon: String
    
    public init(
        icon_16x16: String,
        icon_32x32: String,
        apple_touch_icon: String,
        manifest: String,
        maskIcon: String
    ) {
        self.icon_16x16 = icon_16x16
        self.icon_32x32 = icon_32x32
        self.apple_touch_icon = apple_touch_icon
        self.manifest = manifest
        self.maskIcon = maskIcon
    }
    
    public var body: some HTML {
        link()
            .href(apple_touch_icon)
            .rel("apple-touch-icon")
            .attribute("sizes", "180x180")
        link()
            .href(icon_32x32)
            .rel("icon")
            .attribute("sizes", "32x32")
            .attribute("type", "image/png")
        link()
            .href(icon_16x16)
            .rel("icon")
            .attribute("sizes", "16x16")
            .attribute("type", "image/png")
        link()
            .href(manifest)
            .rel("manifest")
        link()
            .href(maskIcon)
            .rel("mask-icon")
    }
}
