//
//  getImageService.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import Foundation
import Firebase

class GetImageService {
    
    class func getImages(successBlock: @escaping (_ vehicles: [PhotoModel]) -> (), errorBlock: @escaping (_ error: String) -> ()) {
        let db = Firestore.firestore()
        var photosArray: [PhotoModel] = []
        db.collection("images").getDocuments() { (result, err) in
            if let err = err {
                errorBlock("\(err)")
                return
            }
            for document in result!.documents {
                let documentArray = document.data()
                let decoder = JSONDecoder()
                do {
                    let data = try JSONSerialization.data(withJSONObject: documentArray, options: [])
                    var object = try decoder.decode(PhotoModel.self, from: data)
                    object.documentId = document.documentID
                    photosArray.append(object)
                } catch let error {
                    errorBlock(error.localizedDescription)
                }
                
            }
            
            successBlock(photosArray)
        }
    }
    
    
    
}
