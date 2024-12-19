public struct HTMLPreview<Head: HTML, Body: HTML>: HTMLDocument {
    public let body: Body
    public let head: Head
    
    public init(
        @HTMLBuilder body: () -> Body,
        @HTMLBuilder head: () -> Head = { HTMLEmpty() }
    ) {
        self.body = body()
        self.head = head()
    }
    
    public init<D: HTMLDocument>(
        @HTMLBuilder document: () -> D
    ) where Head == D.Head, Body == D.Content {
        let document = document()
        self.body = document.body
        self.head = document.head
    }
}

#if os(macOS)
import SwiftUI
import AppKit
import WebKit

extension HTMLPreview: NSViewRepresentable {
    public func makeNSView(context: Context) -> WKWebView {
        WKWebView(
            frame: NSRect(x: 0, y: 0, width: 640, height: 480),
            configuration: WKWebViewConfiguration()
        )
    }
    
    public func updateNSView(_ webView: WKWebView, context: Context) {
        let html = Self {
            body
        } head: {
            head
        }
        let htmlString = String(html: html)
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
#endif

#if canImport(UIKit)
import SwiftUI
import WebKit
extension HTMLPreview: UIViewRepresentable {
    public func makeUIView(context: Context) -> WKWebView {
        WKWebView(
            frame: CGRect(x: 0, y: 0, width: 640, height: 480),
            configuration: WKWebViewConfiguration()
        )
    }
    
    public func updateUIView(_ webView: WKWebView, context: Context) {
        let html = Self {
            body
        } head: {
            head
        }
            
        let htmlString = String(html: html)
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
#endif

