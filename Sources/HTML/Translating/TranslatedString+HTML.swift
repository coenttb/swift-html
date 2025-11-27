//
//  TranslatedString+HTML.swift
//  swift-html
//
//  TranslatedString integration for HTML (requires Translating trait)
//

import HTML_Rendering

#if TRANSLATING
    import Translating

    extension TranslatedString: @retroactive HTML {
        public var body: some HTML.View {
            HTML.Text("\(self)")
        }
    }

    extension HTML.Text {
        public init(_ translatedString: TranslatedString) {
            self = .init("\(translatedString)")
        }
    }
#endif
