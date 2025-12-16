////
////  File.swift
////  coenttb-html
////
////  Created by Coen ten Thije Boonkkamp on 03/07/2025.
////
//
// import Foundation
// import HTML
//
// public struct Circle: HTML.View {
//
//    let content: any HTML.View
//
//    public var width: String
//    public var height: String
//
//    public init(
//        width: String = "10rem",
//        height: String = "10rem",
//        @HTML.Builder content: @escaping () -> any HTML.View
//    ) {
//        self.content = content()
//        self.width = width
//        self.height = height
//    }
//
//    public init(
//        size: String,
//        @HTML.Builder content: @escaping () -> any HTML.View
//    ) {
//        self.content = content()
//        self.width = size
//        self.height = size
//    }
//
//    public var body: some HTML.View {
//        let anyContent: HTML.AnyView = .init(content)
//        let innerContent = anyContent
//            .inlineStyle("object-fit", "cover")
//            .inlineStyle("height", "100%")
//            .inlineStyle("width", "100%")
//            .inlineStyle("max-width", "100%")
//            .inlineStyle("border-style", "none")
//
//        let innerDiv = div { innerContent }
//            .inlineStyle("position", "absolute")
//            .inlineStyle("width", "100%")
//            .inlineStyle("height", "100%")
//            .inlineStyle("display", "block")
//
//        let clipDiv = div { innerDiv }
//            .inlineStyle("clip-path", "circle(50%)")
//            .inlineStyle("position", "relative")
//            .inlineStyle("width", width)
//            .inlineStyle("height", height)
//
//        return div { clipDiv }
//    }
// }
