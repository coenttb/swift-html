//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/07/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

extension Button {
    public static func submit(
        disabled: HTMLAttributeTypes.Disabled? = nil,
        form: HTMLAttributeTypes.Form.ID? = nil,
        name: HTMLAttributeTypes.Name? = nil,
        value: HTMLAttributeTypes.Value<String>? = nil,
        autofocus: HTMLAttributeTypes.Autofocus? = nil,
        formaction: HTMLAttributeTypes.FormAction? = nil,
        formenctype: HTMLAttributeTypes.FormEncType? = nil,
        formmethod: HTMLAttributeTypes.FormMethod? = nil,
        formnovalidate: HTMLAttributeTypes.FormNovalidate? = nil,
        formtarget: HTMLAttributeTypes.FormTarget? = nil,
        popovertarget: HTMLAttributeTypes.PopoverTarget? = nil,
        popovertargetaction: HTMLAttributeTypes.PopoverTargetAction? = nil,
        @HTMLBuilder content: () -> some HTML
    ) -> some HTML {
        Button(
            type: .submit,
            disabled: disabled,
            form: form,
            name: name,
            value: value,
            autofocus: autofocus,
            formaction: formaction,
            formenctype: formenctype,
            formmethod: formmethod,
            formnovalidate: formnovalidate,
            formtarget: formtarget,
            popovertarget: popovertarget,
            popovertargetaction: popovertargetaction
        ) {
            content()
        }
    }
}
