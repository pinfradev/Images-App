//
//  PhotoModel.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation

struct PhotoModel: Codable {
    var documentId: String?
    var id: String
    var urls: UrlModel?
    var likes: Int?
    var user: UserModel?
    var description: String?
}

struct UrlModel: Codable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
}
