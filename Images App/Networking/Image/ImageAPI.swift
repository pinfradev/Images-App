//
//  ImageAPI.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation

class ImageAPI: APIBasis<ImageNetworking> {
    
    private static var sharedImageAPI: ImageAPI = {
        let imageApi = ImageAPI()
        return imageApi
    }()
    
    class func shared() -> ImageAPI {
        return self.sharedImageAPI
    }
    
    func getAllImages(page: Int,
                      perPage: Int,
                      completion: @escaping (Result<[PhotoModel], NSError>) -> Void) {
        self.basicRequest(requestType: .getImages(pag: page, perPage: perPage),        responseClass: [PhotoModel].self) { (result) in
            
            switch result {
            case .success(let photoModel):
                completion(.success(photoModel))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
