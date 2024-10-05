//
//  File.swift
//  tenthijeboonkkamp-nl-server
//
//  Created by Coen ten Thije Boonkkamp on 04/10/2024.
//

import Foundation

public struct EmailHTMLDocument<
    Body: HTML
>: HTMLDocument {
    
    let _body: Body

    public init?(
        @HTMLBuilder body: () -> Body
    ) {
        self._body = body()
    }
    
    public var head: some HTML {
        HTMLEmpty()
    }
    
    public var body: some HTML {
        _body
    }
}
