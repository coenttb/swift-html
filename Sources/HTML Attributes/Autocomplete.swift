///
/// Autocomplete.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// An attribute that specifies whether form fields should have autocomplete functionality.
///
/// The `autocomplete` attribute provides a hint to the browser about whether to enable
/// automated assistance in filling out form field values, and what kind of information
/// is expected in the field.
///
/// ## Usage Notes
///
/// - Available on `<input>`, `<textarea>`, `<select>`, and `<form>` elements
/// - Form controls inherit the `autocomplete` attribute from their owning form if not specified
/// - Browsers may require elements to have a name/id and be in a form with a submit button to provide autocompletion
/// - For security-sensitive fields, set to "new-password" for new password fields or "current-password" for current password fields
///
/// ## Values
///
/// - `"off"`: The browser should not automatically complete or select a value
/// - `"on"`: The browser may automatically complete the input with no specific guidance
/// - **Token lists**: Space-separated tokens that describe expected data types (e.g., "email", "name", "street-address")
public struct Autocomplete: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "autocomplete"
    
    /// The autocomplete value
    private let value: String
    
    /// Initialize with an autocomplete value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiple autocomplete tokens as variadic parameters
    public init(_ tokens: Autocomplete.Token...) {
        self.value = tokens.map(\.value).joined(separator: " ")
    }
    
    /// Initialize with an array of autocomplete tokens
    public init(_ tokens: [Autocomplete.Token]) {
        self.value = tokens.map(\.value).joined(separator: " ")
    }
}

extension Autocomplete: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        switch value {
        case true:
            self = .on
        case false:
            self = .off
        }
    }
}

extension Autocomplete: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Autocomplete: CustomStringConvertible {
    /// Returns the string representation of the autocomplete value
    public var description: String {
        return self.value
    }
}

extension Autocomplete {
    /// Convenience initializer for "on" value
    public static var on: Autocomplete {
        return Autocomplete("on")
    }
    
    /// Convenience initializer for "off" value
    public static var off: Autocomplete {
        return Autocomplete("off")
    }
    
    /// Create an autocomplete value for a shipping address field
    public static func shipping(_ detailToken: Token.Address) -> Autocomplete {
        return Autocomplete([.grouping(.shipping), .address(detailToken)])
    }
    
    /// Create an autocomplete value for a billing address field
    public static func billing(_ detailToken: Token.Address) -> Autocomplete {
        return Autocomplete([.grouping(.billing), .address(detailToken)])
    }
    
    /// Create an autocomplete value for a contact field with a specified recipient type
    public static func contact(_ recipientType: RecipientType, _ contactToken: Token.DigitalContact) -> Autocomplete {
        return Autocomplete([.recipientType(recipientType), .contact(contactToken)])
    }
    
    /// Create an autocomplete value for a named section
    public static func section(_ name: String, _ tokens: Autocomplete.Token...) -> Autocomplete {
        var allTokens: [Autocomplete.Token] = [.section(name)]
        allTokens.append(contentsOf: tokens)
        return Autocomplete(allTokens)
    }
}

extension Autocomplete {
    /// Represents the tokens that can be used in the autocomplete attribute
    public enum Token {
        /// Section token for grouping form fields (must be first token)
        case section(String)
        
        /// Grouping identifier for address/contact info
        case grouping(GroupingIdentifier)
        
        /// Recipient type for contact information
        case recipientType(RecipientType)
        
        /// Token for name-related fields
        case name(Autocomplete.Token.Name)
        
        /// Token for address-related fields
        case address(Address)
        
        /// Token for payment-related fields
        case payment(Payment)
        
        /// Token for digital contact information
        case contact(DigitalContact)
        
        /// Other specific tokens
        case other(Other)
        
        /// Web Authentication token (must be last token)
        case webauthn
        
        /// The string value of the token
        public var value: String {
            switch self {
            case .section(let name):
                return "section-\(name)"
            case .grouping(let identifier):
                return identifier.rawValue
            case .recipientType(let type):
                return type.rawValue
            case .name(let token):
                return token.rawValue
            case .address(let token):
                return token.rawValue
            case .payment(let token):
                return token.rawValue
            case .contact(let token):
                return token.rawValue
            case .other(let token):
                return token.rawValue
            case .webauthn:
                return "webauthn"
            }
        }
    }
}

extension Autocomplete {
    /// Grouping identifiers for address/contact information
    public enum GroupingIdentifier: String {
        /// Shipping address or contact information
        case shipping
        
        /// Billing address or contact information
        case billing
    }
}

