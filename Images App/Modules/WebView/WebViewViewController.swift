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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.setNavBar(icon: UIImage(named: Images.backIcon)?.withRenderingMode(.alwaysOriginal), buttonType: .left, target: self, action: #selector(self.goBack),Color: .black)
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
