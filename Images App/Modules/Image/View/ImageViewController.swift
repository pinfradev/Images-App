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
    var paginationManager: VerticalPaginationManager?
    var totalPhotos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addChildView(view: imageChildView)
        self.presenter = ImagePresenter(view: self)
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
        self.paginationManager = VerticalPaginationManager(scrollView: self.imageChildView.collectionView)
        self.paginationManager?.delegate = self
    }

}

extension ImageViewController: ImageViewProtocol {
    
    func getImagesSucceded(photos: [PhotoModel]) {
        self.imageChildView.activityIndicator.stopAnimating()
        if photos.count > 0 {
            self.totalPhotos.append(contentsOf: photos)
            self.currentPage += 1
            self.imageChildView.loadData(photos: photos)
        }
    }
    
    func getImagesFailed(error: String) {
        self.imageChildView.activityIndicator.stopAnimating()
        self.showAlert(message: error)
    }
    
    
}

extension ImageViewController: VerticalPaginationManagerDelegate {
    func refreshAll(completion: @escaping (Bool) -> Void) {
        print("refresh")
        self.currentPage = 1
        self.totalPhotos.removeAll()
        self.imageChildView.imagesToShow.removeAll()
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
        completion(true)
    }
    
    func loadMore(completion: @escaping (Bool) -> Void) {
        print("##########loadMore")
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
        completion(true)
    }
    
    
}
