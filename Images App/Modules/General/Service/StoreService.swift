//
//  DatabaseService.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import Foundation
import Firebase

class StoreService {
    
    class func saveNewImage(dict: [String: Any], successBlock: @escaping (_ message: String) -> (), errorBlock: @escaping (_ error: String) -> ()) {
        let db = Firestore.firestore()
        db.collection("images").addDocument(data: dict, completion: { error in
            if let err = error {
                errorBlock(err.localizedDescription)
            } else {
                successBlock("Agregado con éxito")
            }
        })
    }
    
    class func deleteImage(object: PhotoModel, successBlock: @escaping (_ message: String) -> (), errorBlock: @escaping (_ error: String) -> ()) {
        let db = Firestore.firestore()
        if let documentId = object.documentId {
            db.collection("images").document(documentId).delete()
            successBlock("eliminado con exito")
        } else {
            errorBlock("Ha ocurrido un error")
        }
    }
    
}
