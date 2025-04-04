///
/// Accept.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that specifies which file types are accepted for file upload.
///
/// The `accept` attribute is used with `<input type="file">` elements to specify which file types the server accepts.
/// It takes as its value a comma-separated list of unique file type specifiers.
///
/// ## Valid File Type Specifiers
///
/// - A valid case-insensitive filename extension starting with a period (e.g., `.jpg`, `.pdf`, `.doc`)
/// - A valid MIME type string with no extensions (e.g., `image/jpeg`, `application/pdf`)
/// - `audio/*` - Any audio file
/// - `video/*` - Any video file
/// - `image/*` - Any image file
///
/// ## Usage Notes
///
/// - This attribute is only valid for `<input>` elements with `type="file"`
/// - It provides hints to browsers but doesn't validate the file types; server-side validation is still necessary
/// - Multiple file types can be specified by separating them with commas
/// - The native file picker will typically filter files based on the specified types
///
/// ## Examples
///
/// ```swift
/// // Accept only images
/// HTML.input.type("file").accept(.image)
///
/// // Accept specific image formats
/// HTML.input.type("file").accept(.jpg, .jpeg, .png)
///
/// // Accept Word documents
/// HTML.input.type("file").accept(.doc, .docx, .msword, .wordOpenXml)
///
/// // Accept PDFs and images
/// HTML.input.type("file").accept(.pdf, .image)
/// ```
public struct Accept: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "accept"
    
    /// The accepted file types
    private let fileTypes: [FileType]
    
    /// Initialize with a single file type
    public init(_ fileType: FileType) {
        self.fileTypes = [fileType]
    }
    
    /// Initialize with multiple file types
    public init(_ fileTypes: [FileType]) {
        self.fileTypes = fileTypes
    }
    
    /// Initialize with multiple file types as variadic parameters
    public init(_ fileTypes: FileType...) {
        self.fileTypes = fileTypes
    }
    
    /// Initialize with a raw string value
    public init(rawValue: String) {
        self.fileTypes = [FileType(rawValue)]
    }
}

extension Accept: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self = .init(rawValue: value)
    }
}
extension Accept: CustomStringConvertible {
    /// Returns the string representation of the accept value
    public var description: String {
        return self.fileTypes.map(\.description).joined(separator: ", ")
    }
}

extension Accept {
    /// Accept any image file
    public static let images: Self = "image/*"
    
    /// Accept any video file
    public static let videos: Self = "video/*"
    
    /// Accept any audio file
    public static let audio: Self = "audio/*"
    
    /// Accept common document files (PDF, Word, Excel, PowerPoint)
    public static let documents: Self = ".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation"
}

extension Accept {
    /// Represents a file type specifier for the Accept attribute
    public struct FileType: Sendable, Equatable, CustomStringConvertible, ExpressibleByStringLiteral {
        /// The string value for the file type
        private let value: String
        
        /// Initialize with a custom value
        public init(_ value: String) {
            self.value = value
        }
        
        /// String representation of the file type
        public var description: String {
            return value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self = .init(value)
        }
    }
}

extension HTML {
    /// Add an accept attribute to specify which file types are allowed
    @discardableResult
    package func accept(
        _ value: Accept?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Accept.attribute, value?.description)
    }

    /// Add an accept attribute with multiple file types
    @discardableResult
    package func accept(
        _ fileTypes: Accept.FileType?...
    ) -> _HTMLAttributes<Self> {
        self.accept(Accept(fileTypes.compactMap { $0 }))
    }
    
    /// Add an accept attribute with multiple file types
    @discardableResult
    package func accept(
        _ fileTypes: [Accept.FileType?]
    ) -> _HTMLAttributes<Self> {
        self.accept(Accept(fileTypes.compactMap { $0 }))
    }
}


extension Accept.FileType {
    
    // MARK: - Wildcard Categories
    
    /// Any image file (image/*)
    public static let image: Self = .init("image/*")
    
    /// Any audio file (audio/*)
    public static let audio: Self = .init("audio/*")
    
    /// Any video file (video/*)
    public static let video: Self = .init("video/*")
    
    // MARK: - Common Image Formats
    
    /// JPEG image (.jpg)
    public static let jpg: Self = "image/jpeg,.jpg,.jpeg"
    
