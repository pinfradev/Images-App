//
//  ImageProtocols.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation

protocol ImageViewProtocol {
    
    var presenter: ImagePresenterProtocol? { get set}
    
    func getImagesSucceded(photos: [PhotoModel])
    func getImagesFailed(error: String)
}

protocol ImagePresenterProtocol {
    
    var view: ImageViewProtocol? { get set}
    
    func getImages(pag: Int)
}

