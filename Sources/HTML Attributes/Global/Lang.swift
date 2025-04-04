///
/// Lang.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Defines the language of the content within an element.
///
/// The `lang` global attribute specifies the language of the element's content. It uses language
/// tags formatted according to [RFC 5646](https://tools.ietf.org/html/rfc5646) (also known as BCP 47).
/// This information is important for search engines, screen readers, and applications that need to
/// process content based on language.
///
/// Language tags consist of hyphen-separated subtags that specify various aspects of the language:
/// - **Language subtag**: Required, 2-3 lowercase letters (e.g., "en" for English, "fr" for French)
/// - **Script subtag**: Optional, 4 letters with first capitalized (e.g., "Cyrl" for Cyrillic)
/// - **Region subtag**: Optional, 2 uppercase letters or 3 digits (e.g., "US" for United States)
///
/// ## Accessibility Considerations
///
/// Properly specifying the language of content is crucial for accessibility:
/// - Screen readers use this information to apply correct pronunciation rules
/// - WCAG Success Criterion 3.1.1 requires specifying the language of the page
/// - WCAG Success Criterion 3.1.2 requires specifying the language when it changes within the page
///
/// ## Usage Notes
///
/// - Can be applied to any HTML element
/// - A missing `lang` attribute means the element inherits the language from its parent
/// - An empty value (`lang=""`) indicates the language is unknown
/// - The value must be a valid BCP 47 language tag
/// - Language inheritance follows the DOM tree structure
/// - The `xml:lang` attribute takes precedence if both are specified
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <html lang="en">
///   <p>This paragraph is in English.</p>
///   <p lang="fr">Ce paragraphe est en français.</p>
///   <p lang="de">Dieser Absatz ist auf Deutsch.</p>
/// </html>
/// ```
///
/// Using region subtags:
/// ```html
/// <p lang="en-US">American spelling: color, favorite, analyze</p>
/// <p lang="en-GB">British spelling: colour, favourite, analyse</p>
/// ```
///
/// Using script subtags:
/// ```html
/// <p lang="zh-Hans">这是简体中文 (Simplified Chinese)</p>
/// <p lang="zh-Hant">這是繁體中文 (Traditional Chinese)</p>
/// <p lang="sr-Cyrl">Ово је српски (Serbian in Cyrillic script)</p>
/// <p lang="sr-Latn">Ovo je srpski (Serbian in Latin script)</p>
/// ```
///
/// Common language codes:
/// - "ar" - Arabic
/// - "de" - German
/// - "en" - English
/// - "es" - Spanish
/// - "fr" - French
/// - "hi" - Hindi
/// - "it" - Italian
/// - "ja" - Japanese
/// - "ko" - Korean
/// - "nl" - Dutch
/// - "pt" - Portuguese
/// - "ru" - Russian
/// - "zh" - Chinese
public struct Lang: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "lang"
    
    /// The language tag value
    private let value: String
    
    /// Initialize with a language tag
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with separate language, script, and region components
    public init(language: String, script: String? = nil, region: String? = nil) {
        var value = language
        
        if let script = script {
            value += "-\(script)"
        }
        
        if let region = region {
            value += "-\(region)"
        }
        
        self.value = value
    }
    
    /// Common language code for English
    public static let english = Lang("en")
    
    /// Common language code for French
    public static let french = Lang("fr")
    
    /// Common language code for German
    public static let german = Lang("de")
    
    /// Common language code for Spanish
    public static let spanish = Lang("es")
    
    /// Common language code for Italian
    public static let italian = Lang("it")
    
    /// Common language code for Japanese
    public static let japanese = Lang("ja")
    
    /// Common language code for Chinese
    public static let chinese = Lang("zh")
    
    /// Common language code for Russian
    public static let russian = Lang("ru")
    
    /// Common language code for Arabic
    public static let arabic = Lang("ar")
    
    /// Common language code for American English
    public static let americanEnglish = Lang("en-US")
    
    /// Common language code for British English
    public static let britishEnglish = Lang("en-GB")
}

extension Lang: CustomStringConvertible {
    /// Returns the string representation of the lang value
    public var description: String {
        return self.value
    }
}

extension Lang: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
