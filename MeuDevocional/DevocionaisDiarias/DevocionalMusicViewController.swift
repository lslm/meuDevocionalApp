//
//  DevocionalMusicViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 23/07/21.
//

import UIKit
import WebKit

class DevocionalMusicViewController: UIViewController,WKNavigationDelegate {
    var recebe = ""
    
    
    var webView: WKWebView!
    override func loadView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: recebe)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
