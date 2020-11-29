//
//  FavoritePresenter.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import Foundation

protocol FavoriteDelegate {
    func getFavoriteSuccess(favorites: [PhotoModel])
    func getFavoriteFailed(error: String)
}

class FavoritePresenter {
    
    var view: FavoriteDelegate?
    
    init(view: FavoriteDelegate) {
        self.view = view
    }
        
    func getFavorites() {
        GetImageService.getImages(successBlock: { [weak self] (favorites) in
            self?.view?.getFavoriteSuccess(favorites: favorites)
        }, errorBlock: {[weak self] error in
            self?.view?.getFavoriteFailed(error: error)
        })
    }
    
}
