//
//  User.swift
//  Demo WatchKit Extension
//
//  Created by Bas van Kuijck on 26/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation

//{
//    "data": {
//        "id": 2,
//        "email": "janet.weaver@reqres.in",
//        "first_name": "Janet",
//        "last_name": "Weaver",
//        "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
//    }
//}
class User: Codable, Identifiable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarURL = "avatar"
    }

    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatarURL: URL?

    var description: String {
        return "<User> [ id: \(id), email: \(email) ]"
    }
}
