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
    }
    
    func setData(photo: PhotoModel) {
        self.imageDetailView.setInformation(photo: photo)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

}
