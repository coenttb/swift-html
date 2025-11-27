//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 17/09/2024.
//

import Foundation
import HTMLComponents

extension HTML.View {
    @HTML.Builder
    public func focusOnPageLoad() -> some HTML.View {
        let focusClass = "focus-on-load-\(UUID().uuidString)"

        HTML.Group {
            self.class(.init(focusClass))

            script {
                """
                document.addEventListener('DOMContentLoaded', function() {
                    const elements = document.getElementsByClassName('\(focusClass)');
                    if (elements.length > 0) {
                        elements[0].focus();
                    }
                });
                """
            }
        }
    }
}
