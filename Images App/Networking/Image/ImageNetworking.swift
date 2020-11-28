//
//  ImageNetworking.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import Alamofire

enum ImageNetworking {
    case getImages(pag: Int, perPage: Int)
}

extension ImageNetworking: RequestType  {
    var basicUrl: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .getImages(let page, let perPage):
            return "/photos?page=\(page)&per_page=\(perPage)"
        }
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var parameters: RequestParameter {
        return .none
    }
    
    var headers: HTTPHeaders? {
        return Header.getHeaders()
    }
    
    
}
