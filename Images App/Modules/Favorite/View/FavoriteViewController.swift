//
//  FavoriteViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import UIKit

class FavoriteViewController: UIViewController {
    var imageChildView = ImageView()
//    var paginationManager: VerticalPaginationManager?
    var totalPhotos = [PhotoModel]()
    var presenter: FavoritePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addChildView(view: imageChildView)
        self.imageChildView.setupUI(section: .favorites)
        self.imageChildView.delegate = self
        self.presenter = FavoritePresenter(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.imageChildView.imagesToShow.removeAll()
        self.imageChildView.activityIndicator.startAnimating()
        self.presenter?.getFavorites()
    }

}

extension FavoriteViewController: ImageSelectionDelegate {
    func imageSelected(photo: PhotoModel) {
        if let vc = VCFactory.getViewController(.imageDetail) as? ImageDetailViewController {
            vc.currentPhoto = photo
            vc.setData(photo: photo)
            vc.currentSection = .favorites
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

extension FavoriteViewController: FavoriteDelegate {
    func getFavoriteSuccess(favorites: [PhotoModel]) {
        self.imageChildView.activityIndicator.stopAnimating()
        if favorites.count > 0 {
            self.totalPhotos.append(contentsOf: favorites)
            self.imageChildView.loadData(photos: favorites)
        } else {
            self.imageChildView.loadData(photos: favorites)
            self.showAlert(message: "No has agregado favoritos. No te preocupes! Puedes hacerlo en el detalle de cada imagen")
        }
    }
    
    func getFavoriteFailed(error: String) {
        self.imageChildView.activityIndicator.stopAnimating()
        self.showAlert(message: error)
    }
    
    
}

