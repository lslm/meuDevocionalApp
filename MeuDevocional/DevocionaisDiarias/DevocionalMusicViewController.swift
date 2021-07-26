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
        if recebe == ""{
            //valor default
            recebe = "https://www.youtube.com/watch?v=7SO3ObU99e4&list=RD7SO3ObU99e4&start_radio=1"
        }
        let url = URL(string: recebe)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
