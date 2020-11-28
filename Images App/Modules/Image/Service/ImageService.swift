//
//  ImagesService.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import Alamofire

class ImageService {
    
    class func getImages(page: Int, perPage: Int, successBlock: @escaping ([PhotoModel]) -> Void, errorBlock: @escaping (String) -> Void) {
        
        ImageAPI.shared().getAllImages(page: page, perPage: perPage) { (result) in
            switch result {
            case .success(let response):
                successBlock(response)
                return
            case .failure(let error):
                errorBlock(error.localizedDescription)
                return
            }
                
        }
    }
}
