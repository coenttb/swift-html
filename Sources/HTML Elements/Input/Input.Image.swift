//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="image">` elements are used to create graphical submit buttons, i.e. submit buttons
/// that take the form of an image rather than text.
///
/// When an image button is clicked, the form is submitted with the coordinates of the click
/// relative to the image. These coordinates are sent as two name/value pairs:
/// - name.x=X
/// - name.y=Y
///
/// Where "name" is the value of the name attribute, and X and Y are the coordinates.
extension Input {
    public struct Image: Sendable, Equatable {
        
        /// The name of the image input, used when submitting the form.
        /// When submitted, the coordinates are sent as name.x=X&name.y=Y where X and Y are the coordinates.
        public var name: String?
        
        /// A string specifying the URL of the image file to display to represent the graphical submit button. When the user interacts with the image, the input is handled like any other button input.
        public var src: Src
        
        /// The alt attribute provides an alternate string to use as the button's label if the image cannot be shown (due to error, a user agent that cannot or is configured not to show images, or if the user is using a screen reading device). If provided, it must be a non-empty string appropriate as a label for the button.
        ///
        /// For example, if you have a graphical button that shows an image with an icon and/or image text "Login Now", you should also set the alt attribute to something like Login Now.
        ///
        /// > Note: Note: While the alt attribute is technically optional, you should always include one to maximize the usability of your content.
        ///
        /// Functionally, the alt attribute of the `<input type="image">` element works just like the alt attribute on `<img>` elements.
        public var alt: Alt?
        
        /// A number specifying the height, in CSS pixels, at which to draw the image specified by the src attribute.
        public var height: Double?

        /// A number indicating the width at which to draw the image, in CSS pixels.
        public var width: Double?
        
        public var form: Form
        
        public init(
            name: String? = nil,
            src: Src,
            alt: Alt? = nil,
            height: Double? = nil,
            width: Double? = nil,
            form: Form = .init()
        ) {
            self.name = name
            self.src = src
            self.alt = alt
            self.height = height
            self.width = width
            self.form = form
        }
    }
}

extension Input.Image {
    public struct Form: Sendable, Equatable {
        
        /// A string indicating the URL to which to submit the data. This takes precedence over the action attribute on the `<form>` element that owns the `<input>`.
        ///
        /// This attribute is also available on `<input type="submit">` and `<button>` elements.
        public var action: Form.Action?
        
        /// A string that identifies the encoding method to use when submitting the form data to the server.
        public var enctype: Form.EncType?
        
        /// A string indicating the HTTP method to use when submitting the form's data; this value overrides any method attribute given on the owning form.
        public var method: Form.Method?
        
        /// A Boolean attribute which, if present, specifies that the form should not be validated before submission to the server. This overrides the value of the novalidate attribute on the element's owning form.
        public var novalidate: Bool?
        
        /// A string which specifies a name or keyword that indicates where to display the response received after submitting the form. The string must be the name of a browsing context (that is, a tab, window, or `<iframe>`. A value specified here overrides any target given by the target attribute on the `<form>` that owns this input.
        public var target: Form.Target?
        
        /// Create a new form override configuration
        public init(
            action: Form.Action? = nil,
            enctype: Form.EncType? = nil,
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
}

extension Input.Image {
    public struct Src: Sendable, Equatable, ExpressibleByStringLiteral {
        public var value: String
        
        public init(_ value: String) {
            self.value = value
        }
        
        public init(_ url: URL) {
            self.value = url.absoluteString
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self = .init(value)
        }
    }
}

extension Input.Image {
    public typealias Alt = String
}

extension Input.Image.Form {
    public typealias ID = String
    public typealias EncType = HTML_Elements.Enctype
    public typealias Target = HTML_Elements.Target
    public typealias Action = HTML_Elements.Action
    public typealias Method = HTML_Elements.Method
}
