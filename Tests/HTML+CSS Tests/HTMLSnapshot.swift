//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import Foundation
import PointFreeHTML
import Dependencies
import SnapshotTesting

extension Snapshotting where Value: HTMLDocument, Format == String {
    static var html: Self {
        Snapshotting<String, String>.lines.pullback { value in
            return withDependencies {
                $0.htmlPrinter = .init(.pretty)
            } operation: {
                String(bytes: value.render(), encoding: .utf8) ?? "HTML rendering failed"
            }
        }
    }
}

extension Snapshotting where Value: HTML, Format == String {
    static var html: Self {
        Snapshotting<String, String>.lines.pullback { value in
            
            return withDependencies {
                $0.htmlPrinter = .init(.pretty)
            } operation: {
                String(bytes: Document { value }.render(), encoding: .utf8) ?? "HTML rendering failed"
            }
        }
    }
}

fileprivate struct Document<MockHTML: HTML>: HTMLDocument {
    var head: some HTML { HTMLEmpty() }
    
    let body: MockHTML
    
    public init(
        @HTMLBuilder body: () -> MockHTML
    ) {
        self.body = body()
    }
}

