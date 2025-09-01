//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import HTMLComponents

public struct Favicons: HTML, Sendable {

    public struct SVG: Sendable {
        let lightMode: URL
        let darkMode: URL

        public init(lightMode: URL, darkMode: URL) {
            self.lightMode = lightMode
            self.darkMode = darkMode
        }
    }

    let icon: SVG
    let apple_touch_icon: String
    let manifest: Href
    let maskIcon: Href

    public init(
        icon: SVG,
        apple_touch_icon: String,
        manifest: Href,
        maskIcon: Href
    ) {
        self.icon = icon
        self.apple_touch_icon = apple_touch_icon
        self.manifest = manifest
        self.maskIcon = maskIcon
    }

    public var body: some HTML {
        link(
            href: "apple-touch-icon",
            sizes: "180x180"
        )()

        link(
            href: .init(icon.lightMode.relativePath),
            rel: .icon,
            type: .svg
        )()
        .inlineStyle("media", "(prefers-color-scheme: light)")

        link(
            href: .init(icon.darkMode.relativePath),
            rel: .icon,
            type: .svg
        )()
        .inlineStyle("media", "(prefers-color-scheme: dark)")

        link(
            href: manifest,
            rel: .manifest
        )()

        link(
            href: maskIcon,
            rel: "mask-icon"
        )()
    }
}
