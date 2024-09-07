//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/07/2024.
//

import CSS
import Foundation
import HTMLCore

extension HTMLPreview where Head == _HTMLTuple<HTMLElement<HTMLText>, HTMLElement<HTMLText>> {
    public static func modern(
        body: Body
    ) -> HTMLPreview {
        HTMLPreview.modern {
            body
        }
    }
    public static func modern(
        @HTMLBuilder body: () -> Body
    ) -> HTMLPreview {
        HTMLPreview(
            body: body,
            head: {
                style { "\(renderedNormalizeCss)" }
                style {"""
                html {
                    font-family: ui-sans-serif, -apple-system, Helvetica Neue, Helvetica, Arial, sans-serif;
                    line-height: 1.5;
                    box-sizing: border-box;
                    color: #000; /* Default text color for light mode */
                }
                code, pre, tt, kbd, samp {
                    font-family: 'SF Mono', SFMono-Regular, ui-monospace, Menlo, Monaco, Consolas, monospace;
                }
                body {
                    box-sizing: border-box;
                    background: #fff;
                    transition: background 0.3s, color 0.3s;
                }
                *, *::before, *::after {
                    box-sizing: inherit;
                }
                @media (prefers-color-scheme: dark) {
                    html {
                        color: #e0e0e0; 
                    }
                    body {
                        background: #121212;
                    }
                }
                @media only screen and (min-width: 832px) {
                    html {
                        font-size: 16px;
                    }
                }
                @media only screen and (max-width: 831px) {
                    html {
                        font-size: 14px;
                    }
                }
                """}
            }
        )
    }
}
