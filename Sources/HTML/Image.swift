import Foundation
import PointFreeHtml
import CSS

public struct Image: HTML {
    let source: String
    let description: String
    
    public init(source: String, description: String) {
        self.source = source
        self.description = description
    }
    
    public var body: some HTML {
        img()
            .attribute("src", source)
            .attribute("alt", description)
            .maxWidth(100.percent)
    }
}

extension Image {
    public init?(baseURL: URL, base64EncodedFromURL relativeURL: String, description: String) {
        guard let imageURL = URL(string: relativeURL, relativeTo: baseURL),
              let imageData = try? Data(contentsOf: imageURL) else {
            return nil
        }
        
        let base64String = imageData.base64EncodedString()
        let mimeType = Image.mimeTypeForImage(relativeURL: relativeURL)
        let dataURL = "data:\(mimeType);base64,\(base64String)"
        
        self.init(source: dataURL, description: description)
    }
    
    private static func mimeTypeForImage(relativeURL: String) -> String {
        let pathExtension = (relativeURL as NSString).pathExtension.lowercased()
        switch pathExtension {
        case "jpg", "jpeg":
            return "image/jpeg"
        case "png":
            return "image/png"
        case "gif":
            return "image/gif"
        case "svg":
            return "image/svg+xml"
        default:
            return "application/octet-stream"
        }
    }
}
