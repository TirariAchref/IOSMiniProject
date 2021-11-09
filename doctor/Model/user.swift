//
//  user.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation

struct Root : Codable{
    let user :[User]
    
}

struct User : Codable {
    let id : String
    let nom : String
    let prenom :String
    let email : String
    let password : String
    let phone : String
    let categorielient : String
}
