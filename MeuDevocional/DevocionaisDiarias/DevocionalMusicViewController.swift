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
        //
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        //view.addSubview(webView)
        //webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        let url = URL(string: recebe)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
