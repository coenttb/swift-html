#if os(macOS)
import SwiftUI
import AppKit
import WebKit
import HTML_CSS_PointFreeHTML

extension HTMLDocument: @retroactive View {}
extension HTMLDocument: @retroactive NSViewRepresentable {
    public func makeNSView(context: Context) -> WKWebView {
        WKWebView(
            frame: NSRect(x: 0, y: 0, width: 640, height: 480),
            configuration: WKWebViewConfiguration()
        )
    }
    
    public func updateNSView(_ webView: WKWebView, context: Context) {
        let htmlString = (try? String(self)) ?? "HTML could not be parsed into a String"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
#endif
