//
//  UserTag.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 28/09/21.
//

import Foundation


struct UserTag : Codable, Identifiable {
    public var id : Int
    public var tag : Tag
}
