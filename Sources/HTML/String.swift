//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 16/09/2024.
//

import Foundation


extension String {
    public init(html: some HTML){
        self = String(decoding: html.render(), as: UTF8.self)
    }
}

extension CustomStringConvertible where Self: HTML {
    public var description: String {
        String(html: self)
    }
}
