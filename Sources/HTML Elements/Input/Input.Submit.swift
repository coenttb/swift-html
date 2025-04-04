///
/// `Input.Submit.swift`
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="submit">` elements are rendered as buttons. When the click event occurs (typically because the user clicked the button),
/// the user agent attempts to submit the form to the server.
extension Input {
    public struct Submit: Sendable, Equatable {
        /// A string which is displayed as the button's label. The value provides the accessible description for the button.
        /// If you don't specify a value, the button will have a default label, chosen by the user agent.
        public var value: String?
        
        /// A string indicating the URL to which to submit the data. This takes precedence over the action attribute on the `<form>` element.
        public var formaction: String?
        
        /// A string that identifies the encoding method to use when submitting the form data to the server.
        public var formenctype: Form.Enctype?
        
        /// A string indicating the HTTP method to use when submitting the form's data.
        public var formmethod: Form.Method?
        
        /// A Boolean attribute which, if present, specifies that the form should not be validated before submission to the server.
        public var formnovalidate: Bool?
        
        /// A string which specifies a name or keyword that indicates where to display the response received after submitting the form.
        public var formtarget: Form.Target?
        
        /// Creates a new submit input configuration
        public init(
            value: String? = nil,
            formaction: String? = nil,
            formenctype: Form.Enctype? = nil,
            formmethod: Form.Method? = nil,
            formnovalidate: Bool? = nil,
            formtarget: Form.Target? = nil
        ) {
            self.value = value
            self.formaction = formaction
            self.formenctype = formenctype
            self.formmethod = formmethod
            self.formnovalidate = formnovalidate
            self.formtarget = formtarget
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
        formaction: String? = nil,
        formenctype: Form.Enctype? = nil, 
        formmethod: Form.Method? = nil,
        formnovalidate: Bool? = nil,
        formtarget: Form.Target? = nil,
        disabled: Disabled? = nil,
        form: Form.ID? = nil
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
