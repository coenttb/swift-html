//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation
import HTML
import OrderedCollections

public struct Cards: HTML.View {
    let columns: Cards.Columns
    let cards: [any HTML.View]

    public init(
        columns: Columns = .three,
        @ArrayBuilder<any HTML.View> cards: () -> [any HTML.View]
    ) {
        self.cards = cards()
        self.columns = columns
    }

    public var body: some HTML.View {
        LazyVGrid(
            columns: [
                .mobile: [1],
                .mobile && .landscape: [1],
                .tablet && .landscape: [1],
                .desktop: columns(cards.count),
            ],
            horizontalSpacing: .rem(1),
            verticalSpacing: .rem(1)
        ) {
            HTMLForEach(cards) { card in
                HTML.AnyView(card)
                    .margin(
                        top: .rem(1),
                        right: .zero,
                        bottom: .rem(2),
                        left: .zero
                    )
            }
        }
    }
}

extension Cards {
    public struct Columns: Sendable {
        internal let closure: @Sendable (_ count: Int) -> [Int]

        public init(_ closure: @escaping @Sendable (_ count: Int) -> [Int]) {
            self.closure = closure
        }

        public func callAsFunction(_ count: Int) -> [Int] {
            closure(count)
        }

        public static func columns(_ maxColumns: Int) -> Self {
            .init { count in
                switch count {
                case ...0: []
                case 1: [1]
                default: Array(repeating: 1, count: min(count, maxColumns))
                }
            }
        }

        public static let two: Self = columns(2)
        public static let three: Self = columns(3)
        public static let four: Self = columns(4)
        public static let five: Self = columns(5)
    }
}
