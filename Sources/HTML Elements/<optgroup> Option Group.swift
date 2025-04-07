//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct OptionGroup<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "optgroup" }
    
    public var disabled: Disabled?
    public var label: String?
    
    public let content: () -> HTML
    
    public init(
        disabled: Disabled? = nil,
        label: String? = nil,
        content: @escaping () -> HTML
    ) {
        self.disabled = disabled
        self.label = label
        self.content = content
    }
}

public typealias optgroup = OptionGroup
