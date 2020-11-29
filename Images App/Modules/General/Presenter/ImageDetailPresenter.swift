//
//  ImageDetailPresenter.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import Foundation

class StorePresenter {
    
    var view: StoreViewProtocol?
    
    init(view: StoreViewProtocol) {
        self.view = view
    }
}

extension StorePresenter: StorePresenterProtocol {
    
    
    func saveNewImage(dict: [String : Any]) {
        StoreService.saveNewImage(dict: dict, successBlock: {[weak self] message in
            self?.view?.saveImageSucceded(message: message)
        }, errorBlock: {[weak self] error in
            self?.view?.saveImageFailed(error: error)
        })
    }
    
    func deleteFavorite(image: PhotoModel) {
        StoreService.deleteImage(object: image, successBlock: { [weak self] message in
            self?.view?.deletedImageSucceded(message: message)
        }, errorBlock: { [weak self] error in
            self?.view?.deletedImageFailed(error: error)
        })
    }
    
    
}
