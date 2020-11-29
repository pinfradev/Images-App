//
//  DatabaseProtocols.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import Foundation

protocol StoreViewProtocol {
    
    var presenter: StorePresenterProtocol? { get set}
    
    func saveImageSucceded(message: String)
    func saveImageFailed(error: String)
    
    func deletedImageSucceded(message: String)
    func deletedImageFailed(error: String)
}

protocol StorePresenterProtocol {
    
    var view: StoreViewProtocol? { get set}
    
    func saveNewImage(dict: [String: Any])
    
    func deleteFavorite(image: PhotoModel)
    
    func verifyFavoriteImage(imageId: String) -> Bool
}
