//
//  File.swift
//  coenttb-newsletter
//
//  Created by Coen ten Thije Boonkkamp on 26/06/2025.
//

import Dependencies
import Foundation
import HTML

extension Font {
    public struct Defaults: Sendable {
        public var extraLargeTitle2: Font
        public var extraLargeTitle: Font
        public var largeTitle: Font
        public var title: Font
        public var title2: Font
        public var title3: Font
        public var headline: Font
        public var subheadline: Font
        public var body: Font
        public var callout: Font
        public var caption: Font
        public var caption2: Font
        public var footnote: Font

        public init(
            extraLargeTitle2: Font,
            extraLargeTitle: Font,
            largeTitle: Font,
            title: Font,
            title2: Font,
            title3: Font,
            headline: Font,
            subheadline: Font,
            body: Font,
            callout: Font,
            caption: Font,
            caption2: Font,
            footnote: Font
        ) {
            self.extraLargeTitle2 = extraLargeTitle2
            self.extraLargeTitle = extraLargeTitle
            self.largeTitle = largeTitle
            self.title = title
            self.title2 = title2
            self.title3 = title3
            self.headline = headline
            self.subheadline = subheadline
            self.body = body
            self.callout = callout
            self.caption = caption
            self.caption2 = caption2
            self.footnote = footnote
        }
    }
}

extension Font {
    public static var extraLargeTitle2: Font { .font.extraLargeTitle2 }
    public static var extraLargeTitle: Font { .font.extraLargeTitle }
    public static var largeTitle: Font { .font.largeTitle }
    public static var title: Font { .font.title }
    public static var title2: Font { .font.title2 }
    public static var title3: Font { .font.title3 }
    public static var headline: Font { .font.headline }
    public static var subheadline: Font { .font.subheadline }
    public static var body: Font { .font.body }
    public static var callout: Font { .font.callout }
    public static var caption: Font { .font.caption }
    public static var caption2: Font { .font.caption2 }
    public static var footnote: Font { .font.footnote }
}

extension Font {
    public enum BodySize {
        case small
        case regular
    }
    public static func body(_ size: BodySize) -> Font {
        switch size {
        case .small: .caption
        case .regular: .body
        }
    }
}

extension Font {
    public static var font: Font.Defaults {
        @Dependency(\.font) var font
        return font
    }
}

extension DependencyValues {
    public var font: Font.Defaults {
        get { self[Font.Defaults.self] }
        set { self[Font.Defaults.self] = newValue }
    }
}

extension Font.Defaults {
    public static var `default`: Self {
        .init(
            extraLargeTitle2: .init(
                family: .systemUi,
                size: .rem(2.75),  // ~44px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .light,
                lineHeight: 1.1
            ),
            extraLargeTitle: .init(
                family: .systemUi,
                size: .rem(2.25),  // ~36px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .light,
                lineHeight: 1.1
            ),
            largeTitle: .init(
                family: .systemUi,
                size: .rem(2),  // ~32px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.15
            ),
            title: .init(
                family: .systemUi,
                size: .rem(1.75),  // ~28px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.2
            ),
            title2: .init(
                family: .systemUi,
                size: .rem(1.375),  // ~22px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.25
            ),
            title3: .init(
                family: .systemUi,
                size: .rem(1.25),  // ~20px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.3
            ),
            headline: .init(
                family: .systemUi,
                size: .rem(1.0625),  // ~17px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .semiBold,
                lineHeight: 1.35
            ),
            subheadline: .init(
                family: .systemUi,
                size: .rem(0.9375),  // ~15px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.4
            ),
            body: .init(
                family: .systemUi,
                size: .rem(1),  // ~16px (base size)
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.5
            ),
            callout: .init(
                family: .systemUi,
                size: .rem(1),  // ~16px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.4
            ),
            caption: .init(
                family: .systemUi,
                size: .rem(0.75),  // ~12px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.35
            ),
            caption2: .init(
                family: .systemUi,
                size: .rem(0.6875),  // ~11px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.3
            ),
            footnote: .init(
                family: .systemUi,
                size: .rem(0.8125),  // ~13px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.35
            )
        )
    }
}

extension Font.Defaults: DependencyKey {
    public static var testValue: Font.Defaults { .default }
    public static var liveValue: Font.Defaults { .default }
}
