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
        self.imageChildView.setupUI(section: .photos)
        self.imageChildView.delegate = self
        self.presenter = ImagePresenter(view: self)
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
        self.paginationManager = VerticalPaginationManager(scrollView: self.imageChildView.collectionView)
        self.paginationManager?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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
        self.currentPage = 1
        self.totalPhotos.removeAll()
        self.imageChildView.imagesToShow.removeAll()
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
        completion(true)
    }
    
    func loadMore(completion: @escaping (Bool) -> Void) {
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getImages(pag: self.currentPage)
        completion(true)
    }
}

extension ImageViewController: ImageSelectionDelegate {
    func imageSelected(photo: PhotoModel) {
        if let vc = VCFactory.getViewController(.imageDetail) as? ImageDetailViewController {
            vc.currentPhoto = photo
            vc.setData(photo: photo)
            vc.currentSection = .photos
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
}
