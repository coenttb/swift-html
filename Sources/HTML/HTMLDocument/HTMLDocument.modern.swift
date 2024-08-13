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
                    background: #fff; /* Light mode background */
                    transition: background 0.3s, color 0.3s; /* Smooth transitions */
                }
                *, *::before, *::after {
                    box-sizing: inherit;
                }
                @media (prefers-color-scheme: dark) {
                    html {
                        color: #e0e0e0; /* Text color for dark mode */
                    }
                    body {
                        background: #121212; /* Dark mode background */
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
                /* General rule to avoid page breaks after headers */
                h1, h2, h3, h4, h5, h6 {
                    page-break-after: avoid;
                    page-break-inside: avoid; /* Prevent header itself from being split */
                    margin-bottom: 0; /* Remove any bottom margin that could cause break */
                }

                /* Specific rule to keep header with the first paragraph or block element following it */
                h1 + p, h2 + p, h3 + p, h4 + p, h5 + p, h6 + p,
                h1 + ul, h2 + ul, h3 + ul, h4 + ul, h5 + ul, h6 + ul,
                h1 + ol, h2 + ol, h3 + ol, h4 + ol, h5 + ol, h6 + ol,
                h1 + blockquote, h2 + blockquote, h3 + blockquote, h4 + blockquote, h5 + blockquote, h6 + blockquote {
                    page-break-before: avoid;
                    margin-top: 0; /* Ensure content starts immediately after the header */
                }

                /* Additional rule to avoid splitting paragraphs or lists across pages */
                p, ul, ol, blockquote {
                    page-break-inside: avoid;
                }
                """}
            }
        )
    }
}
