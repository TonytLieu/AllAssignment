//
//  WebViewController.swift
//  Lol Page
//
//  Created by Tony Lieu on 11/1/23.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlBan = URL(string: "www.youtube.com")
    var host:String = "https://imgflip.com/memegenerator"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebIn(address: "https://imgflip.com/memegenerator")
        // Do any additional setup after loading the view.
    }
    func loadWebIn(address:String){
        guard let url = URL(string: address) else{return}
        let request = URLRequest(url:url)
        webView.load(request)
        
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WebViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host {
            if host.contains("www.open.com") {
                decisionHandler(.allow)
            }
        }
        decisionHandler(.cancel)
    }
}

