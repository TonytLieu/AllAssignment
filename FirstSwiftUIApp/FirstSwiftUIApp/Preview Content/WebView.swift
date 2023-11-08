//
//  WebView.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.apple.com/") else{return}
        let request = URLRequest(url:url)
        webView.load(request)
    }
}

#Preview {
    WebView()
}
