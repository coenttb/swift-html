//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

@_exported import CSS
@_exported import CSS_Standard
@_exported import HTML_Rendering
@_exported import HTML_Standard
@_exported import Markdown_HTML_Rendering
@_exported import SVG
@_exported import Standards

/// Backward-compatible typealias for DarkModeColor.
/// HTMLColor was the previous name, now unified as DarkModeColor in CSS module.
@available(*, deprecated, renamed: "DarkModeColor")
public typealias HTMLColor = DarkModeColor
