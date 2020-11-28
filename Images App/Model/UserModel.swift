//
//  UserModel.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation

struct UserModel: Codable {
    var id: String
    var username: String?
    var name: String?
    var bio: String?
    var profileImage: ProfileImage?
    var totalLikes: Int?
    var totalPhotos: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case bio
        case profileImage = "profile_image"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
    }
}

struct ProfileImage: Codable {
    var medium: String?
}
