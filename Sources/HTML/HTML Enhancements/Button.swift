//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/07/2025.
//

import Foundation
import HTML_Standard
import WHATWG_HTML_Elements

extension WHATWG_HTML_Elements.Button {
    @HTML.Builder
    public static func submit(
        disabled: HTML_Standard_Attributes.Disabled? = nil,
        form: HTML_Standard_Attributes.Form.ID? = nil,
        name: HTML_Standard_Attributes.Name? = nil,
        value: HTML_Standard_Attributes.Value<String>? = nil,
        autofocus: HTML_Standard_Attributes.Autofocus? = nil,
        formaction: HTML_Standard_Attributes.FormAction? = nil,
        formenctype: HTML_Standard_Attributes.FormEncType? = nil,
        formmethod: HTML_Standard_Attributes.FormMethod? = nil,
        formnovalidate: HTML_Standard_Attributes.FormNovalidate? = nil,
        formtarget: HTML_Standard_Attributes.FormTarget? = nil,
        popovertarget: HTML_Standard_Attributes.PopoverTarget? = nil,
        popovertargetaction: HTML_Standard_Attributes.PopoverTargetAction? = nil,
        @HTML.Builder content: () -> some HTML.View
    ) -> some HTML.View {
        WHATWG_HTML_Elements.Button(
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
