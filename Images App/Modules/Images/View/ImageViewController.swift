//
//  ImagesViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class ImageViewController: UIViewController {

    var imagesChildView = ImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addChildView(view: imagesChildView)
    }
    


}
