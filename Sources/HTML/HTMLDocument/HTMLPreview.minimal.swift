//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/08/2024.
//

import Foundation
import PointFreeHTML

extension HTMLPreview where Head == HTMLEmpty {
    public static func minimal(
        @HTMLBuilder body: () -> Body
    ) -> HTMLPreview {
        HTMLPreview(body: body)
    }

    public static func minimal(
        body: Body
    ) -> HTMLPreview {
        HTMLPreview.minimal {
            body
        }
    }
}

extension HTMLDocument {
    public static func minimal<Body: HTML>(
        body: Body
    ) -> HTMLPreview<HTMLEmpty, Body> {
        HTMLPreview.minimal {
            body
        }
    }
}
