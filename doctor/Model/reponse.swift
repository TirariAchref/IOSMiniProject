//
//  reponse.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct Reponse : Decodable{
    
    let _id : String?
    let description : String?
    let idUser : String?
    let idQuestion : String?
    private  enum CodingKeys: String, CodingKey {
     
          case _id, description,idUser,idQuestion
       }
      
   
   
}
