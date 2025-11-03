//
//  AppleEmailFormat.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 21/07/2025.
//

import Foundation

public struct AppleEmail: CustomStringConvertible {
    private let htmlContent: String
    private let from: String
    private let subject: String
    private let date: Date

    private let boundaryUUID: String
    private let messageUUID: String
    private let universalUUID: String

    public init(
        htmlContent: String,
        from: String,
        subject: String = "",
        date: Date = Date(),
        boundary: String = UUID().uuidString,
        message: String = UUID().uuidString,
        universal: String = UUID().uuidString
    ) {
        self.htmlContent = htmlContent
        self.from = from
        self.subject = subject
        self.date = date

        self.boundaryUUID = boundary
        self.messageUUID = message
        self.universalUUID = universal
    }

    public init(
        emailDocument: any EmailDocument,
        from: String,
        subject: String = "",
        date: Date = Date()
    ) {
        self.htmlContent = try! String(emailDocument)
        self.from = from
        self.subject = subject
        self.date = date

        self.boundaryUUID = UUID().uuidString
        self.messageUUID = UUID().uuidString
        self.universalUUID = UUID().uuidString
    }

    public var description: String { emlContent }

    private var emlContent: String {
        let plainTextContent = try! String(htmlContent, stripHTML: true)

        return """
      Content-Type: multipart/alternative;
          boundary="Apple-Mail=_\(boundaryUUID)"
      Subject: \(subject)
      Mime-Version: 1.0 (Mac OS X Mail 16.0 \\(3826.700.71\\))
      X-Apple-Base-Url: x-msg://1/
      X-Universally-Unique-Identifier: \(universalUUID)
      X-Apple-Mail-Remote-Attachments: YES
      From: \(from)
      X-Apple-Windows-Friendly: 1
      Date: \(dateFormatter.string(from: date))
      X-Apple-Mail-Signature:
      Message-Id: <\(messageUUID)@\(emailDomain)>
      X-Uniform-Type-Identifier: com.apple.mail-draft


      --Apple-Mail=_\(boundaryUUID)
      Content-Transfer-Encoding: 7bit
      Content-Type: text/plain;
          charset=us-ascii

      \(plainTextContent)

      --Apple-Mail=_\(boundaryUUID)
      Content-Transfer-Encoding: 7bit
      Content-Type: text/html;
          charset=us-ascii

      \(htmlContent)
      --Apple-Mail=_\(boundaryUUID)--
      """
    }

    private var emailDomain: String {
        from.components(separatedBy: "@").last ?? "example.com"
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}
