//
//  ImagesViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class ImageViewController: UIViewController {

    var imageChildView = ImageView()
    var presenter: ImagePresenterProtocol?
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addChildView(view: imageChildView)
        self.presenter = ImagePresenter(view: self)
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
    }

}

extension ImageViewController: ImageViewProtocol {
    
    func getImagesSucceded(photos: [PhotoModel]) {
        self.imageChildView.activityIndicator.stopAnimating()
        self.imageChildView.loadData(photos: photos)
    }
    
    func getImagesFailed(error: String) {
        self.imageChildView.activityIndicator.stopAnimating()
        self.showAlert(message: error)
    }
    
    
}
