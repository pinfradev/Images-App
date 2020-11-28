//
//  ImagesViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class ImagesViewController: UIViewController {

    var imagesChildView = ImagesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addChildView(view: imagesChildView)
    }
    


}