    /// JPEG image (.jpeg)
    public static let jpeg: Self = .jpg
    
    /// PNG image (.png)
    public static let png: Self = "image/png,.png"
    
    /// GIF image (.gif)
    public static let gif: Self = .extension("gif")
    
    /// SVG image (.svg)
    public static let svg: Self = .extension("svg")
    
    /// WebP image (.webp)
    public static let webp: Self = .extension("webp")
    
    /// AVIF image (.avif)
    public static let avif: Self = .extension("avif")
    
    // MARK: - Common Document Formats
    
    /// PDF document (.pdf)
    public static let pdf: Self = "application/pdf,.pdf"
    
    /// Microsoft Word document (.doc)
    public static let doc: Self = .extension("doc")
    
    /// Microsoft Word document (.docx)
    public static let docx: Self = .extension("docx")
    
    /// Microsoft Excel spreadsheet (.xls)
    public static let xls: Self = .extension("xls")
    
    /// Microsoft Excel spreadsheet (.xlsx)
    public static let xlsx: Self = .extension("xlsx")
    
    /// Microsoft PowerPoint presentation (.ppt)
    public static let ppt: Self = .extension("ppt")
    
    /// Microsoft PowerPoint presentation (.pptx)
    public static let pptx: Self = .extension("pptx")
    
    /// Text file (.txt)
    public static let txt: Self = .extension("txt")
    
    /// Rich Text Format (.rtf)
    public static let rtf: Self = .extension("rtf")
    
    /// CSV file (.csv)
    public static let csv: Self = .extension("csv")
    
    // MARK: - Common Audio Formats
    
    /// MP3 audio (.mp3)
    public static let mp3: Self = .extension("mp3")
    
    /// WAV audio (.wav)
    public static let wav: Self = .extension("wav")
    
    /// OGG audio (.ogg)
    public static let ogg: Self = .extension("ogg")
    
    /// AAC audio (.aac)
    public static let aac: Self = .extension("aac")
    
    /// FLAC audio (.flac)
    public static let flac: Self = .extension("flac")
    
    // MARK: - Common Video Formats
    
    /// MP4 video (.mp4)
    public static let mp4: Self = .extension("mp4")
    
    /// WebM video (.webm)
    public static let webm: Self = .extension("webm")
    
    /// AVI video (.avi)
    public static let avi: Self = .extension("avi")
    
    /// QuickTime video (.mov)
    public static let mov: Self = .extension("mov")
    
    /// Matroska video (.mkv)
    public static let mkv: Self = .extension("mkv")
    
    // MARK: - Common Archive Formats
    
    /// ZIP archive (.zip)
    public static let zip: Self = .extension("zip")
    
    /// RAR archive (.rar)
    public static let rar: Self = .extension("rar")
    
    /// TAR archive (.tar)
    public static let tar: Self = .extension("tar")
    
    /// GZIP archive (.gz)
    public static let gz: Self = .ext("gz")
    
    // MARK: - Microsoft Office MIME Types
    
    /// Microsoft Word document (application/msword)
    public static let msword: Self = .init("application/msword")
    
    /// Microsoft Word OpenXML document (application/vnd.openxmlformats-officedocument.wordprocessingml.document)
    public static let wordOpenXml: Self = .init("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
    
    /// Microsoft Excel OpenXML spreadsheet (application/vnd.openxmlformats-officedocument.spreadsheetml.sheet)
    public static let excelOpenXml: Self = .init("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    
    /// Microsoft PowerPoint OpenXML presentation (application/vnd.openxmlformats-officedocument.presentationml.presentation)
    public static let powerPointOpenXml: Self = .init("application/vnd.openxmlformats-officedocument.presentationml.presentation")
    
    // MARK: - Factory Methods
    
    /// Creates a FileType from an extension (automatically adds the period if needed)
    public static func `extension`(_ extension: String) -> Self {
        let ext = `extension`.hasPrefix(".") ? `extension` : ".\(`extension`)"
        return .init(ext)
    }
    
    /// Creates a FileType from an extension (automatically adds the period if needed)
    public static func ext(_ extension: String) -> Self {
        .extension(`extension`)
    }
    
    /// Creates a FileType from a MIME type
    public static func mime(_ type: String) -> Self {
        return .init(type)
    }
}
