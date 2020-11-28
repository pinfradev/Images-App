//
//  APIBasis.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import Alamofire

class APIBasis<T: RequestType> {
    
    
    func basicRequest<M: Decodable>(requestType: T,
                                    responseClass: M.Type,
                                    completion: @escaping (Result<M, NSError>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: requestType.method.rawValue)
        let headers = requestType.headers
        let parameters = self.getParameters(for: requestType.parameters)
        let url = requestType.basicUrl + requestType.path
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: headers).responseJSON { (response) in
                        self.sendRequestResult(requestType: requestType,
                        response: response,
                        completion: completion)
                   }
    }
    
    private func sendRequestResult<M: Decodable>(requestType: T,
                                                 response: AFDataResponse<Any>,
                                                 completion: @escaping (Result<M, NSError>) -> Void) {
        guard let statusCode = response.response?.statusCode else {
            let error = NSError(domain: requestType.basicUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorHandler.generalError])
            completion(.failure(error))
            return
        }
        
        switch statusCode {
        case 200...290:
            guard let jsonResponse = try? response.result.get() else {
                let error = NSError(domain: requestType.basicUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorHandler.generalError])
                completion(.failure(error))
                return
            }
            let JSONData: Data
            do {
                JSONData = try JSONSerialization.data(withJSONObject: jsonResponse, options: [])
            } catch let error as NSError {
                completion(.failure(error))
                return
            }
            
            do {
                let object = try JSONDecoder().decode(M.self, from: JSONData)
                completion(.success(object))
            } catch let error as NSError {
                completion(.failure(error))
            }
        default:
            let message = "Error de request"
            let error = NSError(domain: requestType.basicUrl, code: statusCode, userInfo: [NSLocalizedDescriptionKey: message])
            completion(.failure(error))
        }
        
    }
    private func getParameters(for type: RequestParameter) -> Parameters {
        switch type {
        case .none:
            return [:]
        }
    }
}
