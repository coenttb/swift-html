//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 27/07/2024.
//

import Foundation
import HTML_Web
import HTML_PointFree

extension PrismJSHead {
    public static let pointfree: Self = .init(
        languages: ["swift", "clike", "css", "diff", "javascript", "ruby"],
        style:
        """
        pre {
          position: relative;
        }
        
        .line-highlight {
          background-color: rgba(0, 121, 255, 0.1);
          margin-top: 1rem;
          margin-left: -1.5rem;
          position: absolute;
        }
        
        .highlight-pass .line-highlight {
          background-color: rgba(0, 255, 50, 0.15);
        }
        
        .highlight-fail .line-highlight {
          background-color: rgba(255, 68, 68, 0.15);
        }
        
        .highlight-warn .line-highlight {
          background-color: rgba(254, 223, 43, 0.15);
        }
        
        .language-diff {
          color: #808080;
        }
        
        .language-diff .token.inserted {
          background-color: #f0fff4;
          color: #22863a;
          margin: -4px;
          padding: 4px;
        }
        
        .language-diff .token.deleted {
          background-color: #ffeef0;
          color: #b31d28;
          margin: -3px;
          padding: 3px;
        }
        
        .token.atrule, \
        .token.boolean, \
        .token.constant, \
        .token.directive, \
        .token.directive-name, \
        .token.keyword, \
        .token.other-directive {
          color: #AD3DA4;
        }
        
        .token.class-name, \
        .token.function {
          color: #4B21B0;
        }
        
        .token.comment {
          color: #707F8C;
        }
        .token.todo {
          font-weight: 700;
        }
        
        .token.number, \
        .token.string {
          color: #D22E1B;
        }
        
        .token.placeholder, .token.code-fold {
          background-color: #bbb;
          border-radius: 6px;
          color: #fff;
          margin: -2px;
          padding: 2px;
        }
        
        .token.placeholder-open, \
        .token.placeholder-close {
          display: none;
        }
        
        @media (prefers-color-scheme: dark) {
          .line-highlight {
            background-color: rgba(255, 255, 255, 0.1);
          }
        
          .language-diff .token.inserted {
            background-color: #071c06;
            color: #6fd574;
          }
        
          .language-diff .token.deleted {
            background-color: #280c0f;
            color: #f95258;
          }
        
          .token.atrule, \
          .token.boolean, \
          .token.constant, \
          .token.directive, \
          .token.directive-name, \
          .token.keyword, \
          .token.other-directive {
            color: #FF79B2;
          }
        
          .token.class-name, \
          .token.function {
            color: #DABAFF;
          }
        
          .token.comment {
            color: #7E8C98;
          }
        
          .token.number, \
          .token.string {
            color: #FF8170;
          }
        
          .token.placeholder, .token.code-fold {
            background-color: #87878A;
          }
        }
        """
        ,
        script: #"""
        Prism.languages.swift['class-name'] = [
          /\b(_[A-Z]\w*)\b/,
          Prism.languages.swift['class-name']
        ];
        Prism.languages.swift.keyword = [
          /\b(any|macro)\b/,
          /\b((iOS|macOS|tvOS|watchOS|visionOS)(|ApplicationExtension)|swift)\b/,
          Prism.languages.swift.keyword
        ];
        Prism.languages.swift.comment.inside = {
          todo: {
            pattern: /(TODO:)/
          }
        };
        Prism.languages.insertBefore('swift', 'operator', {
          'code-fold': {
            pattern: /…/
          },
        });
        Prism.languages.insertBefore('swift', 'string-literal', {
          'placeholder': {
            pattern: /<#.+?#>/,
            inside: {
              'placeholder-open': {
                pattern: /<#/
              },
              'placeholder-close': {
                pattern: /#>/
              },
            }
          },
        });
        """#
    )
}