extension Autocomplete {
    /// Recipient types for contact information
    public enum RecipientType: String {
        /// For contacting at residence
        case home
        
        /// For contacting at work
        case work
        
        /// For contacting regardless of location
        case mobile
        
        /// For fax machines
        case fax
        
        /// For pagers or beepers
        case page
    }
}

extension Autocomplete.Token {
    /// Tokens for name-related fields
    public enum Name: String {
        /// Full name
        case name
        
        /// Title or prefix (Mr., Mrs., Dr., etc.)
        case honorificPrefix = "honorific-prefix"
        
        /// First/given name
        case givenName = "given-name"
        
        /// Middle name
        case additionalName = "additional-name"
        
        /// Last/family name
        case familyName = "family-name"
        
        /// Suffix (Jr., Sr., PhD, etc.)
        case honorificSuffix = "honorific-suffix"
        
        /// Nickname or handle
        case nickname
        
        /// Username or account name
        case username
        
        /// Job title within an organization
        case organizationTitle = "organization-title"
        
        /// Company or organization name
        case organization
    }
}

extension Autocomplete.Token {
    /// Tokens for address-related fields
    public enum Address: String {
        /// Full street address (multiple lines)
        case streetAddress = "street-address"
        
        /// First line of street address
        case addressLine1 = "address-line1"
        
        /// Second line of street address
        case addressLine2 = "address-line2"
        
        /// Third line of street address
        case addressLine3 = "address-line3"
        
        /// Finest-grained administrative level (level 4)
        case addressLevel4 = "address-level4"
        
        /// Third administrative level
        case addressLevel3 = "address-level3"
        
        /// Second administrative level (city/town)
        case addressLevel2 = "address-level2"
        
        /// First administrative level (state/province)
        case addressLevel1 = "address-level1"
        
        /// Country code
        case country
        
        /// Country name
        case countryName = "country-name"
        
        /// Postal/ZIP code
        case postalCode = "postal-code"
    }
}

extension Autocomplete.Token {
    /// Tokens for payment-related fields
    public enum Payment: String {
        /// Full name on payment card
        case ccName = "cc-name"
        
        /// Given (first) name on payment card
        case ccGivenName = "cc-given-name"
        
        /// Middle name on payment card
        case ccAdditionalName = "cc-additional-name"
        
        /// Family (last) name on payment card
        case ccFamilyName = "cc-family-name"
        
        /// Payment card number
        case ccNumber = "cc-number"
        
        /// Payment card expiration date (MM/YY or MM/YYYY)
        case ccExp = "cc-exp"
        
        /// Payment card expiration month
        case ccExpMonth = "cc-exp-month"
        
        /// Payment card expiration year
        case ccExpYear = "cc-exp-year"
        
        /// Payment card security code (CSC/CVV/CVC)
        case ccCsc = "cc-csc"
        
        /// Payment card type (Visa, MasterCard, etc.)
        case ccType = "cc-type"
        
        /// Transaction currency
        case transactionCurrency = "transaction-currency"
        
        /// Transaction amount
        case transactionAmount = "transaction-amount"
    }
}

extension Autocomplete.Token {
    /// Tokens for digital contact information
    public enum DigitalContact: String {
        /// Full telephone number
        case tel
        
        /// Telephone country code
        case telCountryCode = "tel-country-code"
        
        /// Telephone number without country code
        case telNational = "tel-national"
        
        /// Telephone area code
        case telAreaCode = "tel-area-code"
        
        /// Telephone local number
        case telLocal = "tel-local"
        
        /// Telephone local prefix
        case telLocalPrefix = "tel-local-prefix"
        
        /// Telephone local suffix
        case telLocalSuffix = "tel-local-suffix"
        
        /// Telephone extension
        case telExtension = "tel-extension"
        
        /// Email address
        case email
        
        /// Instant messaging protocol endpoint
        case impp
    }
}

extension Autocomplete.Token {
    /// Other specific tokens
    public enum Other: String {
        /// New password (for account creation/password change)
        case newPassword = "new-password"
        
        /// Current password
        case currentPassword = "current-password"
        
        /// One-time password/verification code
        case oneTimeCode = "one-time-code"
        
        /// Preferred language (BCP 47)
        case language
        
        /// Full birth date
        case bday
        
        /// Birth date day
        case bdayDay = "bday-day"
        
        /// Birth date month
        case bdayMonth = "bday-month"
        
        /// Birth date year
        case bdayYear = "bday-year"
        
        /// Gender identity
        case sex
        
        /// URL (homepage, company website)
        case url
        
        /// URL of an image
        case photo
    }
}
