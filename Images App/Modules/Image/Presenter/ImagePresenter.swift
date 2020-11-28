//
//  ImagePresenter.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

class ImagePresenter: ImagePresenterProtocol {
    var view: ImageViewProtocol?
    let perPage = 10
    
    init(view: ImageViewProtocol) {
        self.view = view
    }
    func getImages(pag: Int) {
        ImageService.getImages(page: pag, perPage: self.perPage, successBlock: { [weak self] (images) in
            
            self?.view?.getImagesSucceded(photos: images)
        }, errorBlock: { [weak self] (error) in
            self?.view?.getImagesFailed(error: error)
        })
    }
    
    
}

