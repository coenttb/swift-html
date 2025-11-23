//
//  TranslatedString+HTML.swift
//  swift-html
//
//  TranslatedString integration for HTML (requires Translating trait)
//

import PointFreeHTML

#if TRANSLATING
    import Translating

    extension TranslatedString: @retroactive HTML {
        public var body: some HTML {
            HTMLText("\(self)")
        }
    }

    extension HTMLText {
        public init(_ translatedString: TranslatedString) {
            self = .init("\(translatedString)")
        }
    }
#endif
