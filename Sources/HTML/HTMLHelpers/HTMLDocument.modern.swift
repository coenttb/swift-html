//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/07/2024.
//

import CSS
import Foundation

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
                style {
                        """
                        html {
                            font-family: ui-sans-serif, -apple-system, Helvetica Neue, Helvetica, Arial, sans-serif;
                            line-height: 1.5;
                            -webkit-box-sizing: border-box;
                            -moz-box-sizing: border-box;
                            -ms-box-sizing: border-box;
                            -o-box-sizing: border-box;
                            box-sizing: border-box;
                        }
                        code, pre, tt, kbd, samp {
                            font-family: 'SF Mono', SFMono-Regular, ui-monospace, Menlo, Monaco, Consolas, monospace;
                        }
                        body {
                            -webkit-box-sizing: border-box;
                            -moz-box-sizing: border-box;
                            -ms-box-sizing: border-box;
                            -o-box-sizing: border-box;
                            box-sizing: border-box
                        }
                        *, * ::before, * ::after {
                            -webkit-box-sizing: inherit;
                            -moz-box-sizing: inherit;
                            -ms-box-sizing: inherit;
                            -o-box-sizing: inherit;
                            box-sizing: inherit
                        }
                        body, html {
                            background: #fff;
                        }
                        @media (prefers-color-scheme: dark) {
                            body, html {
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
                        """
                }
            }
        )
    }
}
