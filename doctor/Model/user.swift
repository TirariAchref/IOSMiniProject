//
//  user.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct UsersData : Decodable{
    let users : [User]?
    private  enum CodingKeys: String, CodingKey {
     
          case users = "results"
       }
}

struct User : Decodable {
    let _id :   String?
    let nom : String?
    let prenom :String?
    let email : String?
    let password : String?
    let phone : String?
    let log : String?
    let lat : String?
    let categorieclient : String?
    let imageUrl : String?
    
  private  enum CodingKeys: String, CodingKey {
   
        case _id, email,nom,prenom,password,phone,categorieclient,imageUrl,log,lat
     }
    
   
 
}
