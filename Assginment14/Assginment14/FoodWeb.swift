//
//  FoodWeb.swift
//  Assginment14
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI
import WebKit
struct FoodWeb: UIViewRepresentable {
    typealias UIViewType = WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.food.com") else{return}
        let request = URLRequest(url:url)
        webView.load(request)
    }
}

#Preview {
    FoodWeb()
}
