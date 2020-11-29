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
    var presenter: StorePresenterProtocol?
    var currentSection: CurrentSection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = StorePresenter(view: self)
        self.navigationController?.navigationBar.isHidden = false
        self.setNavBar(icon: #imageLiteral(resourceName: "backIcon"), buttonType: .left, target: self, action: #selector(self.goBack))
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.addChildView(view: imageDetailView)
        self.imageDetailView.webButton.addTarget(self, action: #selector(self.openWebView), for: .touchUpInside)
        switch self.currentSection {
        case .some(.photos):
            self.imageDetailView.favoriteButton.setTitle("Agregar a favoritos", for: .normal)
            self.imageDetailView.favoriteButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        case .some(.favorites):
            self.imageDetailView.favoriteButton.setTitle("Eliminar de favoritos", for: .normal)
            self.imageDetailView.favoriteButton.addTarget(self, action: #selector(eliminateFavorite), for: .touchUpInside)
        case .none:
            break
        }
    }
    
    @objc func openWebView() {
        if let vc = VCFactory.getViewController(.webView) as? WebViewViewController {
            if let url = self.currentPhoto?.user?.links?.html {
                vc.urlString = url
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc func addToFavorite() {
        if let photo = self.currentPhoto {
            let encoder = JSONEncoder()
            var dict: [String: Any] = [:]
            do {
                let JSONData = try encoder.encode(photo)
                let dictionary = try JSONSerialization.jsonObject(with: JSONData, options: .allowFragments) as! [String: Any]
                dict = dictionary
            }catch {
                self.showAlert(message: "Ha ocurrido un error")
                return
            }
        self.presenter?.saveNewImage(dict: dict)
        }
    }
    
    @objc func eliminateFavorite() {
        if let photo = self.currentPhoto {
            self.presenter?.deleteFavorite(image: photo)
        }
    }
    
    func setData(photo: PhotoModel) {
        self.imageDetailView.setInformation(photo: photo)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension ImageDetailViewController: StoreViewProtocol  {
    func deletedImageSucceded(message: String) {
        self.showAlert(message: message)
        self.navigationController?.popViewController(animated: true)
    }
    
    func deletedImageFailed(error: String) {
        self.showAlert(message: error)
    }
    
    func saveImageSucceded(message: String) {
        self.showAlert(message: message)
    }
    
    func saveImageFailed(error: String) {
        self.showAlert(message: error)
    }
    
    
}
