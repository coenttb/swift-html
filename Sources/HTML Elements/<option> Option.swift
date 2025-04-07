//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Option<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "option" }
    
    public var disabled: Disabled?
    public var label: String?
    public var selected: Selected?
    public var value: Value
    
    public let content: () -> HTML
    
    public init(
        disabled: Disabled? = nil,
        label: String? = nil,
        selected: Selected? = nil,
        value: Value,
        content: @escaping () -> HTML
    ) {
        self.disabled = disabled
        self.label = label
        self.selected = selected
        self.value = value
        self.content = content
    }
}

public typealias option = Option

