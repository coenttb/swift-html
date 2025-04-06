//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct CharSet: Sendable, Equatable, ExpressibleByStringLiteral, CustomStringConvertible {
    
    private let value: String
    
    public var description: String { value }
    
    public init(stringLiteral value: String) {
        self.value = value
    }
    
    public static let utf8: Self = "utf-8"

    @available(*, deprecated, message: "UTF-16 is rarely used in HTML and may cause compatibility issues. Use utf8 instead.")
    public static let utf16: Self = "utf-16"

    @available(*, deprecated, message: "UTF-16BE is not suitable for use in HTML. Use utf8 instead.")
    public static let utf16BE: Self = "utf-16be"

    @available(*, deprecated, message: "UTF-16LE is not suitable for use in HTML. Use utf8 instead.")
    public static let utf16LE: Self = "utf-16le"

    @available(*, deprecated, message: "ISO-8859-1 is a legacy encoding. Use utf8 instead.")
    public static let iso8859_1: Self = "iso-8859-1"

    @available(*, deprecated, message: "ISO-8859-2 is a legacy encoding for Central European languages. Use utf8 instead.")
    public static let iso8859_2: Self = "iso-8859-2"

    @available(*, deprecated, message: "ISO-8859-15 is a legacy variant of Latin-1. Use utf8 instead.")
    public static let iso8859_15: Self = "iso-8859-15"

    @available(*, deprecated, message: "Windows-1250 is a legacy encoding for Central European languages. Use utf8 instead.")
    public static let windows1250: Self = "windows-1250"

    @available(*, deprecated, message: "Windows-1251 is a legacy encoding for Cyrillic. Use utf8 instead.")
    public static let windows1251: Self = "windows-1251"

    @available(*, deprecated, message: "Windows-1252 is a legacy Western European encoding. Use utf8 instead.")
    public static let windows1252: Self = "windows-1252"

    @available(*, deprecated, message: "Windows-1256 is a legacy Arabic encoding. Use utf8 instead.")
    public static let windows1256: Self = "windows-1256"

    @available(*, deprecated, message: "KOI8-R is a legacy Russian encoding. Use utf8 instead.")
    public static let koi8r: Self = "koi8-r"

    @available(*, deprecated, message: "KOI8-U is a legacy Ukrainian encoding. Use utf8 instead.")
    public static let koi8u: Self = "koi8-u"

    @available(*, deprecated, message: "MacRoman (macintosh) is deprecated and not suitable for modern web content. Use utf8 instead.")
    public static let macRoman: Self = "macintosh"

    @available(*, deprecated, message: "IBM866 is a legacy DOS encoding. Use utf8 instead.")
    public static let ibm866: Self = "ibm866"

    @available(*, deprecated, message: "GBK is a legacy Chinese encoding. Use utf8 instead.")
    public static let gbk: Self = "gbk"

    @available(*, deprecated, message: "GB18030 is mandatory in China but considered legacy for web content. Use utf8 instead.")
    public static let gb18030: Self = "gb18030"

    @available(*, deprecated, message: "Big5 is a legacy Traditional Chinese encoding. Use utf8 instead.")
    public static let big5: Self = "big5"

    @available(*, deprecated, message: "EUC-JP is a legacy Japanese encoding. Use utf8 instead.")
    public static let eucJp: Self = "euc-jp"

    @available(*, deprecated, message: "ISO-2022-JP is a legacy encoding used in email. Avoid in HTML. Use utf8 instead.")
    public static let iso2022Jp: Self = "iso-2022-jp"

    @available(*, deprecated, message: "Shift_JIS is a legacy Japanese encoding. Use utf8 instead.")
    public static let shiftJis: Self = "shift_jis"

    @available(*, deprecated, message: "EUC-KR is a legacy Korean encoding. Use utf8 instead.")
    public static let eucKr: Self = "euc-kr"
}
