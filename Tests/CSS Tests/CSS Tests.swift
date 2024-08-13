//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2024.
//

import Foundation
import CSS
import Testing

@Test
func css1(){
    let length = Length(10.0, .vmax(.small))
    let length2 = Length(10.0, .relative(.viewport(.vh)))
    
    print("\(length)")
}


