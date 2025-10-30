//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/10/2024.
//

import Foundation
import HTML

public struct BaseStyles: HTML {
  public init() {

  }

  public var body: some HTML {
    Style { "\(renderedNormalizeCss)" }
    Style {
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
          box-sizing: border-box;
      }

      *, *::before, *::after {
          -webkit-box-sizing: inherit;
          -moz-box-sizing: inherit;
          -ms-box-sizing: inherit;
          -o-box-sizing: inherit;
          box-sizing: inherit;
      }

      .markdown *:link, .markdown *:visited {
          color: inherit;
      }

      .diagnostic * {
          font: inherit;
          line-height: 1.25 !important;
      }

      .diagnostic pre {
          background: inherit;
          margin: 0 1.125rem;
          padding: 0;
          text-wrap: auto;
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

      @keyframes Pulse {
          from { opacity: 1; }
          50% { opacity: 0; }
          to { opacity: 1; }
      }
      """
    }
  }
}
