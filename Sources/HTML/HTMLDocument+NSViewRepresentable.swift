#if canImport(SwiftUI) && os(macOS)
import AppKit
import HTML_Rendering
@preconcurrency import SwiftUI
import WebKit

extension HTML.Document: @retroactive SwiftUI.View where Body: HTML.View, Head: HTML.View {}

extension HTML.Document: SwiftUI.NSViewRepresentable where Body: HTML.View, Head: HTML.View {
    public typealias NSViewType = WKWebView

    public func makeNSView(context: NSViewRepresentableContext<Self>) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")

        let webView = WKWebView(frame: .zero, configuration: configuration)
        loadHTML(into: webView)
        return webView
    }

    public func updateNSView(_ webView: WKWebView, context: NSViewRepresentableContext<Self>) {
        loadHTML(into: webView)
    }

    @MainActor
    private func loadHTML(into webView: WKWebView) {
        let html = (try? String(self)) ?? """
            <!doctype html>
            <html>
            <body style="font-family: system-ui; color: #c00; padding: 20px;">
            <p>Failed to render HTML document</p>
            </body>
            </html>
            """
        webView.loadHTMLString(html, baseURL: nil)
    }
}
#endif
