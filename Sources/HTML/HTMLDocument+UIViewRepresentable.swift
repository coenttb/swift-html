#if canImport(UIKit) && !os(macOS)
import PointFreeHTML
import SwiftUI
import WebKit

extension HTMLDocument: @retroactive SwiftUI.View {}
extension HTMLDocument: SwiftUI.UIViewRepresentable {
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        webView.loadHTMLString(self.html, baseURL: nil)
        return webView
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {}
}
#endif
