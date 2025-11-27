//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 03/09/2024.
//

import HTML

public struct Input<CodingKey: RawRepresentable>: HTML where CodingKey.RawValue == String {

    public let codingKey: CodingKey
    public let disabled: Disabled?
    public let form: HTMLAttributeTypes.Form.ID?
    public let type: HTML_Standard_Elements.Input.Variant
    public var style: Input.Style = .default

    public init(
        codingKey: CodingKey,
        disabled: Disabled? = nil,
        form: HTMLAttributeTypes.Form.ID? = nil,
        type: HTML_Standard_Elements.Input.Variant
    ) {
        self.codingKey = codingKey
        self.disabled = disabled
        self.form = form
        self.type = type
    }

    public var body: some HTML.View {
        style.transform(
            input.init(
                name: .init(codingKey.rawValue),
                disabled: disabled,
                form: form,
                type: type
            )

            .id(codingKey.rawValue)
        )
    }
}

extension Input {
    public enum Style {
        case `default`
        case outlined
        case filled
        case minimal
        case error
        case success

        @HTML.Builder
        public func transform(_ html: some HTML) -> some HTML.View {
            switch self {
            case .default:
                html
                    .padding(vertical: .px(14), horizontal: .px(10))
                    .border(width: .px(1), color: .gray900.withDarkColor(.gray100))
                    .backgroundColor(.white.withDarkColor(.black))
                    .color(.text.secondary)
                    .borderRadius(.px(5))

            case .outlined:
                html
                    .padding(vertical: .px(14), horizontal: .px(10))
                    .border(width: .px(2), color: .blue500.withDarkColor(.blue400))
                    .backgroundColor(.transparent)
                    .color(.text.primary)
                    .borderRadius(.px(5))

            case .filled:
                html
                    .padding(vertical: .px(14), horizontal: .px(10))
                    .border(.hidden)
                    .backgroundColor(.gray100.withDarkColor(.gray800))
                    .color(.text.primary)
                    .borderRadius(.px(5))

            case .minimal:
                html
                    .padding(vertical: .px(8), horizontal: .px(4))
                    .border(.hidden)
                    .backgroundColor(.transparent)
                    .color(.text.primary)
                    .borderBottom(.init(.px(5), .solid))
            //                .borderBottomColor(.color(.gray400.withDarkColor(.gray600)))

            case .error:
                html
                    .padding(vertical: .px(14), horizontal: .px(10))
                    .border(width: .px(1), color: .red500.withDarkColor(.red400))
                    .backgroundColor(Color.red100.withDarkColor(.red900))
                    .color(.text.primary)
                    .borderRadius(.px(5))

            case .success:
                html
                    .padding(vertical: .px(14), horizontal: .px(10))
                    .border(width: .px(1), color: .green500.withDarkColor(.green400))
                    .backgroundColor(.green100.withDarkColor(.green900))
                    .color(.text.primary)
                    .borderRadius(.px(5))
            }
        }
    }
}

extension Input {
    public func style(_ style: Style) -> Self {
        var copy = self
        copy.style = style
        return copy
    }
}
