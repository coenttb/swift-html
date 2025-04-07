//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct ProgressIndicator<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "progress" }
    
    /// This attribute describes how much work the task indicated by the progress element requires. The max attribute, if present, must have a value greater than 0 and be a valid floating point number. The default value is `1`.
    public var max: Max?
    
    /// This attribute specifies how much of the task that has been completed. It must be a valid floating point number between 0 and max, or between 0 and 1 if max is omitted. If there is no value attribute, the progress bar is indeterminate; this indicates that an activity is ongoing with no indication of how long it is expected to take.
    public var value: Double?
    
    public let content: () -> HTML
    
    public init(
        max: Max? = nil,
        value: Double? = nil,
        content: @escaping () -> HTML
    ) {
        self.max = max
        self.value = value
        self.content = content
    }
}

public typealias progress = ProgressIndicator
