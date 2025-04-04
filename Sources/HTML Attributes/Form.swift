//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 04/04/2025.
//

import Foundation

public struct Form: Sendable, Equatable {
    
    /// A string indicating the URL to which to submit the data. This takes precedence over the action attribute on the `<form>` element that owns the `<input>`.
    ///
    /// This attribute is also available on `<input type="submit">` and `<button>` elements.
    public var action: Form.Action?
    
    /// A string that identifies the encoding method to use when submitting the form data to the server.
    public var enctype: Form.Enctype?
    
    /// A string indicating the HTTP method to use when submitting the form's data; this value overrides any method attribute given on the owning form.
    public var method: Form.Method?
    
    /// A Boolean attribute which, if present, specifies that the form should not be validated before submission to the server. This overrides the value of the novalidate attribute on the element's owning form.
    public var novalidate: Bool?
    
    /// A string which specifies a name or keyword that indicates where to display the response received after submitting the form. The string must be the name of a browsing context (that is, a tab, window, or `<iframe>`. A value specified here overrides any target given by the target attribute on the `<form>` that owns this input.
    public var target: Form.Target?
    
    /// Create a new form override configuration
    public init(
        action: Form.Action? = nil,
        enctype: Form.Enctype? = nil,
        method: Form.Method? = nil,
        novalidate: Bool? = nil,
        target: Form.Target? = nil
    ) {
        self.action = action
        self.enctype = enctype
        self.method = method
        self.novalidate = novalidate
        self.target = target
    }
}

extension Form {
    public typealias ID = String
    public typealias Enctype = HTML_Attributes.Enctype
    public typealias Target = HTML_Attributes.Target
    public typealias Action = HTML_Attributes.Action
    public typealias Method = HTML_Attributes.Method
}

