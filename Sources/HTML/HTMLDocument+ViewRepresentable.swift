#if canImport(SwiftUI)
#if os(macOS)
import AppKit
#endif
import HTML_Rendering
@preconcurrency import SwiftUI
import WebKit

// MARK: - Shared Implementation

private extension HTML.Document where Body: HTML.View, Head: HTML.View {
    @MainActor
    func makeWebView() -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")

        let webView = WKWebView(frame: .zero, configuration: configuration)
        loadHTML(into: webView)
        return webView
    }

    @MainActor
    func loadHTML(into webView: WKWebView) {
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

// MARK: - macOS

#if os(macOS)
extension HTML.Document: @retroactive SwiftUI.View where Body: HTML.View, Head: HTML.View {}

extension HTML.Document: SwiftUI.NSViewRepresentable where Body: HTML.View, Head: HTML.View {
    public typealias NSViewType = WKWebView

    public func makeNSView(context: NSViewRepresentableContext<Self>) -> WKWebView {
        makeWebView()
    }

    public func updateNSView(_ webView: WKWebView, context: NSViewRepresentableContext<Self>) {
        loadHTML(into: webView)
    }
}

// MARK: - iOS

#elseif os(iOS)
extension HTML.Document: @retroactive SwiftUI.View where Body: HTML.View, Head: HTML.View {}

extension HTML.Document: SwiftUI.UIViewRepresentable where Body: HTML.View, Head: HTML.View {
    public typealias UIViewType = WKWebView

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> WKWebView {
        makeWebView()
    }

    public func updateUIView(_ webView: WKWebView, context: UIViewRepresentableContext<Self>) {
        loadHTML(into: webView)
    }
}
#endif
#endif
