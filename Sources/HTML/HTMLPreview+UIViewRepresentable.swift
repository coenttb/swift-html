#if canImport(UIKit)
import SwiftUI
import WebKit

extension HTMLDocument: @retroactive View {}
extension HTMLDocument: @retroactive UIViewRepresentable {
    public func makeUIView(context: Context) -> WKWebView {
        WKWebView(
            frame: CGRect(x: 0, y: 0, width: 640, height: 480),
            configuration: WKWebViewConfiguration()
        )
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {
        let htmlString = (try? String(self)) ?? "HTML could not be parsed into a String"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
#endif
