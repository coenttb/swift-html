//For rel="preload" and as="image" only, the imagesizes attribute has similar syntax and semantics as the sizes attribute that indicates to preload the appropriate resource used by an img element with corresponding values for its srcset and sizes attributes.
//

public struct ImageSizes: Attribute, ExpressibleByStringLiteral {
    public static let attribute: String = "imagesizes"
    private let value: StringLiteralType
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
