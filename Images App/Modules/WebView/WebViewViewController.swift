//
//  WebViewViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavBar(icon: #imageLiteral(resourceName: "backIcon"), buttonType: .left, target: self, action: #selector(self.goBack))
        self.loadWebSite()
    }
    
    func loadWebSite() {
        if let url = URL(string: self.urlString ?? "") {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

}
