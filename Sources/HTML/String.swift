//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 16/09/2024.
//

import Foundation

extension String {
    public init(_ html: some HTML){
        let bytes: ContiguousArray<UInt8> = html.render()
        let string: String = String(decoding: bytes, as: UTF8.self)
        self = string
    }
}

extension CustomStringConvertible where Self: HTML {
    public var description: String {
        String(self)
    }
}
