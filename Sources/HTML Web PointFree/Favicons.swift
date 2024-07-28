//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import HTML_Web
import HTML_PointFree

extension Favicons {
    public static let pointfree: Favicons = .init(
        icon_16x16: "https://d3rccdn33rt8ze.cloudfront.net/favicons/apple-touch-icon.png",
        icon_32x32: "https://d3rccdn33rt8ze.cloudfront.net/favicons/favicon-32x32.png",
        apple_touch_icon: "https://d3rccdn33rt8ze.cloudfront.net/favicons/favicon-16x16.png",
        manifest: "https://d3rccdn33rt8ze.cloudfront.net/favicons/site.webmanifest",
        maskIcon: "https://d3rccdn33rt8ze.cloudfront.net/favicons/safari-pinned-tab.svg"
    )
}


typealias _Favicons = Favicons




