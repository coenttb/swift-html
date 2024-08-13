//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import Testing
import HTML
import CSS

@Test
func html1() async throws {
    let x = p { "Test" }
        .flexContainer(
          direction: "row",
          wrap: "wrap",
          justification: "center",
          itemAlignment: "baseline",
          rowGap: "10.0rem",
          columnGap: "7.0rem"
        )
    
    let y = p { "Test" }
        .flexContainer(
            direction: .row,
            wrap: .wrap,
            justification: .center,
            itemAlignment: .baseline,
            rowGap: .init(10, .rem),
            columnGap: .init(7, .rem),
            media: nil
        )
    
    
    let z = p { "Test" }
        .flexContainer(
            direction: .rowReverse,
            wrap: .wrap,
            justification: .center,
            itemAlignment: .baseline,
            rowGap: nil,
            columnGap: nil,
            media: nil
        )
    
    #expect(x.render() == y.render())
//    #expect(x.render() != z.render())
}


