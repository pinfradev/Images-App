//
//  ImageDetail.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import UIKit

class ImageDetailViewController: UIViewController {

    var currentPhoto: PhotoModel?
    var imageDetailView = ImageDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.setNavBar(icon: #imageLiteral(resourceName: "backIcon"), buttonType: .left, target: self, action: #selector(self.goBack))
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.addChildView(view: imageDetailView)
        self.imageDetailView.webButton.addTarget(self, action: #selector(self.openWebView), for: .touchUpInside)
    }
    
    @objc func openWebView() {
        if let vc = VCFactory.getViewController(.webView) as? WebViewViewController {
            if let url = self.currentPhoto?.user?.links?.html {
                vc.urlString = url
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func setData(photo: PhotoModel) {
        self.imageDetailView.setInformation(photo: photo)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

}
