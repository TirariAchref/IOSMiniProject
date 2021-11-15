//
//  messagerie.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct messagerie {
    let idMessagerie : Int
    let Message : String
    let Object : String
    let DateCreation : Date
    let to : User
    let user : User
    init(idMessagerie : Int,
          Message : String,
          Object : String,
          DateCreation : Date,
          to : User,
          user : User)
    {
        self.idMessagerie = idMessagerie
        self.Message = Message
        self.Object = Object
        self.DateCreation = DateCreation
        self.to = to
        self.user = user
        
    }
    
}
