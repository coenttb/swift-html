//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation

//download
//Causes the browser to treat the linked URL as a download. Can be used with or without a filename value:
//
//Without a value, the browser will suggest a filename/extension, generated from various sources:
//The Content-Disposition HTTP header
//The final segment in the URL path
//The media type (from the Content-Type header, the start of a data: URL, or Blob.type for a blob: URL)
//filename: defining a value suggests it as the filename. / and \ characters are converted to underscores (_). Filesystems may forbid other characters in filenames, so browsers will adjust the suggested name if necessary.
//Note:
//download only works for same-origin URLs, or the blob: and data: schemes.
//How browsers treat downloads varies by browser, user settings, and other factors. The user may be prompted before a download starts, or the file may be saved automatically, or it may open automatically, either in an external application or in the browser itself.
//If the Content-Disposition header has different information from the download attribute, resulting behavior may differ:
//If the header specifies a filename, it takes priority over a filename specified in the download attribute.
//If the header specifies a disposition of inline, Chrome and Firefox prioritize the attribute and treat it as a download. Old Firefox versions (before 82) prioritize the header and will display the content inline.
