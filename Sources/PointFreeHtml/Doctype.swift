//
//  DocType.swift
//
//
//  Created by Point-Free, Inc
//

public struct Doctype: HTML {
  public init() {}
  public var body: some HTML {
    HTMLRaw("<!doctype html>")
  }
}
