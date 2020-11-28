//
//  ImagesViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class ImageViewController: UIViewController {

    var imagesChildView = ImageView()
    var presenter: ImagePresenterProtocol?
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addChildView(view: imagesChildView)
        self.presenter = ImagePresenter(view: self)
        self.presenter?.getImages(pag: self.currentPage)
    }

}

extension ImageViewController: ImageViewProtocol {
    
    func getImagesSucceded(photos: [PhotoModel]) {
        print(photos)
    }
    
    func getImagesFailed(error: String) {
        print(error)
    }
    
    
}
