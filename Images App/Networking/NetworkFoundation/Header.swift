//
//  Header.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import Alamofire

class Header {
    static func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Authorization" : "Client-ID kvPUApv0N6YInKptT3fmCq6EeM-yEflHLbMQJE4_ni8"
        ]
        return headers
    }
}
