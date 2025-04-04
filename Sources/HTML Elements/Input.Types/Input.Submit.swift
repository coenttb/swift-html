///
/// `Input.Submit.swift`
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes

/// `<input type="submit">` elements are rendered as buttons. When the click event occurs (typically because the user clicked the button),
/// the user agent attempts to submit the form to the server.
extension Input {
    public struct Submit: Sendable, Equatable {
        /// A string which is displayed as the button's label. The value provides the accessible description for the button.
        /// If you don't specify a value, the button will have a default label, chosen by the user agent.
        public var value: String?
        
        /// A string indicating the URL to which to submit the data. This takes precedence over the action attribute on the `<form>` element.
        public var formaction: HTML_Attributes.Form.Action?
        
        /// A string that identifies the encoding method to use when submitting the form data to the server.
        public var formenctype: HTML_Attributes.Form.Enctype?
        
        /// A string indicating the HTTP method to use when submitting the form's data.
        public var formmethod: HTML_Attributes.Form.Method?
        
        /// A Boolean attribute which, if present, specifies that the form should not be validated before submission to the server.
        public var formnovalidate: HTML_Attributes.Form.Novalidate?
        
        /// A string which specifies a name or keyword that indicates where to display the response received after submitting the form.
        public var formtarget: HTML_Attributes.Form.Target?
        
        public var required: Required?
        
        /// Creates a new submit input configuration
        public init(
            value: String? = nil,
            formaction: HTML_Attributes.Form.Action? = nil,
            formenctype: HTML_Attributes.Form.Enctype? = nil,
            formmethod: HTML_Attributes.Form.Method? = nil,
            formnovalidate: HTML_Attributes.Form.Novalidate? = nil,
            formtarget: HTML_Attributes.Form.Target? = nil,
            required: Required? = nil
        ) {
            self.value = value
            self.formaction = formaction
            self.formenctype = formenctype
            self.formmethod = formmethod
            self.formnovalidate = formnovalidate
            self.formtarget = formtarget
            self.required = required            
        }
    }
}

//<input type="submit">
//
//
//Baseline Widely available

extension Input {
    /// Creates a new submit input element
    public static func submit(
        name: String,
        value: String? = nil,
        formaction: HTML_Attributes.Form.Action? = nil,
        formenctype: HTML_Attributes.Form.Enctype? = nil, 
        formmethod: HTML_Attributes.Form.Method? = nil,
        formnovalidate: HTML_Attributes.Form.Novalidate? = nil,
        formtarget: HTML_Attributes.Form.Target? = nil,
        disabled: Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .submit(
                .init(
                    value: value,
                    formaction: formaction,
                    formenctype: formenctype,
                    formmethod: formmethod,
                    formnovalidate: formnovalidate,
                    formtarget: formtarget
                )
            )
        )
    }
}
