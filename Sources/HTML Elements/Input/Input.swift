///
/// Type.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML
import HTML_Attributes

public struct Input {
    /// Name of the form control. Submitted with the form as part of a name/value pair
    public var name: String
    
    /// Whether the form control is disabled
    public var disabled: Bool?
    
    /// Associates the control with a form element
    public var form: Form.ID? = nil
    
    /// Type of form control
    public var type: Input.Variant
    
    public init(
        name: String,
        disabled: Bool?,
        form: Form.ID? = nil,
        type: Input.Variant
    ) {
        self.name = name
        self.disabled = disabled
        self.form = form
        self.type = type
    }
}

extension Input: HTML {
    public var body: some HTML {
        let input = HTMLVoidTag("input")()
            .attribute("name", name)
            .attribute(disabled == true ? Disabled.attribute : "", disabled == true ? "" : nil)
            .attribute("type", self.type.label)
        
        switch type {
        case .button(let button):
            return input
                .attribute("value", button.value)
        case .checkbox(let checkbox):
            return input
                .attribute("value", checkbox.value)
                .attribute(checkbox.checked == true ? "checked" : "")
        case .color(let color):
            return input
        case .date(let date):
            return input
        case .datetimeLocal(let datetimeLocal):
            return input
        case .email(let email):
            return input
        case .file(let file):
            return input
        case .hidden(let hidden):
            return input
        case .image(let image):
            return input
                .attribute("alt", image.alt)
                .attribute("height", image.height?.description)
                .attribute("width", image.width?.description)
                .attribute("src", image.src.description)
                .attribute("formaction", image.form.action?.description)
                .attribute("formenctype", image.form.enctype?.description)
                .attribute("formmethod", image.form.method?.description)
                .attribute(image.form.novalidate == true ? "formnovalidate" : "")
                .attribute("formtarget", image.form.target?.description)
        case .month(let month):
            return input
        case .number(let number):
            return input
        case .password(let password):
            return input
        case .radio(let radio):
            return input
        case .range(let range):
            return input
        case .reset(let reset):
            return input
        case .search(let search):
            return input
        case .submit(let submit):
            return input
        case .tel(let tel):
            return input
        case .text(let text):
            return input
        case .time(let time):
            return input
        case .url(let url):
            return input
        case .week(let week):
            return input
        case .datetime:
            return input
        }
            
    }
}

