//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes


public struct Output<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "output" }
    
    public var `for`: For?
    public var form: HTML_Attributes.Form.ID?
    public var name: Name?
    
    public init(
        form: HTML_Attributes.Form.ID? = nil,
        name: Name? = nil
    ) {
        self.form = form
        self.name = name
    }
}

public typealias output = Output

