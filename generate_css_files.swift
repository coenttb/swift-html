#!/usr/bin/env swift

import Foundation

// Configuration
let cssSourceDir = "/Users/coen/Developer/coenttb/swift-css/Sources/Properties"
let htmlTargetDir = "/Users/coen/Developer/coenttb/swift-html/Sources/HTML+CSS"
let ignoreFiles = ["CSS.Properties.swift", "Property.swift", "All.swift", "Double.swift"]

// Template for generating the HTML+CSS extension files
func generateExtensionContent(propertyName: String) -> String {
    return """
//
//  \(propertyName).swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func \(propertyName.first!.lowercased() + propertyName.dropFirst())(
        _ \(propertyName.first!.lowercased() + propertyName.dropFirst()): Properties.\(propertyName)?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.\(propertyName).property, \(propertyName.first!.lowercased() + propertyName.dropFirst())?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}
"""
}

// Create file manager
let fileManager = FileManager.default

// Get list of all property files
let propertyFiles: [String]
do {
    propertyFiles = try fileManager.contentsOfDirectory(atPath: cssSourceDir)
        .filter { $0.hasSuffix(".swift") && !ignoreFiles.contains($0) }
        .map { $0.components(separatedBy: ".swift")[0] }
} catch {
    print("Error reading directory: \(error)")
    exit(1)
}

// Create target directory if it doesn't exist
if !fileManager.fileExists(atPath: htmlTargetDir) {
    do {
        try fileManager.createDirectory(atPath: htmlTargetDir, withIntermediateDirectories: true)
    } catch {
        print("Error creating directory: \(error)")
        exit(1)
    }
}

// Generate extension files
var createdFiles = 0
var existingFiles = 0

for propertyName in propertyFiles {
    let targetPath = "\(htmlTargetDir)/\(propertyName).swift"
    
    // Skip if file already exists
    if fileManager.fileExists(atPath: targetPath) {
        existingFiles += 1
        continue
    }
    
    // Generate and write file
    let fileContent = generateExtensionContent(propertyName: propertyName)
    do {
        try fileContent.write(toFile: targetPath, atomically: true, encoding: .utf8)
        createdFiles += 1
    } catch {
        print("Error writing file \(propertyName).swift: \(error)")
    }
}

print("Generated \(createdFiles) files, \(existingFiles) already existed.")