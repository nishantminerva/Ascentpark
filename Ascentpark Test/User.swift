//
//  User.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 27/09/21.
//

import Foundation



struct User : Codable {
    public var user_id : Int
    public var first_name : String
    public var last_name : String
    public var follow : Int
    public var profile_picture : String
    public var user_name : String
    public var followings : Followings
}

extension User: Identifiable {
    var id: Int { return user_id }
}
