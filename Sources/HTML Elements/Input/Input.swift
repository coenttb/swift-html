///
/// Type.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes
import PointFreeHTML

public struct Input {
    /// Name of the form control. Submitted with the form as part of a name/value pair
    public var name: String
    
    /// Whether the form control is disabled
    public var disabled: Disabled?
    
    /// Associates the control with a form element
    public var form: Form.ID? = nil
    
    /// Type of form control
    public var type: Input.Variant
    
    public init(
        name: String,
        disabled: Disabled?,
        form: Form.ID? = nil,
        type: Input.Variant
    ) {
        self.name = name
        self.disabled = disabled
        self.form = form
        self.type = type
    }
}

public typealias input = Input

extension Input: HTML {
    public var body: some HTML {
        let input = PointFreeHTML.input()
            .attribute(Name.attribute, name)
            .attribute(Disabled.attribute, disabled == true)
            .attribute("type", self.type.label)
        
        switch type {
        case .button(let button):
            input
                .value(button.value)
        case .checkbox(let checkbox):
            input
                .value(checkbox.value)
                .checked(checkbox.checked == true)
        case .color(let color):
            input
                .value(color.value)
        case .date(let date):
            input
                .value(date.value)
                .attribute(Min.attribute, date.min)
                .attribute(Max.attribute, date.max)
                .attribute(Step.attribute, date.step)
        case .datetimeLocal(let datetimeLocal):
            input
                .value(datetimeLocal.value)
                .attribute(Min.attribute, datetimeLocal.min)
                .attribute(Max.attribute, datetimeLocal.max)
                .attribute(Step.attribute, datetimeLocal.step)
        case .email(let email):
            input
                .value(email.value)
                .attribute(Maxlength.attribute, email.maxlength)
                .attribute(Minlength.attribute, email.minlength)
                .attribute(Multiple.attribute, email.multiple == true)
                .attribute(Pattern.attribute, email.pattern)
                .placeholder(email.placeholder)
                .attribute(Readonly.attribute, email.readonly == true)
                .attribute(Size.attribute, email.size)
        case .file(let file):
            input
                .attribute(Accept.attribute, file.accept)
                .attribute(Capture.attribute, file.capture)
                .attribute(Multiple.attribute, file.multiple == true)
        case .hidden(let hidden):
            input
                .value(hidden.value)
        case .image(let image):
            input
                .attribute(Alt.attribute, image.alt)
                .attribute(Height.attribute, image.height)
                .attribute(Width.attribute, image.width)
                .attribute(Src.attribute, image.src.description)
                .attribute("formaction", image.form.action)
                .attribute("formenctype", image.form.enctype)
                .attribute("formmethod", image.form.method)
                .attribute("formnovalidate", image.form.novalidate == true)
                .attribute("formtarget", image.form.target)
        case .month(let month):
            input
                .value(month.value)
                .attribute(List.attribute, month.list)
                .attribute(Min.attribute, month.min)
                .attribute(Max.attribute, month.max)
                .attribute(Readonly.attribute, month.readonly == true)
                .attribute(Step.attribute, month.step)
                .attribute(Required.attribute, month.required == true)
        case .number(let number):
            input
                .value(number.value)
                .attribute(Min.attribute, number.min)
                .attribute(Max.attribute, number.max)
                .placeholder(number.placeholder)
                .attribute(Readonly.attribute, number.readonly == true)
                .attribute(Step.attribute, number.step)
        case .password(let password):
            input
                .value(password.value)
                .attribute(Maxlength.attribute, password.maxlength)
                .attribute(Minlength.attribute, password.minlength)
                .attribute(Pattern.attribute, password.pattern)
                .placeholder(password.placeholder)
                .attribute(Readonly.attribute, password.readonly == true)
                .attribute(Size.attribute, password.size)
                .attribute(Autocomplete.attribute, password.autocomplete)
        case .radio(let radio):
            input
                .value(radio.value)
                .attribute(Checked.attribute, radio.checked == true)
                .attribute(Required.attribute, radio.required == true)
        case .range(let range):
            input
                .value(range.value)
                .attribute(Min.attribute, range.min)
                .attribute(Max.attribute, range.max)
                .attribute(Step.attribute, range.step)
                .attribute(List.attribute, range.list)
        case .reset(let reset):
            input
                .value(reset.value)
        case .search(let search):
            input
                .value(search.value)
                .attribute(List.attribute, search.list)
                .attribute(Maxlength.attribute, search.maxlength)
                .attribute(Minlength.attribute, search.minlength)
                .attribute(Pattern.attribute, search.pattern)
                .placeholder(search.placeholder)
                .attribute(Readonly.attribute, search.readonly == true)
                .attribute(Size.attribute, search.size)
                .attribute(Spellcheck.attribute, search.spellcheck == true)
                .attribute(Required.attribute, search.required == true)
        case .submit(let submit):
            input
                .value(submit.value)
                .attribute("formaction", submit.formaction)
                .attribute("formenctype", submit.formenctype)
                .attribute("formmethod", submit.formmethod)
                .attribute("formnovalidate", submit.formnovalidate == true)
                .attribute("formtarget", submit.formtarget)
        case .tel(let tel):
            input
                .value(tel.value)
                .attribute(List.attribute, tel.list)
                .attribute(Maxlength.attribute, tel.maxlength)
                .attribute(Minlength.attribute, tel.minlength)
                .attribute(Pattern.attribute, tel.pattern)
                .placeholder(tel.placeholder)
                .attribute(Readonly.attribute, tel.readonly == true)
                .attribute(Size.attribute, tel.size)
                .attribute(Required.attribute, tel.required == true)
        case .text(let text):
            input
                .value(text.value)
                .attribute(List.attribute, text.list)
                .attribute(Maxlength.attribute, text.maxlength)
                .attribute(Minlength.attribute, text.minlength)
                .attribute(Pattern.attribute, text.pattern)
                .placeholder(text.placeholder)
                .attribute(Readonly.attribute, text.readonly == true)
                .attribute(Size.attribute, text.size)
                .attribute(Spellcheck.attribute, text.spellcheck == true)
                .attribute(Required.attribute, text.required == true)
        case .time(let time):
            input
                .value(time.value)
                .attribute(List.attribute, time.list)
                .attribute(Min.attribute, time.min)
                .attribute(Max.attribute, time.max)
                .attribute(Readonly.attribute, time.readonly == true)
                .attribute(Step.attribute, time.step)
                .attribute(Required.attribute, time.required == true)
        case .url(let url):
            input
                .value(url.value)
                .attribute(List.attribute, url.list)
                .attribute(Maxlength.attribute, url.maxlength)
                .attribute(Minlength.attribute, url.minlength)
                .attribute(Pattern.attribute, url.pattern)
                .attribute(Placeholder.attribute, url.placeholder)
                .attribute(Readonly.attribute, url.readonly == true)
                .attribute(Size.attribute, url.size)
                .attribute(Spellcheck.attribute, url.spellcheck == true)
                .attribute(Required.attribute, url.required == true)
        case .week(let week):
            input
                .value(week.value)
                .attribute(List.attribute, week.list)
                .attribute(Min.attribute, week.min)
                .attribute(Max.attribute, week.max)
                .attribute(Readonly.attribute, week.readonly == true)
                .attribute(Step.attribute, week.step)
                .attribute(Required.attribute, week.required == true)
        case .datetime:
            input
        }
    }
}

